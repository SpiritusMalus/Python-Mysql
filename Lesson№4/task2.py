# Написать два алгоритма нахождения i-го по счёту простого числа.

import cProfile
import math

def last_n(i):
    number_of_primes = 0
    number = 2
    while number_of_primes <= i:
        number_of_primes = number / math.log(number)
        number += 1
    return number

def eratosthenes(i):
    n = 2
    i_max = last_n(i)
    lst = [el for el in range(n, i_max)]
    for el in lst:
        for el2 in lst[el:]:
            if el2 % el == 0:
                lst.remove(el2)
    return lst[i]

def not_eratosthenes(i):
    lst_prime = [2]
    number = 3
    while len(lst_prime) < i+1:
        flag = True
        for j in lst_prime.copy():
            if number % j == 0:
                flag = False
                break
        if flag:
            lst_prime.append(number)
        number += 1
    return lst_prime[-1]

def main():
    eratosthenes(1000)
    not_eratosthenes(1000)

print(eratosthenes(int(input('Введите : '))))
print(not_eratosthenes(int(input('ВВЕДИ: '))))
cProfile.run('main()')