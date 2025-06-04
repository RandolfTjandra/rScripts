# Instructions for Codex Agents

This repository contains a collection of zsh utilities for git workflows. Keep changes concise and consistent with the existing code style.

## Guidelines
- Use `#!/bin/zsh` as the shebang for any new scripts.
- Keep scripts POSIX compatible where possible and favor readability.
- Place related scripts in their own directory with a README explaining their purpose and usage.
- Update a directory's README whenever you change the functionality of its scripts.
- Run `bash -n <script>` on any modified scripts to check for syntax errors.
- If `shellcheck` is available, run `shellcheck <script>` as well.
- Ensure commit messages are short and use the imperative mood.

There are currently no automated tests.
