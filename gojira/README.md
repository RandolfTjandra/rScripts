# Gojira

## Installation

Copy `gojira` into `~/bin` or any directory on your `PATH`, or create a symlink:

```bash
ln -s /path/to/gojira ~/bin/gojira
```

## Usage

```bash
gojira [options]
```

`gojira` opens the Jira issue referenced in your current Git branch. Branch names must contain an uppercase issue key such as `DSHARE-1234`.

When run with no flags, the script reads the active branch and launches the issue page in your default browser.

## Options

- `-i, --interactive` — list branches that start with your Git `user.name` (lowercased, spaces replaced with dashes) and let you pick one via `gum choose`.
- `-c, --copy` — copy the Jira URL to the clipboard instead of opening the browser.

## Behaviour

1. Verifies that [`gum`](https://github.com/charmbracelet/gum) is installed before continuing.
2. Pulls your Git `user.name`, normalises it, and uses it as the prefix for interactive branch filtering.
3. Extracts the first Jira-style issue key from the chosen branch name.
4. Builds the URL `https://dinari.atlassian.net/browse/<ISSUE>`.
5. Opens the URL with `open`, or copies it with `pbcopy` when `--copy` is supplied.

The script exits early with a message if it cannot determine your Git username, no branch is selected, `gum` is missing, or no Jira issue key is found.

## Requirements

- macOS utilities `open` and `pbcopy`
- [`gum`](https://github.com/charmbracelet/gum)
- Git repository with `user.name` configured and branch naming that embeds Jira issue keys

