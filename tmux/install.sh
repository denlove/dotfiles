#!/bin/bash
set -e

# --- Preparation ---
# Determine the script's directory to find our config file and the helper library
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/../lib/helpers.sh"

echo "🚀 Setting up Tmux..."

# --- Step 1: Install Tmux ---
if command_exists tmux; then
    echo "✅ Tmux is already installed."
else
    echo "📥 Installing tmux..."
    sudo apt-get update -q && sudo apt-get install -y tmux
fi

# --- Step 2: Apply Configuration ---
echo "⚙️ Applying the .tmux.conf configuration..."
# Use our reliable backup-and-link function from the library
backup_and_link "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "🎉 Tmux setup complete!"