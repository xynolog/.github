# xynolog/.github

The xynolog org's defaults. GitHub shows the community files here
(SECURITY.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md, the pull request
template and the issue template configuration) in every xynolog repository
that has none of its own.

| | What it is |
|---|---|
| `profile/README.md` | The org's profile page, shown at github.com/xynolog |
| `.github/workflows/dco.yml` | The DCO check: every commit of a pull request is signed off by its author. Each repository's CI calls it, pinned by commit, from a job its CI Gate waits for |
| `.github/workflows/labels.yml` | The labels every repository has (bug, enhancement, documentation, dependencies, security, refactor, ci), and no others: on a push to main it sets them and deletes the rest. Each repository's CI calls it, pinned by commit |
| `scripts/repo-settings.sh` | Sets the merge settings every repository shares (squash only, branches deleted after merge, update branch on, auto-merge off). Run it by hand after a repository is created or a setting changes |

The policy these carry out is the org's GitHub policy plan.
