# Repository Guidelines

## Project Structure & Module Organization
- Core utilities live in dedicated directories (`choose-root-branch`, `gojira`, `pushcommit`, `rebasepro`, `switchbranch`), each pairing a primary zsh script with a README documenting usage and options.
- `git_alias` houses sample Git configuration snippets; keep dotfile-friendly naming and avoid executable bits here.
- `bin/` is reserved for locally linked entrypoints; use `bash setup.sh` to refresh symlinks into `~/bin` after adding or renaming scripts.
- Update the relevant directory README whenever a script gains new flags, behaviour, or dependencies; mirror any shared logic changes across sibling tools to prevent drift.

## Build, Test, and Development Commands
- `bash setup.sh` – recreate symlinks for all supported utilities so they are callable from your shell.
- `bash -n path/to/script` – run a POSIX syntax check before every commit; prefer the script's directory version, not the symlink.
- `shellcheck path/to/script` – lint for common shell pitfalls when available; address warnings or note justified suppressions inline.

## Coding Style & Naming Conventions
- Start executable files with `#!/bin/zsh`, but keep constructs POSIX-compatible unless a feature is essential.
- Use two-space indentation, favour descriptive function names (e.g., `select_root_branch`) and keep variables lowercase with underscores; reserve uppercase for exported environment variables.
- Group related helper functions together and add brief comments only where intent is non-obvious.

## Testing Guidelines
- There are no automated suites; rely on targeted manual runs (e.g., `ZSH_NAME=zsh ./rebasepro/rebasepro --help`) against representative repositories.
- When adding flags or interactive flows, capture expected prompts in the directory README and sanity-check both success and failure paths.

## Commit & Pull Request Guidelines
- Write short, imperative commit messages (e.g., `Add cached root branch prompt`). Squash fix-up commits locally before raising PRs.
- PRs should describe the workflow problem solved, enumerate major script changes, and link to any related tickets; attach terminal transcripts or asciicasts when behaviour is hard to infer from code.
- Highlight any new environment requirements or configuration steps so reviewers can verify the script without guesswork.

## Agent Workflow Checklist
- Review open PR feedback and existing READMEs before editing a script to stay consistent with established patterns.
- After linting, rerun `bash setup.sh` if entrypoints changed, then execute the script via its symlink to confirm end-to-end behaviour.
- Document noteworthy quirks or limitations in both the script comments and the directory README to help the next contributor ramp faster.
