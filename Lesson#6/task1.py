from memory_profiler import profile
import random
import sys


# Lesson 4 task 1

@profile
def main():
    lst = [random.randint(1, 199) for i in range(1, 100000)]
    sorted_lst_numbers = sorted(lst)
    global mem_info
    mem_info = sys.getsizeof(lst)
    mem_info += sys.getsizeof(sorted_lst_numbers)


if __name__ == '__main__':
    main()

print(f'Суммированная проверка по модулю sys: {mem_info} байт')


@profile
def main():
    lst = [random.randint(1, 199) for i in range(1, 100000)]
    lst_for_min = [min(lst)]
    lst.remove(min(lst))
    lst_for_min.append(min(lst))
    lst.remove(min(lst))
    global mem_info2
    mem_info2 = sys.getsizeof(lst)


if __name__ == '__main__':
    main()

print(f'Суммированная проверка по модулю sys: {mem_info2} байт')

"""Line #    Mem usage    Increment  Occurences   Line Contents
============================================================
     8     18.9 MiB     18.9 MiB           1   @profile
     9                                         def main():
    10     20.2 MiB      1.3 MiB      100002       lst = [random.randint(1, 199) for i in range(1, 100000)]
    11     20.9 MiB      0.7 MiB           1       sorted_lst_numbers = sorted(lst)
    12                                             global mem_info
    13     20.9 MiB      0.0 MiB           1       mem_info = sys.getsizeof(lst)
    14     20.9 MiB      0.0 MiB           1       mem_info += sys.getsizeof(sorted_lst_numbers)


Суммированная проверка по модулю sys: 1724544 байт

Line #    Mem usage    Increment  Occurences   Line Contents
============================================================
    23     19.0 MiB     19.0 MiB           1   @profile
    24                                         def main():
    25     19.7 MiB      0.8 MiB      100002       lst = [random.randint(1, 199) for i in range(1, 100000)]
    26     19.7 MiB      0.0 MiB           1       lst_for_min = [min(lst)]
    27     19.7 MiB      0.0 MiB           1       lst.remove(min(lst))
    28     19.7 MiB      0.0 MiB           1       lst_for_min.append(min(lst))
    29     19.7 MiB      0.0 MiB           1       lst.remove(min(lst))
    30                                             global mem_info2
    31     19.7 MiB      0.0 MiB           1       mem_info2 = sys.getsizeof(lst)


Суммированная проверка по модулю sys: 824456 байт"""

# Версия Python 3.8, Windows 64x
