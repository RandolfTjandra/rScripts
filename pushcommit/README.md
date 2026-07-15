# pushcommit

Select a commit and push it to origin. If the remote branch does not exist, 
the script creates it by pushing to `refs/heads/`.

The commit list starts from your configured *root branch*. This setting is cached in `.rScripts` via the `choose-root-branch` helper shared with `rebasepro`. If you haven't chosen a root branch yet, run `choose-root-branch --reset` in your repository.

## Installation

Symlink `pushcommit` into a directory in your `$PATH`:

```bash
ln -s /path/to/pushcommit ~/bin/pushcommit
```

## Usage

```
pushcommit [--branch <name>] [--force]
```

You'll first pick a commit to push and then choose a branch from your recent checkouts (unless you pass `--branch`).

Use `--force` when a rebase, fixup, or commit reorder has rewritten the selected commit and the remote branch can no longer be fast-forwarded:

```bash
pushcommit --branch randolf/dev-123-stacked-pr --force
```

This passes `--force` to `git push`. It replaces the remote branch tip even when the update is not a fast-forward, so only use it when you are certain the selected commit belongs on that branch. Without `--force`, existing remote branches retain Git's normal non-fast-forward protection.
