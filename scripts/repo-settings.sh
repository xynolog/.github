#!/usr/bin/env bash
# Set the merge settings every xynolog repository shares (github-org-policy
# P7), on the repositories named, or on every repository in the org. GitHub has
# no org-level form of these, so this is how they are held alike: run it after
# a repository is created or a setting changes. It needs only a token that can
# administer the repositories (gh's `repo` scope).
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
done
