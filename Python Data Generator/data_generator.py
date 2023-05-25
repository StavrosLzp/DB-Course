import faker
from datetime import datetime
from collections import OrderedDict
import os
from faker.providers import isbn

path = os.getcwd() + "/Python Data Generator/"

fake = faker.Faker()


# Author 

DUMMY_DATA_NUMBER = 20
table_name = "author"
table_columns = ["author_first_name", "author_last_name"]
content = ""

for i in range(DUMMY_DATA_NUMBER):
    firstName = fake.first_name()
    lastName = fake.last_name()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{firstName}", "{lastName}");\n'



# Book

DUMMY_DATA_NUMBER = 100
table_name = "book"
table_columns = ["book_ISBN", "book_title","book_page_no","book_subject","book_language",]
content = ""

for i in range(DUMMY_DATA_NUMBER):
    isbn = fake.isbn10()
    title = fake
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{isbn}", "{lastName}");\n'





f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)