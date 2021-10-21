# Найти сумму n элементов следующего ряда чисел: 1 -0.5 0.25 -0.125 ...Количество элементов (n) вводится с клавиатуры.

number = int(input('Введите желаемое кол-во элементов: '))
a = 1
lst_numbers = []
while number > 0:
    lst_numbers.append(a)
    a = (a / -2)
    number -= 1
print(f'Сумма: {sum(lst_numbers)}')
