# gitstage

Interactively stage unstaged and untracked files from a terminal picker.

## Usage

```bash
gitstage
```

## Behaviour

1. Verifies `gum` is installed and that you are inside a Git work tree.
2. Builds a multi-select list from tracked files with unstaged changes plus untracked files.
3. Shows the bulk action rows first every time:
   - `[Tracked only]`
   - `[Untracked only]`
4. Supports `Ctrl+A` when you want to select every entry.
5. Shows each file using its `git status --short` line so you can see whether it is modified, deleted, or untracked before selecting it.
6. Pressing Space toggles the current entry and immediately moves to the next row; Enter confirms the selection.
7. Runs `git add -- <selected paths...>` for the final deduplicated selection.

Already staged-only files are not shown. Files that already have staged changes and additional unstaged edits are shown, and selecting them will stage the remaining edits in that file.

## Requirements

- Git
- An interactive terminal
