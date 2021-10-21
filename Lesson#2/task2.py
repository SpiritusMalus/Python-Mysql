# Посчитать четные и нечетные цифры введенного натурального числа.
# Например, если введено число 34560, то у него 3 четные цифры (4, 6 и 0) и 2 нечетные (3 и 5).


number = input('Введите число: ')
odd_number = 0  # нечетное
even_number = 0  # четное
lst_number = dict()
lst_number['Четные числа:'] = list()
lst_number['Нечетные числа:'] = list()
if int(number) < 1:
    print('Введите натурное число')
else:
    for el in number:
        el = int(el)
        if el % 2 == 0:
            even_number += 1
            lst_number['Четные числа:'].append(el)
        else:
            odd_number += 1
            lst_number['Нечетные числа:'].append(el)
    print(f'Четные числа в кол-ве {even_number} шт.:{lst_number["Четные числа:"]}'
          f'\nНечетные числа в кол-ве {odd_number} шт.: {lst_number["Нечетные числа:"]}')
