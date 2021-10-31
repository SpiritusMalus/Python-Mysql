#  Проанализировать скорость и сложность одного любого алгоритма,
#  разработанных в рамках домашнего задания первых трех уроков.
# Примечание: попробуйте написать несколько реализаций алгоритма и сравнить их.

import random
import cProfile

def lst1():
    lst = [random.randint(1, 199) for i in range(1,100000)]
    sorted_lst_numbers = sorted(lst)
    print(f'Ваши два наименьших числа: {sorted_lst_numbers[0:2]}')

def lst2():
    lst = [random.randint(1, 199) for i in range(1,100000)]
    lst_for_min = [min(lst)]
    lst.remove(min(lst))
    lst_for_min.append(min(lst))
    lst.remove(min(lst))
    print(f'Ваши два наименьших числа: {lst_for_min}')

def main():
    lst1()
    lst2()

print(cProfile.run('main()'))