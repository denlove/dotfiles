# =====================================================
# My Zsh config
# ===================================================

# If Oh My Zsh is not installed, exit
# (This .zshrc will be applied AFTER Oh My Zsh is installed)
# But just in case, it's good practice
if [ -z "$ZSH" ]; then
    return
fi

# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Theme. 'agnoster' - popular, requires Powerline fonts.
# 'robbyrussell' - default and works everywhere.
ZSH_THEME="robbyrussell"

# Enable plugins that our script will install
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# My personal aliases
# Add your own convenient shortcuts here
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias update='sudo apt update && sudo apt upgrade -y'

# Welcome message when opening a terminal
echo "Welcome home :)"