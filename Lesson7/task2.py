# Отсортируйте по возрастанию методом слияния одномерный вещественный массив,
# заданный случайными числами на промежутке [0; 50). Выведите на экран исходный и отсортированный массивы.
import operator
import heapq
import random
import cProfile


#  Честно забрал с интернета решение, но для понимания расписал каждое действие

def merge_sort(L, compare=operator.lt):  # 1 аргумент принимает список, второй operator.lt = a < b
    if len(L) < 2:  # выход из программы, если список маленький
        return L[:]
    else:
        middle = int(len(L) / 2)  # Делим пополам список
        left = merge_sort(L[:middle], compare)  # Получаем левую часть
        right = merge_sort(L[middle:], compare)  # Получаем правую часть
        return merge(left, right, compare)  # переход в другую функцию


def merge(left, right, compare):
    result = []  # Создаем список с результатом
    i, j = 0, 0  # Создали счётчики
    while i < len(left) and j < len(right):  # Позволяет добавлять в результат наименьшие при сравнении 2 списков цифры
        if compare(left[i], right[j]):  # Само условие, сравнение left[i] < right[j]
            result.append(left[i])  # Добавление в результат, если left ниже по значению
            i += 1
            """увеличение, чтобы в будущем условие прекратилось
             и переход в другой while в зависимости i больше или j больше"""
        else:
            result.append(right[j])  # Добавление в результат, если right ниже по значению
            j += 1  # Тоже, что и с i+=1
    while i < len(left):
        """Это условие работает, если j в предыдущем стало больше len(right), 
        то есть больше в список результатов было добавлено из right списка"""
        result.append(left[i])  # Добавляем все оставшиеся значения из left списка
        i += 1
    while j < len(right):  # Тоже самое, что и с вверхним условием, только наоборот
        result.append(right[j])
        j += 1
    return result  # вернули результирующий список


# array = [78, 41, 4, 27, 3, 27, 8, 39, 19, 34, 6, 41, 13, 52, 16]
array = [random.randint(0, 50) for _ in range(5050)]  # Для проверки скорости
print(array)
print(merge_sort(array))  # [3, 4, 6, 8, 13, 16, 19, 27, 27, 34, 39, 41, 41, 52, 78]


def merge2(merge_list):
    """Нашёл ещё модуль heapq"""
    middle = int(len(merge_list) / 2)  # Делим пополам список
    left = merge_sort(merge_list[:middle])  # Получаем левую часть
    right = merge_sort(merge_list[middle:])  # Получаем правую часть
    final_list = list(heapq.merge(left, right))  # Тут модуль обрабатывает мои 2 списка
    return final_list

print(array)
print(merge2(array))  # [3, 4, 6, 8, 13, 16, 19, 27, 27, 34, 39, 41, 41, 52, 78]


# cProfile.run("merge_sort(array, compare=operator.lt)")  # in 0.088 seconds
# cProfile.run("merge2(array)")  # in 0.079 seconds
#
# compare = operator.lt
# middle = int(len(array) / 2)
# left = merge_sort(array[:middle], compare)
# right = merge_sort(array[middle:], compare)
# cProfile.run("merge(left, right, compare)")  # in 0.006 seconds
