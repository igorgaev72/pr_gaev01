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

# Сортировка массива размеров по убыванию
sorted_sizes=($(printf '%s\n' "${sizes[@]}" | sort -nr))

# Вывод результатов в терминал
for size in "${sorted_sizes[@]}"; do
  index=$(echo "${sizes[@]}" | grep -n "$size" | cut -d: -f1)
  entry="${entries[$index]}"
  printf "%10s %s\n" "$size" "$entry"
done
