import faker, os, random
from datetime import datetime
from collections import OrderedDict
from faker.providers import isbn, lorem
from faker_education import SchoolProvider

path = os.getcwd() + "/Python Data Generator/"

fake = faker.Faker()
content = ""
content += f"USE library;\n"

# Author 

DUMMY_DATA_NUMBER = 20
table_name = "author"
table_columns = ["author_first_name", "author_last_name"]
content += f"DELETE FROM {table_name};\n"

for i in range(DUMMY_DATA_NUMBER):
    firstName = fake.first_name()
    lastName = fake.last_name()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{firstName}", "{lastName}");\n'



# Book

DUMMY_DATA_NUMBER = 100
table_name = "book"
table_columns = ["book_ISBN", "book_title","book_page_no","book_language"]
lang = ["English", "Greek", "German", "Frech"]
content += f"DELETE FROM {table_name};\n"

for i in range(DUMMY_DATA_NUMBER):
    isbn_var = fake.isbn10()
    title = fake.sentence(nb_words=5, variable_nb_words=True)
    page_no = random.randint(50, 5000)
    language = random.choice(lang)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{isbn_var}", "{title}", "{page_no}", "{language}");\n'
    

# Book_Author

#DUMMY_DATA_NUMBER = Books
table_name = "book_author"
table_columns = ["book_book_id", "author_author_id"]
content += f"DELETE FROM {table_name};\n"

for book_id in range(1,DUMMY_DATA_NUMBER+1):
    auth_amount = random.randint(1,5)
    auth_ids = random.sample(range(1,21), auth_amount)
    for auth_id in auth_ids:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{auth_id}");\n'






f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)