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

---

## 🔧 Options

--reset - Use this option if you want to change your target working branch

