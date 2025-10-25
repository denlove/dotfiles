#!/bin/bash
set -e

# Определяем директорию скрипта, чтобы найти библиотеку
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
source "$SCRIPT_DIR/../lib/helpers.sh"

echo "⚙️ Настройка Tmux..."

if command_exists tmux; then
    echo "✅ Tmux уже установлен."
else
    echo "📥 Устанавливаем tmux..."
    sudo apt-get update && sudo apt-get install -y tmux
fi

backup_and_link "$SCRIPT_DIR/.tmux.conf" "$HOME/.tmux.conf"

echo "🎉 Конфигурация Tmux успешно применена."