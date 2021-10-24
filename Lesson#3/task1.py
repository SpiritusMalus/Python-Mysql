# В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9.

"""Мое первое решение"""
start = 2
finish = 100
dictionary = {
    'two': 0,
    'three': 0,
    'four': 0,
    'five': 0,
    'six': 0,
    'seven': 0,
    'eight': 0,
    'nine': 0,
}
for i in range(start, finish):
    if i % 2 == 0:
        dictionary['two'] += 1
    if i % 3 == 0:
        dictionary['three'] += 1
    if i % 4 == 0:
        dictionary['four'] += 1
    if i % 5 == 0:
        dictionary['five'] += 1
    if i % 6 == 0:
        dictionary['six'] += 1
    if i % 7 == 0:
        dictionary['seven'] += 1
    if i % 8 == 0:
        dictionary['eight'] += 1
    if i % 9 == 0:
        dictionary['nine'] += 1
print(dictionary)

"""Решение 2"""
result = {}
for i in range(2, 10):
    result[i] = []
    for el in range(start, finish):
        if el % i == 0:
            result[i].append(el)
    print(f'Для числа {i} кратны - {len(result[i])}. Кратные числа: {result[i]}')
