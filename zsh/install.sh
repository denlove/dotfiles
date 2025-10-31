#!/bin/bash
set -e

# --- Preparation ---
# Determine the script's directory to find our files and the helper library
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/../lib/helpers.sh"

echo "🚀 Setting up Zsh (The Reliable Standard method)..."

# --- Step 1: Install Dependencies ---
if command_exists zsh; then
    echo "✅ Zsh is already installed."
else
    echo "📥 Installing zsh and git (required for plugins)..."
    # Update package list quietly (-q) and install without prompts (-y)
    sudo apt-get update -q && sudo apt-get install -y zsh git
fi

# --- Step 2: Install Oh My Zsh & Plugins ---
OMZ_DIR="$HOME/.oh-my-zsh"
if [ -d "$OMZ_DIR" ]; then
    echo "✅ Oh My Zsh is already in place."
else
    echo "⭐️ Installing Oh My Zsh..."
    # Run the installer with flags to prevent it from changing .zshrc or running zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

# Install/update third-party plugins
ZSH_CUSTOM="$OMZ_DIR/custom"
echo "🔌 Installing/updating third-party plugins..."

# Syntax Highlighting Plugin
SYNTAX_HIGHLIGHTING_DIR="${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
if [ -d "$SYNTAX_HIGHLIGHTING_DIR" ]; then
    echo "   -> 🔄 Updating zsh-syntax-highlighting..."
    git -C "$SYNTAX_HIGHLIGHTING_DIR" pull
else
    echo "   -> 📥 Cloning zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING_DIR"
fi

# Autosuggestions Plugin
AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
if [ -d "$AUTOSUGGESTIONS_DIR" ]; then
    echo "   -> 🔄 Updating zsh-autosuggestions..."
    git -C "$AUTOSUGGESTIONS_DIR" pull
else
    echo "   -> 📥 Cloning zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$AUTOSUGGESTIONS_DIR"
fi


# --- Step 3: Apply the "Golden Standard" Config ---
echo "⚙️  Applying your personal, battle-tested .zshrc..."
# Using our reliable function from the library
backup_and_link "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"


# --- Step 4: Finalizing Setup ---
# Check if zsh is the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "🔑 Setting Zsh as the default shell..."
    # This command might ask for the user password
    chsh -s "$(which zsh)"
    echo "✅ Zsh is now the default shell. Please log out and log back in for the changes to take effect."
else
    echo "👍 Zsh is already the default shell."
fi

echo "🎉 Zsh setup complete!"