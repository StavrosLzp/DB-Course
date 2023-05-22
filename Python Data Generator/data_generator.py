import faker
from datetime import datetime
from collections import OrderedDict
import os

path = os.getcwd() + "/Python Data Generator/"

locales = OrderedDict([
    ('el-GR', 7),
    ('en-US', 2),
    ('el-CY', 4)
])
fake = faker.Faker(locales)


# Author 

number = 20
table_name = "author"
table_columns = ["author_first_name", "author_last_name",]
content = ""

for i in range(number):
    firstName = fake.first_name()
    lastName = fake.last_name()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)}) VALUES ("{firstName}", "{lastName}");\n'





f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)