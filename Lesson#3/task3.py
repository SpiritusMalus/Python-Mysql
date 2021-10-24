# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.

lst_numbers = [1, 55, 33, 98, 50, 35, 2, 2, 2, 2, 4, 5, 6, 8]
max_number = lst_numbers.index(max(lst_numbers))
min_number = lst_numbers.index(min(lst_numbers))
lst_numbers[min_number], lst_numbers[max_number] = lst_numbers[max_number], lst_numbers[min_number]
print(lst_numbers)
