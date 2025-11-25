# Gol

## Installation

Copy `gol` into `~/bin` or any directory on your `PATH`, or create a symlink:

```bash
ln -s /path/to/gol ~/bin/gol
```

## Usage

```bash
gol [options]
```

`gol` opens the Linear issue referenced in your current Git branch. Branch names must contain an uppercase issue key such as `DEV-73`.

When run with no flags, the script reads the active branch and launches the issue using the `linear://issue/<ISSUE>` protocol, which hands off to the Linear desktop app.

## Options

- `-i, --interactive` — list branches that start with your Git `user.name` (lowercased, spaces replaced with dashes) and let you pick one via `gum choose`.
- `-c, --copy` — copy the Linear link to the clipboard instead of opening it immediately.
- `-g <issue>, --goto <issue>` — skip branch detection and jump straight to the provided issue key. Pass the full key (`DEV-73`) or just the numeric portion; the latter is prefixed with `${GOL_DEFAULT_PREFIX:-DEV}`.

## Behaviour

1. Verifies that [`gum`](https://github.com/charmbracelet/gum) is installed before continuing.
2. Pulls your Git `user.name`, normalises it, and uses it as the prefix for interactive branch filtering.
3. Extracts the first Linear-style issue key from the chosen branch name, unless `--goto` is provided.
4. Builds the link `linear://issue/<ISSUE>`.
5. Opens the link with `open`, or copies it with `pbcopy` when `--copy` is supplied.

Set `GOL_DEFAULT_PREFIX` (e.g. `export GOL_DEFAULT_PREFIX=DSH`) to control the fallback prefix for `--goto` when only a number is passed.

The script exits early with a message if it cannot determine your Git username, no branch is selected, `gum` is missing, or no Linear issue key is found.

## Requirements

- macOS utilities `open` and `pbcopy`
- [`gum`](https://github.com/charmbracelet/gum)
- Git repository with `user.name` configured and branch naming that embeds Linear issue keys
- Linear desktop app installed to handle the `linear://` protocol
