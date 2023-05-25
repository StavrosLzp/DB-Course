import faker
from datetime import datetime
from collections import OrderedDict
import os

path = os.getcwd() + "/Python Data Generator/"

fake = faker.Faker()


# Author 

DUMMY_DATA_NUMBER = 20
table_name = "author"
table_columns = ["author_first_name", "author_last_name",]
content = ""

for i in range(DUMMY_DATA_NUMBER):
    firstName = fake.first_name()
    lastName = fake.last_name()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)}) VALUES ("{firstName}", "{lastName}");\n'





f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)