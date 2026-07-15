# gitstage

Interactively stage unstaged and untracked files with [fzf](https://github.com/junegunn/fzf), with on-demand file diffs rendered by [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy).

## Usage

```bash
gitstage
```

## Behaviour

1. Verifies `fzf` is installed and that you are inside a Git work tree.
2. Builds a multi-select list from tracked files with unstaged changes plus untracked files.
3. Shows the bulk action rows first every time:
   - `[Tracked only]`
   - `[Untracked only]`
4. Uses `Ctrl+A` when you want to select every visible entry.
5. Shows each file using its colorized `git status --short` symbols so you can see whether it is modified, deleted, or untracked before selecting it.
6. Toggles an in-place preview of the highlighted file's unstaged diff with `diff-so-fancy` when you press Tab. Untracked files are shown as additions.
7. Pressing Space toggles the current entry and immediately moves to the next row; Enter confirms the selection.
8. Runs `git add -- <selected paths...>` for the final deduplicated selection.

Already staged-only files are not shown. Files that already have staged changes and additional unstaged edits are shown, and selecting them will stage the remaining edits in that file.

## Requirements

- Git
- An interactive terminal
- [fzf](https://github.com/junegunn/fzf)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) for the Tab diff view
