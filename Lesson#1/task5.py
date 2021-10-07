# Пользователь вводит две буквы. Определить, на каких местах алфавита они стоят и сколько между ними находится букв.

import string

range1, range2 = input('Первая буква: ').lower(), input('Вторая буква: ').lower()
alphabet_list = list(string.ascii_letters)  # Получаю алфавит
print(alphabet_list)  # Для нагляности принтую алфавит
#symbol_place = [alphabet_list.index(i)+1 for i in alphabet_list
                #if i == range1 or i == range2]  # Изначально хотел так, но для понятности развернул в цикл

for i in alphabet_list:
    if i == range1:
        print(f'Ваша первая буква на {alphabet_list.index(i)+1} месте в алфавите')
    if i == range2:
        print(f'Ваша вторая буква на {alphabet_list.index(i)+1} месте в алфавите')  # Второй способ, но с удобным
        # выводом

symbol_difference = 0  # Накопитель
for i in range(alphabet_list.index(range1), alphabet_list.index(range2)-1):
    symbol_difference += 1  # в переменную сохраняю кол-во букв между буквами пользователя

print(f'Между вашими буквами {symbol_difference} символов')
