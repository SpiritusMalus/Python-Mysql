# Напишите программу, доказывающую или проверяющую, что для множества натуральных чисел выполняется равенство:
# 1+2+...+n = n(n+1)/2, где n - любое натуральное число.
"""Решение №1, я так понял больше памяти расходует, но вывод можно красивее сделать"""
# summ_numbers = 0
# number = int(input('Введите число: '))
# formula = number*(number+1)/2
# formula_2 = ([i for i in range(1, number+1)])
# for i in formula_2:
#     summ_numbers += i
# print(summ_numbers)
# if formula == summ_numbers:
#     print(f'Равенство доказано! Сложение {formula_2} = n*(n+1)/2 =  {formula}')
# else:
#     print(f'Равенство не доказано!')

"""Решение №2, не очень понял как красиво оформить вывод"""
number = int(input('Введите число: '))
formula = number*(number+1)/2
formula_2 = sum([i for i in range(1, number+1)])
if formula == formula_2:
    print(f'Равенство доказано! 1+2+...+n = n(n+1)/2, где n Ваше число ')
else:
    print(f'Равенство не доказано!')
