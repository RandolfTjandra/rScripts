# choose-root-branch

Helper command that remembers which remote branch you consider the "root" for your current repository.

## Usage

```bash
choose-root-branch [--reset]
```

- Prints the selected root branch to stdout so other scripts can capture it.
- Caches the selection in `.rScripts` alongside your Git repository.
- `--reset` forces a fresh selection.

## Behaviour

1. Verifies [Charmbracelet Gum](https://github.com/charmbracelet/gum) is installed.
2. Reads `.rScripts` (creating it if missing) for `ROOT_BRANCH`.
3. When no branch has been chosen yet—or when `--reset` is provided—it fetches `main` plus any `feature/*` branches from `origin`, asks you to pick one with `gum choose`, and saves the result back into `.rScripts`.
4. Outputs the branch name so caller scripts can use it.

`choose-root-branch` exits with a non-zero status if it cannot determine or select a root branch.
