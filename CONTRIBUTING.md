# Contributing

Changes reach `main` only through a pull request. A pull request merges when
its CI Gate passes, through the merge queue where the repository has one, as
one squash commit.

## Sign off every commit

Every commit carries a `Signed-off-by` line with its author's name and email,
which `git commit -s` adds:

    Signed-off-by: Your Name <you@example.com>

By signing off you certify the [Developer Certificate of
Origin](https://developercertificate.org): that you wrote the change, or
otherwise have the right to submit it under the repository's licence. CI
checks every commit of a pull request, and fails on one without it. To sign
off commits you have already made, `git rebase --signoff main`.

## Sign every commit

Commits to `main` must be signed (with GPG, SSH or S/MIME), so sign yours:
[GitHub's guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).

## Report a security problem privately

See [SECURITY.md](SECURITY.md).
