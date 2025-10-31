#!/bin/bash

# 📦 Библиотека с общими функциями

# Функция для создания резервной копии и символической ссылки
backup_and_link() {
    local source_file=$1
    local target_file=$2
    local backup_file="${target_file}.bak_$(date +%Y%m%d%H%M%S)"

    if [ -L "$target_file" ]; then
        echo "🔗 Символическая ссылка ${target_file} уже существует. Пропускаем."
    elif [ -f "$target_file" ]; then
        echo "📑 Найден существующий файл ${target_file}."
        echo "   -> Создаем резервную копию в ${backup_file}"
        mv "$target_file" "$backup_file"
        echo "   -> Создаем новую символическую ссылку..."
        ln -s "$source_file" "$target_file"
    else
        echo "🔗 Создаем символическую ссылку для ${target_file}..."
        ln -s "$source_file" "$target_file"
    fi
}

# Функция для проверки, установлена ли команда
command_exists() {
    command -v "$1" >/dev/null 2>&1
}