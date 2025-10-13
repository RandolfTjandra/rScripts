#!/bin/bash

#rScripts/setup_symlinks.sh

# setup_symlinks.sh
# Symlinks rScripts utilities into ~/bin/
# Usage: bash setup_symlinks.sh

set -e

UTILS=("rebasepro/rebasepro" "pushcommit/pushcommit" "choose-root-branch/choose-root-branch" "gojira/gojira" "switchbranch/switchbranch")
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
