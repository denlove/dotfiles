#!/bin/bash
set -e

# Определяем директорию скрипта, чтобы найти библиотеку
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/../lib/helpers.sh"

echo "🚀 Настройка Zsh и Oh My Zsh..."

# Установка Zsh
if command_exists zsh; then
    echo "✅ Zsh уже установлен."
else
    echo "📥 Устанавливаем zsh..."
    sudo apt-get update && sudo apt-get install -y zsh
fi

# Установка Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "✅ Oh My Zsh уже установлен."
else
    echo "⭐️ Устанавливаем Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Установка плагинов
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo "🔌 Проверяем плагины..."
# Плагин подсветки синтаксиса
if [ -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    echo "   -> ✅ zsh-syntax-highlighting на месте."
else
    echo "   -> 📥 Устанавливаем zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
fi
# Плагин автодополнения
if [ -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    echo "   -> ✅ zsh-autosuggestions на месте."
else
    echo "   -> 📥 Устанавливаем zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
fi

# Применяем наш .zshrc
backup_and_link "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"

echo "🎉 Конфигурация Zsh успешно применена."