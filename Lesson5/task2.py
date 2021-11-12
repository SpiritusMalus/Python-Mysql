# Написать программу сложения и умножения двух шестнадцатеричных чисел.
# При этом каждое число представляется как массив, элементы которого это цифры числа.
# Например, пользователь ввёл A2 и C4F. Сохранить их как [‘A’, ‘2’] и [‘C’, ‘4’, ‘F’] соответственно.
# Сумма чисел из примера: [‘C’, ‘F’, ‘1’], произведение - [‘7’, ‘C’, ‘9’, ‘F’, ‘E’].
import math
import collections
dict16 = {
    'A': '10',
    'B': '11',
    'C': '12',
    'D': '13',
    'E': '14',
    'F': '15'
}
number1, number2 = input('Введите 16ричное число: '), input('Введите 16ричное число: ')
list_numbers = [[i for i in number1],[i for i in number2]]
print(list_numbers)
list_numbers2 = []
for i in list_numbers:
    decimal_number = 0
    degree = len(i) - 1
    for i2 in i:
        if i2 in dict16:
            decimal_number += int(dict16[i2])*(16**degree)
            degree -= 1
        else:
            decimal_number += int(i2) * (16**degree)
            degree -= 1
    list_numbers2.append(decimal_number)

sum_numbers = sum(list_numbers2)
mul_numbers = math.prod(list_numbers2)
list_numbers2 = collections.defaultdict(list)
hex_sum_numbers = hex(sum_numbers)
hex_mul_numbers2 = hex(mul_numbers)
for i in range(2,len(hex_sum_numbers)):
    list_numbers2['SUM'].append(hex_sum_numbers[i].upper())
for i in range(2,len(hex_mul_numbers2)):
    list_numbers2['MUL'].append(hex_mul_numbers2[i].upper())
print(list_numbers2)
