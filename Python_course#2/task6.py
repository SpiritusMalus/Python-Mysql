# Пользователь вводит номер буквы в алфавите. Определить, какая это буква.

import string

number = int(input('Цифра в алфавите: '))

alphabet_list = list(string.ascii_letters)[0:26]  # Получаю алфавит
print(alphabet_list)  # Для нагляности принтую алфавит

print(f'Ваша буква: {alphabet_list[number-1]}')
