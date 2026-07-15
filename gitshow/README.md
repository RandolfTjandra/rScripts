# gitshow

Interactively browse recent commits with [fzf](https://github.com/junegunn/fzf) and open any commit's full diff, rendered by [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy). No more copy-pasting commit hashes into `git show`.

## Usage

```bash
gitshow
gitshow --reset   # reselect the root branch first
```

## Behaviour

1. Verifies `fzf` is installed and that you are inside a Git work tree.
2. Resolves the root branch with `choose-root-branch` (cached in `.rScripts`; pass `--reset` to reselect).
3. Lists the commits on the current branch ahead of `origin/<root>`, newest first, with a diff preview of the highlighted commit. If the branch has no commits ahead of the root, it falls back to the branch's recent commits.
4. Inside the commit picker:
   - `Enter` or `→` (right arrow) focuses the highlighted commit's full diff in a scrollable `less` view rendered by `diff-so-fancy`; pressing `q` returns to the picker with your cursor position and filter intact.
   - `←` (left arrow) switches to the branch picker.
   - `Tab` toggles the diff preview.
   - `Esc` quits.
5. Inside the branch picker:
   - Local branches come first, then `origin/*` branches, each sorted by most recent commit. The preview shows the highlighted branch's recent commits.
   - `Enter` switches the commit list to the selected branch's recent commits.
   - The first row, `[<current> vs origin/<root>]`, returns to the default view.
   - `Esc` goes back to the commit list unchanged.

The number of commits listed per branch defaults to 30; override it with the `GITSHOW_LIMIT` environment variable.

If `diff-so-fancy` is not installed, diffs are shown as plain `git show` output instead.

## Requirements

- Git with an `origin` remote
- An interactive terminal
- [fzf](https://github.com/junegunn/fzf)
- [gum](https://github.com/charmbracelet/gum) (used by `choose-root-branch`)
- `choose-root-branch` on your PATH (installed by `setup.sh`)
- [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) for pretty diffs
