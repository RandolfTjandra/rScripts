#!/bin/bash

#rScripts/setup_symlinks.sh

# setup_symlinks.sh
# Symlinks rScripts utilities into ~/bin/
# Usage: bash setup_symlinks.sh

IS_SOURCED=0
if [ -n "${ZSH_VERSION:-}" ]; then
    case "$ZSH_EVAL_CONTEXT" in
        *:file) IS_SOURCED=1 ;;
    esac
elif [ -n "${BASH_VERSION:-}" ] && [ "${BASH_SOURCE[0]}" != "$0" ]; then
    IS_SOURCED=1
fi

if [ "$IS_SOURCED" -eq 1 ]; then
    echo "Run this script with 'bash setup.sh'. Do not source it." >&2
    return 1 2>/dev/null || exit 1
fi

set -e

UTILS=(
    "rebasepro/rebasepro"
    "pushcommit/pushcommit"
    "choose-root-branch/choose-root-branch"
    "gojira/gojira"
    "gol/gol"
    "switchbranch/switchbranch"
    "gitstage/gitstage"
    "githooks/install-githooks"
)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/bin"

echo "Setting up symlinks for rScripts utilities..."

# Create ~/bin if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating $TARGET_DIR ..."
    mkdir -p "$TARGET_DIR"
fi

for util in "${UTILS[@]}"; do
    src="$SCRIPT_DIR/$util"
    dest="$TARGET_DIR/$(basename "$util")"

    if [ ! -f "$src" ]; then
        echo "Warning: $src does not exist. Skipping."
        continue
    fi

    # Ensure the script is executable
    chmod +x "$src"

    # Remove existing symlink or file
    if [ -L "$dest" ] || [ -f "$dest" ]; then
        echo "Removing existing $dest"
        rm -f "$dest"
    fi

    ln -s "$src" "$dest"
    echo "Symlinked $src -> $dest"
done

echo "All done! Make sure $HOME/bin is in your PATH."
