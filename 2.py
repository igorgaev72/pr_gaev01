import os

# Получить список файлов в текущей директории
files = os.listdir(".")

# Определить функцию для получения размера файла
def get_file_size(file_path):
    return os.path.getsize(file_path)

# Получить размеры файлов
file_sizes = {file: get_file_size(file) for file in files}

# Сортировать файлы по уменьшению размера
sorted_files = sorted(file_sizes.items(), key=lambda x: x[1], reverse=True)

# Вывести первые 10 результатов
for i, (file, size) in enumerate(sorted_files):
    if i >= 10:
        break
    print(f"{file}: {size} bytes")

# Запросить на следующую выдачу
next_page = input("Показать следующую страницу? (y/n) ")
if next_page == "y":
    # Вывести следующие 10 результатов
    for i, (file, size) in enumerate(sorted_files[10:20]):
        print(f"{file}: {size} bytes")

