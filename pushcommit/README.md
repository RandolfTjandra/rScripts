# pushcommit

Select a commit and push it to origin. If the remote branch does not exist, the script creates it by pushing to `refs/heads/`.

The commit list starts from your configured *root branch*. This setting is shared with the
`rebasepro` utilities via the `.rScripts` file. If you haven't chosen a root branch yet,
run `rebasepro/choose-root-branch --reset` in your repository.

## Installation

Symlink `pushcommit` into a directory in your `$PATH`:

```bash
ln -s /path/to/pushcommit ~/bin/pushcommit
```

## Usage

```
pushcommit [--branch <name>]
```

You'll first pick a commit to push and then choose a branch from your recent checkouts (unless you pass `--branch`).
