# gitstage

Interactively stage unstaged and untracked files with [Charmbracelet Gum](https://github.com/charmbracelet/gum).

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
4. Uses Gum's built-in `Ctrl+A` support when you want to select every visible entry.
5. Shows each file using its `git status --short` line so you can see whether it is modified, deleted, or untracked before selecting it.
6. Lets you toggle entries with Space and confirm with Enter.
7. Runs `git add -- <selected paths...>` for the final deduplicated selection.

Already staged-only files are not shown. Files that already have staged changes and additional unstaged edits are shown, and selecting them will stage the remaining edits in that file.

## Requirements

- Git
- [Charmbracelet Gum](https://github.com/charmbracelet/gum)
