# Пользователь вводит данные о количестве предприятий, их наименования и прибыль за 4 квартала (т.е. 4 отдельных числа)
# для каждого предприятия.. Программа должна определить среднюю прибыль (за год для всех предприятий)
# и вывести наименования предприятий, чья прибыль выше среднего и отдельно вывести наименования предприятий,
# чья прибыль ниже среднего.

import collections

quantity = input('Кол-во предприятий?: ')
year_profit = 0
year_company_profit = collections.defaultdict(int)
dict_company = collections.defaultdict(dict)
if int(quantity) > 0:
    for i in range(1,int(quantity)+1):
        dict_company[i] = {}
        company_name = input(f'Введите название {i} предприятия: ')
        dict_company[i]['Name'] = company_name
        for i2 in range(1,5):
            company_profit = input(f'Введите прибыль "{company_name}" в {i2} квартале: ')
            dict_company[i]['quarter №'+ str(i2)] = company_profit
            if company_profit:
                year_company_profit[company_name] += int(company_profit)
    for key, val in year_company_profit.items():
        year_profit += val

average_profit = year_profit / int(quantity)  #Средняя прибыль всех предприятий

for key, val in year_company_profit.items():
    if val > average_profit:
        print(f'У предприятия "{key}" прибыль : {val}, это выше средней: {average_profit}')
for key, val in year_company_profit.items():
        print(f'У предприятия "{key}" прибыль : {val}, это ниже средней: {average_profit}')

"""С новыми списками"""
# low_profit = collections.defaultdict(list)
# best_profit = collections.defaultdict(list)
# for key, val in year_company_profit.items():
#     if val > average_profit:
        # best_profit[key].append(val)
    # else:
        # low_profit[key].append(val)
# print(f'Прибыль выше средней: {best_profit}\nПрибыль ниже средней: {low_profit}')
