# xynolog/.github

The xynolog org's defaults. GitHub shows the community files here
(SECURITY.md, CONTRIBUTING.md, CODE_OF_CONDUCT.md, the pull request
template and the issue template configuration) in every xynolog repository
that has none of its own.

| | What it is |
|---|---|
| `profile/README.md` | The org's profile page, shown at github.com/xynolog |
| `.github/workflows/dco.yml` | The DCO check: every commit of a pull request is signed off by its author. Each repository's CI calls it, pinned by commit, from a job its CI Gate waits for |
| `.github/workflows/labels.yml` | The labels every repository has, and no others: on a push to main it sets them and deletes the rest. Each repository's CI calls it, pinned by commit |

The reusable workflows enforce policy in CI. Organization-wide repository settings are managed separately.
