# Среди натуральных чисел, которые были введены, найти наибольшее по сумме цифр.
# Вывести на экран это число и сумму его цифр.
"""Решение №1 с большим расходом памяти"""
number1, number2, number3 = input('Введите число: '), input('Введите число: '), input('Введите число: ')

summ_number1 = (sum([int(i) for i in number1]))  # Суммирую каждое число
summ_number2 = (sum([int(i) for i in number2]))
summ_number3 = (sum([int(i) for i in number3]))

if summ_number1 > summ_number2 and summ_number1 > summ_number3:  # Поиск максимального вариант №1
    print(f'Ваше максимальное число: {number1}\nСумма его цифр: {summ_number1}')
elif summ_number2 > summ_number1 and summ_number2 > summ_number3:
    print(f'Ваше максимальное число: {number2}\nСумма его цифр: {summ_number2}')
elif summ_number3 > summ_number1 and summ_number3 > summ_number2:
    print(f'Ваше максимальное число: {number3}\nСумма его цифр: {summ_number3}')

max_number = max(summ_number1, summ_number2, summ_number3)  # Поиск максимального вариант №2
if max_number == summ_number1:
    print(f'Ваше максимальное число: {number1}\nСумма его цифр: {summ_number1}')
elif max_number == summ_number2:
    print(f'Ваше максимальное число: {number2}\nСумма его цифр: {summ_number2}')
elif max_number == summ_number3:
    print(f'Ваше максимальное число: {number3}\nСумма его цифр: {summ_number3}')

"""Решение №2"""
number1, number2, number3 = input('Введите число: '), input('Введите число: '), input('Введите число: ')
list_of_numbers = [sum(int(i) for i in number1),  # Заношу суммы в список
                   sum(int(i) for i in number2),
                   sum(int(i) for i in number3)]
if max(list_of_numbers) == list_of_numbers[0]:  # Соотношу с числом, что ввёл пользователь и ищу максимальное
    print(f'Ваше максимальное число: {number1}\nСумма его цифр: {max(list_of_numbers)}')
elif max(list_of_numbers) == list_of_numbers[1]:
    print(f'Ваше максимальное число: {number2}\nСумма его цифр: {max(list_of_numbers)}')
else:
    print(f'Ваше максимальное число: {number3}\nСумма его цифр: {max(list_of_numbers)}')
