# githooks

Utilities for managing Git hook scripts in this repository.

## Scripts
- `prepare-commit-msg` – prefixes commit messages with a branch-derived ticket ID when available.
- `install-githooks` – symlinks every hook in this directory into the current repository’s `.git/hooks/` folder, backing up pre-existing hooks.

## Usage
Run the installer from any directory inside a Git worktree:

```bash
install-githooks
```

The script resolves its own location (even when invoked via the global symlink created by `setup.sh`), then links each hook into `.git/hooks/`. Existing hooks are renamed with a `.bak` suffix before linking. If your repository uses `core.hooksPath`, adjust the destination manually.

## Notes
- All hook scripts are executed directly from this repository, so updates to the source files take effect immediately across projects.
- Ensure hook files are executable; the installer enforces this automatically.
