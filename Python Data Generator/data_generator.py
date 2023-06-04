import faker, os, random
from faker import Faker
from datetime import datetime,timedelta
import datetime
from collections import OrderedDict
from faker.providers import isbn, lorem
from faker_education import SchoolProvider
from math import floor

path = os.getcwd() + "/Python Data Generator/"

fake = faker.Faker()
# Seeds important to avoid errors
Faker.seed(2)

content = ""
content += f"USE library;\n"


# publisher ------------------------ 

DUMMY_DATA_NUMBER = 20
table_name = "publisher"
table_columns = ["publisher_name"]
content += f"\n"

for i in range(DUMMY_DATA_NUMBER):
    Name = fake.sentence(nb_words=2).replace(".","")
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{Name}");\n'

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
#author with no books borrowed 3.1.4:
content += 'INSERT INTO author (author_first_name,author_last_name)        VALUES ("Mary", "Knox");'


# Book ---------------------------

DUMMY_DATA_NUMBER_BOOKS = 100
table_name = "book"
table_columns = ["book_ISBN", "book_title","book_page_no","book_language","publisher_publisher_id"]
lang = ["English", "Greek", "German", "Frech"]
content += f"\n"

for i in range(DUMMY_DATA_NUMBER_BOOKS):
    isbn_var = fake.isbn10()
    title = fake.sentence(nb_words=5, variable_nb_words=True).replace(".","")
    page_no = random.randint(50, 5000)
    language = random.choice(lang)
    publisher_id = random.randint(1, 20)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{isbn_var}", "{title}", "{page_no}", "{language}", "{publisher_id}");\n'
# 3.1.4:        
content += 'INSERT INTO book (book_ISBN,book_title,book_page_no,book_language,publisher_publisher_id)        VALUES ("5-57237-837-7", "Understand government", "445", "Greek", "15");'

# Book_Author ---------------------------

#DUMMY_DATA_NUMBER = Books
table_name = "book_author"
table_columns = ["book_book_id", "author_author_id"]
content += f"\n"

for book_id in range(1,DUMMY_DATA_NUMBER_BOOKS+1):
    auth_amount = random.randint(1,2)
    auth_ids = random.sample(range(1,21), auth_amount)
    for auth_id in auth_ids:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{auth_id}");\n'
# 3.1.4:        
content += 'INSERT INTO book_author (book_book_id,author_author_id)            VALUES ("101", "21");'



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
    "Cooking",
    "Western",
    "Comic Book",
    "Programming",
    "Educational"
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
    cat_amount = random.randint(2,3)
    cats = random.sample(range(1,len(book_categories)+1), cat_amount)
    for cat in cats:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{cat}");\n'



# library_user_role
table_name = "library_user_role"
table_columns = ["role_name", "role_description"]
roles = ["Central Admin","School Admin","Teacher","Student","Awaiting Confirmation"]
role_desc = [ 
    "Has Controll of the database and all possible permissions",
    "Is responsible at a school level for managing the users, books, reservations",
    "Can borrow/reserve up to one book per week and edit personal info",
    "Can borrow/reserve up to two books per week",
    "User waiting aproval from admin"
]
content += f"\n"

for i in range(len(roles)):
     content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{roles[i]}", "{role_desc[i]}");\n'
    


SchoolNum = 5
# School ---------------------------
table_name = "school"
table_columns = ["school_name", "school_principal_name",
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
        VALUES ("{school_name}", "{school_principal_name}", \
            "{school_mail_address}", "{city}", "{school_phone_number}", "{school_email}");\n'
    
    
    
    
# library_user ------------------------ Admins


DUMMY_DATA_NUMBER = SchoolNum+1
table_name = "library_user"
table_columns = ["username", "user_password","user_first_name","user_last_name","role_id","user_birthdate"]
table_columns2 = ["username", "user_password","user_first_name","user_last_name","role_id","user_birthdate","school_id"]
content += f"\n"

# First Admin created is Central admin
for i in range(DUMMY_DATA_NUMBER):
    username = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    password = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    firstName = fake.first_name()
    lastName = fake.last_name()
    birth = fake.date_of_birth(minimum_age = 25, maximum_age = 65)
    if i == 0 :
        role_id = 1 #Central Admin
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}", "{birth}");\n'
    else:
        role_id = 2 # school admin
        school_id = i
        content += f'INSERT INTO {table_name} ({",".join(table_columns2)})\
            VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}", "{birth}", "{school_id}");\n'


# library_user ------------------------ Students

studentsPerSchool = 15
DUMMY_DATA_NUMBER = SchoolNum * studentsPerSchool
table_name = "library_user"
table_columns = ["username", "user_password","user_first_name","user_last_name","role_id","school_id","user_birthdate"]
content += f"\n"



for i in range(DUMMY_DATA_NUMBER):
    username = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    password = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    firstName = fake.first_name()
    lastName = fake.last_name()
    role_id = 4 #student
    school_id = floor(i / studentsPerSchool) +1
    birth = fake.date_of_birth(minimum_age = 12, maximum_age = 18)
    
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}", "{school_id}", "{birth}");\n'



# library_user ------------------------ Teachers

TeachersPerSchool = 4
DUMMY_DATA_NUMBER = SchoolNum * TeachersPerSchool
table_name = "library_user"
table_columns = ["username", "user_password","user_first_name","user_last_name","role_id","school_id","user_birthdate"]
content += f"\n"



for i in range(DUMMY_DATA_NUMBER):
    username = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    password = fake.sentence(nb_words=3).replace(".","").replace(" ","_")
    firstName = fake.first_name()
    lastName = fake.last_name()
    role_id = 3 #teacher
    school_id = floor(i / TeachersPerSchool) +1
    birth = fake.date_of_birth(minimum_age = 25, maximum_age = 65)
    
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{username}", "{password}", "{firstName}", "{lastName}", "{role_id}", "{school_id}", "{birth}");\n'





# school_book -----------------------------------
table_name = "school_book"
table_columns = ["school_school_id", "book_book_id", "school_book_amount"]
content += f"\n"

school_book_amount = random.randint(2,4)
for i in range(SchoolNum):
    school_id = i+1
    for i in range(DUMMY_DATA_NUMBER_BOOKS):
        book_id = i+1
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{school_id}", "{book_id}", "{school_book_amount}");\n'




# borrowing  OLD ------------------------ 
DUMMY_DATA_NUMBER = DUMMY_DATA_NUMBER_BOOKS
table_name = "borrowing"
table_columns = ["book_book_id", "library_user_user_id", "borrowing_date", "borrowing_status", "operator_user_id"]
content += f"\n"

for i in range (5):
    for  student in range(1,SchoolNum * studentsPerSchool+1):
        user_id = SchoolNum + 1 + student
        operator_id = floor(student / (studentsPerSchool+1)) + 2
        #print(str(user_id)+ " " + str(operator_id))
        book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
        date = fake.date_between_dates(datetime.date.today() - timedelta(days = 900),datetime.date.today() - timedelta(days = 15))
        status = "returned"
        
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{user_id}", "{date}", "{status}", "{operator_id}");\n'

    for teacher in range(SchoolNum * studentsPerSchool+1,SchoolNum * studentsPerSchool+1+SchoolNum*TeachersPerSchool):
        user_id = SchoolNum + 1 +  teacher
        operator_id = floor(teacher / (TeachersPerSchool)) + -17
        #print(str(user_id)+ " " + str(operator_id))
        book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
        date = fake.date_between_dates(datetime.date.today() - timedelta(days = 900),datetime.date.today() - timedelta(days = 15))
        status = "returned"
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{user_id}", "{date}", "{status}", "{operator_id}" );\n'


random.seed(2) 
# borrowing ------------------------ 

DUMMY_DATA_NUMBER = DUMMY_DATA_NUMBER_BOOKS
table_name = "borrowing"
table_columns = ["book_book_id", "library_user_user_id", "borrowing_date", "borrowing_status", "operator_user_id"]
content += f"\n"
list = []

# school_id = floor(i / studentsPerSchool) +1
for i in range(2):
    for  student in range(1,SchoolNum * studentsPerSchool+1):
        user_id = SchoolNum + 1 + student
        operator_id = floor(student / (studentsPerSchool+1)) + 2
        book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
        date = fake.date_between_dates(datetime.date.today() - timedelta(days = 15),datetime.date.today())
        if date > datetime.date.today() - timedelta(days = 11) : status = "active"
        else : status = "returned"
        list.append(user_id*100 + book_id)
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{user_id}", "{date}", "{status}", "{operator_id}");\n'

for teacher in range(SchoolNum * studentsPerSchool+1,SchoolNum * studentsPerSchool+1+SchoolNum*TeachersPerSchool):
    user_id = SchoolNum + 1 +  teacher
    operator_id = floor(teacher / (TeachersPerSchool)) + -17
    book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
    date = fake.date_between_dates(datetime.date.today() - timedelta(days = 15),datetime.date.today())
    if date > datetime.date.today() - timedelta(days = 11) : status = "active"
    else : status = "returned"
    list.append(user_id*100 + book_id)
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{book_id}", "{user_id}", "{date}", "{status}", "{operator_id}");\n'

    


random.seed(43) 
# reservation ------------------------ 

DUMMY_DATA_NUMBER = DUMMY_DATA_NUMBER_BOOKS
table_name = "reservation"
table_columns = ["book_book_id", "library_user_user_id", "reservation_date"]
content += f"\n"

# school_id = floor(i / studentsPerSchool) +1
for  student in range(1,SchoolNum * studentsPerSchool+1):
    user_id = SchoolNum + 1 + student
    book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
    if((user_id*100 + book_id) in list):
        continue
    date = fake.date_between_dates(datetime.date.today() - timedelta(days = 7),datetime.date.today())
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{book_id}", "{user_id}", "{date}");\n'
        
        
for teacher in range(SchoolNum * studentsPerSchool+1,SchoolNum * studentsPerSchool+1+SchoolNum*TeachersPerSchool):
    user_id = SchoolNum + 1 + teacher
    book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
    if((user_id*100 + book_id) in list):
        continue
    date = fake.date_between_dates(datetime.date.today() - timedelta(days = 7),datetime.date.today())
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{book_id}", "{user_id}", "{date}");\n'
    
    


# review ------------------------ 

DUMMY_DATA_NUMBER = DUMMY_DATA_NUMBER_BOOKS
table_name = "review"
table_columns = ["review_text", "review_rating", "book_book_id", "library_user_user_id", "review_date"]
content += f"\n"

reviewsPerUser = 3
# school_id = floor(i / studentsPerSchool) +1
for  student in range(1,SchoolNum * studentsPerSchool+1):
    for i in range(reviewsPerUser):
        review_text = fake.text(max_nb_chars=200)
        review_rating = random.randint(0,5)
        user_id = SchoolNum + 1 +  student
        book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
        date = fake.date_this_month()
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{review_text}", "{review_rating}", "{book_id}", "{user_id}", "{date}");\n'
            
for teacher in range(SchoolNum * studentsPerSchool+1,SchoolNum * studentsPerSchool+1+SchoolNum*TeachersPerSchool):
    review_text = fake.text(max_nb_chars=200)
    review_rating = random.randint(0,5)
    user_id = SchoolNum + 1 + teacher
    book_id = random.randint(1,DUMMY_DATA_NUMBER_BOOKS)
    date = fake.date_this_month()
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{review_text}", "{review_rating}", "{book_id}", "{user_id}", "{date}");\n'
    



# keyword ---------------------------
DUMMY_DATA_NUMBER = 100
table_name = "keyword"
table_columns = ["keyword_name"]
content += f"\n"

for i in range (DUMMY_DATA_NUMBER):
    keyword = fake.sentence(nb_words=1, variable_nb_words=True).replace(".","")
    content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
        VALUES ("{keyword}");\n'
    
# book_keyword

table_name = "book_keyword"
table_columns = ["book_book_id", "keyword_keyword_id"]
content += f"\n"

for book_id in range(1,DUMMY_DATA_NUMBER_BOOKS+1):
    keyword_amount = random.randint(2,6)
    keywords = random.sample(range(1,DUMMY_DATA_NUMBER+1),keyword_amount)
    for cat in keywords:
        content += f'INSERT INTO {table_name} ({",".join(table_columns)})\
            VALUES ("{book_id}", "{cat}");\n'


#-----------------------------------------------------------------------------------#
f = open(path + "dummy_data.txt", "w", encoding="utf-8")
f.write(content)