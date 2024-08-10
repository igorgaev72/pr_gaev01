#!/bin/bash

# Функция для получения размера директории
function get_dir_size() {
  local dir="$1"
  du -sb "$dir" | cut -f1
}

# Функция для получения размера файла
function get_file_size() {
  local file="$1"
  du -sb "$file" | cut -f1
}

# Цикл для перебора всех файлов и директорий в текущей директории
for entry in *; do
  # Проверка, является ли элемент директорией
  if [ -d "$entry" ]; then
    # Получение размера директории
    size=$(get_dir_size "$entry")
  else
    # Получение размера файла
    size=$(get_file_size "$entry")
  fi

  # Сохранение размера и имени элемента в массиве
  sizes+=("$size")
  entries+=("$entry")
done

# Сортировка массивов по уменьшению размера
sorted_sizes=($(printf '%s\n' "${sizes[@]}" | sort -nr))
sorted_entries=($(printf '%s\n' "${entries[@]}" | sort -nr))

# Вывод результатов в терминал
for ((i=0; i<${#sorted_sizes[@]}; i++)); do
  printf "%10s %s\n" "${sorted_sizes[i]}" "${sorted_entries[i]}"
done
