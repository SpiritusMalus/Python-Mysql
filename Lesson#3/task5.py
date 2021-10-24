# В массиве найти максимальный отрицательный элемент. Вывести на экран его значение и позицию в массиве.

lst_numbers = [1, 55, -33, 98, 50, -35, 2, 2, 2, 2, 4, 5, 6, 8]
max_number = []
for i in lst_numbers:
    if i < 0:
        max_number.append(i)
print(f'Список: {lst_numbers}\nВаше максимальное отрицательное число: {max(max_number)}\n'
      f'Его индекс в списке: {lst_numbers.index(max(max_number))}')
