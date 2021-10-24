# Найти максимальный элемент среди минимальных элементов столбцов матрицы.

matrix = ([1, 2, 4, 15], [3, 5, 19, 3], [1, 15, 4, 15], [4, 5, 19, 3])
dump = {}
dump2 = []
for i in range(len(matrix)):
    dump[i] = []
    for j in matrix:
        dump[i].append(j[i])
print(dump)
for key, val in dump.items():
    dump2 += [max(val)]
print(f'Максимальные числа из всех матриц: {dump2}')
print(f'Максимальное число из максимальных: {max(dump2)}')
