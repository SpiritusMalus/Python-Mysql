# Отсортируйте по убыванию методом "пузырька" одномерный целочисленный массив, заданный случайными числами на
# промежутке [-100; 100). Выведите на экран исходный и отсортированный массивы. Сортировка должна быть реализована в
# виде функции. По возможности доработайте алгоритм (сделайте его умнее).
import random
import cProfile


def rand_sort(rand_list: list = []):
    n = 1
    while n < len(rand_list):
        for i in range(len(rand_list) - n):
            if rand_list[i] > rand_list[i + 1]:
                rand_list[i], rand_list[i + 1] = rand_list[i + 1], rand_list[i]
        n += 1
    return rand_list


def rand_sort2(rand_list: list = []):
    n = len(rand_list)
    for i in range(n-1):
        for j in range(n-i-1):
            if rand_list[j] > rand_list[j+1]:
                rand_list[j], rand_list[j+1] = rand_list[j+1], rand_list[j]
    return rand_list


random_list = [random.randint(-100, 101) for _ in range(10)]
print(random_list)  # [80, 48, 86, 15, -83, -24, 83, 12, -91, -100]
print(rand_sort(random_list))  # [-100, -91, -83, -24, 12, 15, 48, 80, 83, 86]
print(rand_sort2(random_list))  # [-100, -91, -83, -24, 12, 15, 48, 80, 83, 86]

print(cProfile.run('rand_sort(random_list)'))  # range(1550) 0.128    0.128    0.128    0.128 Lesson7.py:8(rand_sort)
print(cProfile.run('rand_sort2(random_list)'))  # range(1550)  0.114   0.114    0.114    0.114 Lesson7.py:18(rand_sort2)
