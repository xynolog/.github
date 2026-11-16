#!/usr/bin/env bash
# Set the repository settings every xynolog repository shares (github-org-policy
# P7), on the repositories named, or on every repository in the org. GitHub has
# no org-level form of these, so this is how they are held alike: run it after
# a repository is created or a setting changes. It needs a token that can
# administer the repositories (a classic token's `repo` scope).
#
#   scripts/repo-settings.sh [repository ...]
set -euo pipefail

org=xynolog
if (($#)); then
  repositories=("$@")
else
  repositories=()
  while read -r repository; do repositories+=("$repository"); done \
    < <(gh repo list "$org" --limit 200 --no-archived --json name --jq '.[].name')
fi

for repository in "${repositories[@]}"; do
  gh api --method PATCH "repos/$org/$repository" \
    -F allow_squash_merge=true \
    -F allow_merge_commit=false \
    -F allow_rebase_merge=false \
    -F allow_auto_merge=false \
    -F allow_update_branch=true \
    -F delete_branch_on_merge=true \
    -f squash_merge_commit_title=COMMIT_OR_PR_TITLE \
    -f squash_merge_commit_message=COMMIT_MESSAGES \
    --jq '"\(.name): squash only, branches deleted after merge, update branch on, auto-merge off"'

  if pages_state=$(gh api "repos/$org/$repository/pages" \
    --jq 'if (.cname // "") == "" then "no-custom-domain" elif .https_certificate.state == "approved" then "approved" else "certificate-not-ready" end' 2>&1); then
    case "$pages_state" in
      approved)
        gh api --method PUT "repos/$org/$repository/pages" \
          -F https_enforced=true \
          --silent
        printf '%s: GitHub Pages HTTPS enforced (certificate approved)\n' "$repository"
        ;;
      no-custom-domain)
        printf '%s: GitHub Pages has no custom domain; HTTPS setting unchanged\n' "$repository"
        ;;
      certificate-not-ready)
        printf '%s: GitHub Pages certificate is not approved; HTTPS enforcement skipped\n' "$repository"
        ;;
    esac
  elif [[ "$pages_state" == *"(HTTP 404)"* ]]; then
    printf '%s: GitHub Pages is not enabled; HTTPS setting skipped\n' "$repository"
  else
    printf '%s: could not read GitHub Pages settings: %s\n' "$repository" "$pages_state" >&2
    exit 1
  fi
done
