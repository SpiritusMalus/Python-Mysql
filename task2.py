# Выполнить логические побитовые операции «И», «ИЛИ» и др. над числами 5 и 6.
# Выполнить над числом 5 побитовый сдвиг вправо и влево на два знака. Объяснить полученный результат.
print('And = ' + str(5 & 6))
print('Or = ' + str(5 | 6))
print('Xor = ' + str(5 ^ 6))
print('5 сдвиг вправо = ' + str(5 >> 2) + '\n' + '5 сдвиг влево = ' + str(5 << 2))