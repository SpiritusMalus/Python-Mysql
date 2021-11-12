# Массив размером 2m + 1, где m – натуральное число, заполнен случайным образом. Найдите в массиве медиану.
# Медианой называется элемент ряда, делящий его на две равные части:
# в одной находятся элементы, которые не меньше медианы, в другой – не больше медианы.
# Задачу можно решить без сортировки исходного массива.
# Но если это слишком сложно, то используйте метод сортировки, который не рассматривался на уроках
"""
import collections
lst = [1, 2, 6, 5, 1, 2, 3, 3, 9, 8, 1, 2, 3, 5, 6]
print(statistics.median(lst))
low_lst = []
high_lst = []
for i in lst:
    for j in lst:
        if i > j:
            high_lst.append(i)
        elif j > i:
            low_lst.append(i)
        if len(low_lst) > 0:
            if len(low_lst) == len(high_lst):
                print(f'Это медиан {i}, {j}')
                break
print(f'LOW: {low_lst}\nHIGH: {high_lst}')
Это моя попытка решить без сортировки, всё-таки не получилось понять как
"""


import random
import statistics


def median(median_list):
    median_list = sorted(median_list)
    n = len(median_list)
    if n == 0:
        raise StatisticsError("no median for empty list")
    if n % 2 == 1:
        return median_list[n // 2]
    else:
        i = n // 2
        return (median_list[i - 1] + median_list[i]) / 2


def random_list_generator(number):
    number = 2*number+1
    random_list = [random.randint(0, 100) for i in range(number)]
    return f'Ваш рандомный список: {random_list}\nВаша медиана: {median(random_list)}'


print(random_list_generator(5))
