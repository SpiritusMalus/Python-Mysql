# Матрица 5x4 заполняется вводом с клавиатуры кроме последних элементов строк.
# Программа должна вычислять сумму введенных элементов каждой строки и записывать ее в последнюю ячейку строки.
# В конце следует вывести полученную матрицу.

matrix = ([1, 2, 4, 15], [3, 5, 19, 3], [1, 15, 4, 15], [4, 5, 19, 3])
for i in matrix:
    summ_matrix = sum(i)
    i.append(summ_matrix)
for i in range(len(matrix)):
    print(matrix[i])
