This system is designed for a fast, automated, and consistent setup of development and terminal environment on any new Linux machine (primarily Debian/Ubuntu-based).

## 📂 Structure

```
.
├── install.sh          # The main orchestrator that runs all module installers
├── lib/
│   └── helpers.sh      # A library of shared helper functions (linking, backups)
├── tmux/               # Tmux Module
│   ├── .tmux.conf      # Tmux configuration file
│   └── install.sh      # Installer script for Tmux ONLY
├── zsh/                # Zsh Module
│   ├── .zshrc          # Zsh configuration file
│   └── install.sh      # Installer script for Zsh ONLY
└── README.md           # This file
```

## 🛠️ How to Use

### Step 1: Clone the Repository

First, clone this repository to the target machine.

```bash
# Ensure git is installed: sudo apt update && sudo apt install git -y
git clone https://github.com/YOUR_USERNAME/dotfiles.git
cd dotfiles
```

### Step 2: Run the Installation

You have two options: a full automated installation or installing modules individually.

#### Option A: Full Automated Install

This script will automatically find and run every `install.sh` script in the subdirectories. It's perfect for quickly setting up a new machine.

```bash
# Make the main script executable
chmod +x install.sh

# Run it!
./install.sh
```
**Description:** This script will iterate through modules like `tmux` and `zsh`, executing their individual installers.

---

#### Option B: Install a Specific Module

If you only need to set up a single program, like `tmux`, you can run its specific installer.

```bash
# Navigate to the desired module's directory
cd tmux

# Make the installer executable
chmod +x install.sh

# Run the installer for tmux only
./install.sh
```
**Description:** This method allows you to apply configurations granularly without affecting the rest of the system.

## 📈 How to Add a New Module (e.g. for `nvim`)

1.  Create a new directory: `mkdir nvim`
2.  Place your configuration file(s) and an `install.sh` script inside (e.g., `nvim/init.vim` and `nvim/install.sh`).
3.  Write the installation logic in `nvim/install.sh`, following the existing examples.

That's it! The main `install.sh` orchestrator will automatically pick up your new module the next time it's run.