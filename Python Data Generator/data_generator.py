import faker, os, random
from datetime import datetime
from collections import OrderedDict
from faker.providers import isbn, lorem
from faker_education import SchoolProvider

path = os.getcwd() + "/Python Data Generator/"

fake = faker.Faker()
content = ""
content += f"USE library;\n"

# Author ---------------------------

DUMMY_DATA_NUMBER = 20
table_name = "author"
table_columns = ["author_first_name", "author_last_name"]
content += f"\n"

for i in range(DUMMY_DATA_NUMBER):
    firstName = fake.first_name()
    lastName = fake.last_name()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{firstName}", "{lastName}");\n'



# Book ---------------------------

DUMMY_DATA_NUMBER_BOOKS = 100
table_name = "book"
table_columns = ["book_ISBN", "book_title","book_page_no","book_language"]
lang = ["English", "Greek", "German", "Frech"]
content += f"\n"

for i in range(DUMMY_DATA_NUMBER_BOOKS):
    isbn_var = fake.isbn10()
    title = fake.sentence(nb_words=5, variable_nb_words=True).replace(".","")
    page_no = random.randint(50, 5000)
    language = random.choice(lang)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{isbn_var}", "{title}", "{page_no}", "{language}");\n'
    

# Book_Author ---------------------------

#DUMMY_DATA_NUMBER = Books
table_name = "book_author"
table_columns = ["book_book_id", "author_author_id"]
content += f"\n"

for book_id in range(1,DUMMY_DATA_NUMBER_BOOKS+1):
    auth_amount = random.randint(1,5)
    auth_ids = random.sample(range(1,21), auth_amount)
    for auth_id in auth_ids:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{auth_id}");\n'



# Category ---------------------------

book_categories = [
    "Fiction",
    "Nonfiction",
    "Mystery",
    "Thriller",
    "Romance",
    "Science Fiction",
    "Fantasy",
    "Horror",
    "Biography",
    "History",
    "Self-help",
    "Poetry",
    "Comedy",
    "Drama",
    "Action and Adventure",
    "Young Adult",
    "Children's",
    "Science",
    "Art",
    "Cooking"
]
table_name = "category"
table_columns = ["category_name"]
content += f"\n"

for category in book_categories:
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{category}");\n'
    
# Book_Category

#DUMMY_DATA_NUMBER = Books
table_name = "book_category"
table_columns = ["book_book_id", "category_category_id"]
content += f"\n"

for book_id in range(1,DUMMY_DATA_NUMBER_BOOKS+1):
    cat_amount = random.randint(2,6)
    cats = random.sample(range(1,len(book_categories)+1), cat_amount)
    for cat in cats:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{cat}");\n'



# library_user_role
table_name = "library_user_role"
table_columns = ["role_name", "role_description"]
roles = ["Central Admin","School Admin","Teacher","Student"]
role_desc = [ 
    "Has Controll of the database and all possible permissions",
    "Is responsible at a school level for managing the users, books, reservations",
    "Can borrow/reserve up to one book per week and edit personal info",
    "Can borrow/reserve up to two books per week"
]
content += f"\n"

for i in range(len(roles)):
     content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{roles[i]}", "{role_desc[i]}");\n'
    


# library_user ------------------------ Admins


SchoolNum = 5
DUMMY_DATA_NUMBER = SchoolNum+1
table_name = "library_user"
table_columns = ["username", "user_password","user_first_name","user_last_name","role_id"]
content += f"\n"

# First Admin created is Central admin
for i in range(DUMMY_DATA_NUMBER):
    username = fake.sentence(nb_words=1).replace(".","").replace(" ","_")
    password = fake.sentence(nb_words=1).replace(".","").replace(" ","_")
    firstName = fake.first_name()
    lastName = fake.last_name()
    if i == 0 :
        role_id = 1 #Central Admin
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}");\n'
    else:
        role_id = 2 # school admin
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}");\n'



# School ---------------------------
table_name = "school"
table_columns = ["school_name", "school_principal_name", "library_admin_user_id", \
    "school_mail_address", "city", "school_phone_number", "school_email", ]
content += f"\n"

for i in range(SchoolNum): #as many schools as school admins
    school_name = fake.company()
    school_principal_name = fake.name()
    school_admin_user_id = i+2 
    school_mail_address = fake.email()
    city = fake.city()
    school_phone_number = str(random.randint(210,290)) + ("%07d" % random.randint(0,9999999))
    school_email = fake.email()

    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{school_name}", "{school_principal_name}", "{school_admin_user_id}", \
            "{school_mail_address}", "{city}", "{school_phone_number}", "{school_email}");\n'
    
    # Set school_admin's school_id to correct value
    content += f'UPDATE library_user SET school_id = {i+1} WHERE user_id = {school_admin_user_id};\n'
    


# library_user ------------------------ Students

DUMMY_DATA_NUMBER = 30
table_name = "library_user"
table_columns = ["username", "user_password","user_first_name","user_last_name","role_id","school_id"]
content += f"\n"



for i in range(DUMMY_DATA_NUMBER):
    username = fake.sentence(nb_words=1).replace(".","").replace(" ","_")
    password = fake.sentence(nb_words=1).replace(".","").replace(" ","_")
    firstName = fake.first_name()
    lastName = fake.last_name()
    role_id = 4 #student
    school_id = random.randint(1,SchoolNum)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}", "{school_id}");\n'



# publisher ------------------------ 

DUMMY_DATA_NUMBER = DUMMY_DATA_NUMBER_BOOKS
table_name = "publisher"
table_columns = ["publisher_name", "book_book_id"]
content += f"\n"

for i in range(DUMMY_DATA_NUMBER):
    Name = fake.sentence(nb_words=2).replace(".","")
    book_id = i+1
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{Name}", "{book_id}");\n'








#-----------------------------------------------------------------------------------#
f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)