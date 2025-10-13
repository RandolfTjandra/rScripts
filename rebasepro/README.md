# rebasepro (working title)

A CLI utility to streamline your Git fixup and rebase workflow.

## ✨ Features

- Prompts you to select a base branch (`main` or a `feature/*` branch).
- Automatically detects staged changes and helps you fix them up.
- Lets you interactively choose which commit to target with your changes.
- Launches an interactive rebase with `--autosquash` for a clean commit history.

> 💡 *Note: This tool does nothing if there are no staged changes.*

---

## 📦 Dependencies

- [Charmbracelet Gum](https://github.com/charmbracelet/gum)

Make sure `gum` is installed and available in your `$PATH`.

---

## 🛠 Installation

symlink each script file into ~/bin/

---

## 🚀 Usage

Note: This script does nothing when you don't have any staged changes.

The first time you use rebasepro, you'll be prompted to choose a feature branch 
to work against. You can either pick main or any branch that starts with "feature".

You'll then be prompted to pick a commit that you want your new changes to be applied to.

An interactive rebase with --autosquash will be launched assuming there are no additional
unstaged changes.

### Detailed instructions

1. Make sure [Charmbracelet gum](https://github.com/charmbracelet/gum) is installed and available on your `PATH`; all prompts rely on it.
2. Stage the changes you want to fold into an existing commit, then run `rebasepro -- fixup`. The `--` separator is required and `fixup` is currently the only supported action.
3. On first run (or when passing `--reset`), the script fetches `main` plus any `feature/*` branches from `origin`, asks you to pick your working root branch, and caches the selection in `.rScripts`.
4. After confirming you have staged changes and are not already in the middle of a rebase, the tool lists your commits ahead of `origin/<root>` and lets you choose a target commit for the fixup.
5. The script creates a `git commit --fixup=<hash>` for the selected commit. If the working tree stays clean afterward, it launches `git rebase -i --autostash --autosquash origin/<root>` so you can finish the autosquash. If unstaged changes remain, it exits so you can resolve them first.

Tip: run `rebasepro -- fixup --reset` whenever you need to point future fixups at a different root branch.

---

## 🔧 Options

--reset - Use this option if you want to change your target working branch
