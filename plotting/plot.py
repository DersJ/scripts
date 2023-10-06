import matplotlib.pyplot as plt

data = {'2014': 16, '2015': 152, '2016': 167, '2017': 205, '2018': 343, '2019': 447, '2020': 105, '2021': 246, '2022': 436, '2023': 427}
years = list(data.keys())
values = list(data.values())

plt.bar(years, values)
plt.xlabel('Year')
plt.ylabel('Value')
plt.title('Bar Graph')
plt.show()

