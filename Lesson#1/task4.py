# Написать программу, которая генерирует в указанных пользователем границах:
# случайное целое число;
# случайное вещественное число;
# случайный символ.

import random
import string

rand, range1, range2 = input('1. Целое число''\n'
                             '2. Вещественное число''\n'
                             '3. Символ''\n'
                             'Введите цифру, чего хотите зарандомить: '), \
                       input('Диапозон от: '), input('Диапозон до : ')

alphabet_list = string.ascii_letters  # Получаю алфавит

if rand == '1':
    how_match = int(input('Сколько зарандомить?: '))
    for el in range(how_match):
        print(f'Целое число: {random.randint(int(range1), int(range2))}')

if rand == '2':
    how_match = int(input('Сколько зарандомить?: '))
    for el in range(how_match):
        print(f'Вещественное число: {random.uniform(float(range1), float(range2))}')

if rand == '3':
    for i in range(ord('A'), len(alphabet_list) + ord('A')):  # Нахожу длину списка
        if i in range((ord(range1)), (ord(range2) + 1)):  # Орд находит цифру буквы
            print(chr(i))
