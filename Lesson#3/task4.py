# Определить, какое число в массиве встречается чаще всего.

lst_numbers = [1, 55, 33, 98, 50, 35, 2, 2, 2, 2, 4, 5, 6, 8]

set_numbers = set(lst_numbers)

max_number = None
how_match = 0
for item in set_numbers:
    much = lst_numbers.count(item)
    if much > how_match:
        max_number = item
        how_match = much
print(f'Максимальное число: {max_number}, Сколько встречается: {how_match}')
