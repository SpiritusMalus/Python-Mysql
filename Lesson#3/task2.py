# Во втором массиве сохранить индексы четных элементов первого массива.
# Например, если дан массив со значениями 8, 3, 15, 6, 4, 2,
# то во второй массив надо заполнить значениями 1, 4, 5, 6 (или 0, 3, 4, 5 - если индексация начинается с нуля),
# т.к. именно в этих позициях первого массива стоят четные числа.
"""Проблема была с одинаковыми числами, у них один индекс, но инумерэйт помог"""
lst_numbers = [1, 55, 33, 98, 50, 35, 2, 2, 2, 2, 4, 5, 6, 8]
idx_even_numbers = []
enum_numbers = list(enumerate(lst_numbers, start=0))
for key, val in enum_numbers:
    if val % 2 == 0:
        idx_even_numbers.append(key)
print(f'Числа: {lst_numbers}\nСписок индексов четных чисел: {idx_even_numbers}')
