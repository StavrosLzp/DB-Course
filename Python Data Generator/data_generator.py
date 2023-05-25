import faker, os, random
from datetime import datetime
from collections import OrderedDict
from faker.providers import isbn, lorem
from faker_education import SchoolProvider

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
table_columns = ["book_ISBN", "book_title","book_page_no","book_language"]
content = ""
lang = ["English", "Greek", "German", "Frech"]

for i in range(DUMMY_DATA_NUMBER):
    isbn_var = fake.isbn10()
    title = fake.sentence(nb_words=5, variable_nb_words=True)
    page_no = random.randint(50, 5000)
    language = random.choice(lang)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{isbn_var}", "{title}", "{page_no}", "{language}");\n'





f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)