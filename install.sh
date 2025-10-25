#!/bin/bash
set -e

echo "🚀 Запускаем полную установку dotfiles..."
echo ""

# Находим все скрипты install.sh в поддиректориях и запускаем их
for installer in */install.sh; do
    # Получаем имя модуля из пути к файлу (например, "tmux")
    module_name=$(basename "$(dirname "$installer")")
    
    echo "--- 🚀 Установка модуля: $module_name ---"
    
    # Запускаем скрипт установки модуля
    bash "$installer"
    
    echo "--- ✅ Установка модуля $module_name завершена ---"
    echo ""
done

echo "✨ Все модули успешно установлены! ✨"
echo ""
echo "Не забудьте сделать Zsh оболочкой по умолчанию, если это необходимо:"
echo "chsh -s $(which zsh)"
echo "После этого потребуется перезайти в систему."