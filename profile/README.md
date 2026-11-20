# Xynolog

An open-source, self-hostable stack for knowledge bases that people and AI
agents build together. Every annotation, link and generated resource is an
event on the knowledge base's own record, so each one shows who made it and
what it rests on.

**Build a shared understanding from the sources themselves.**

## Try it

```sh
brew install xynolog/xynolog/xynolog
```

Then, inside a git repository:

```sh
xynolog init --yes --inference anthropic --embedding ollama:nomic-embed-text
xynolog start
```

`xynolog init` creates a knowledge base in the repository, and `xynolog start`
runs the whole stack on your machine with Apple `container`, Docker or Podman.
The [CLI's README](https://github.com/xynolog/cli#readme) covers the options.

## Repositories

| Repository | What it holds |
| --- | --- |
| [.github](https://github.com/xynolog/.github) | Organization-wide community files, shared workflows, and repository settings |
| [build-tools](https://github.com/xynolog/build-tools) | Build scripts the repositories share |
| [cli](https://github.com/xynolog/cli) | `xynolog`, which brings up a full local stack in one command |
| [docs](https://github.com/xynolog/docs) | Guides for analysts, builders, operators, and contributors |
| [homebrew-xynolog](https://github.com/xynolog/homebrew-xynolog) | The Homebrew tap |
| [images](https://github.com/xynolog/images) | Xynolog service images and supporting code, including the Browser |
| [kb-template](https://github.com/xynolog/kb-template) | A starter knowledge base for the Xynolog launcher |
| [protocol](https://github.com/xynolog/protocol) | The wire contracts: OpenAPI definitions, registries, schemas, and a conformance kit any implementation can run |
| [sdk](https://github.com/xynolog/sdk) | Client SDKs in nine languages: TypeScript, Python, Rust, Go, C#, Kotlin, Swift, Haskell and OCaml |

## Contributing

Read [CONTRIBUTING.md](https://github.com/xynolog/.github/blob/main/CONTRIBUTING.md)
first. Report security issues as
[SECURITY.md](https://github.com/xynolog/.github/blob/main/SECURITY.md) describes,
not in a public issue.
