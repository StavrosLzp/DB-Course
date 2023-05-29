import faker, os, random
from faker import Faker
from datetime import datetime,timedelta
import datetime
from collections import OrderedDict
from faker.providers import isbn, lorem
from faker_education import SchoolProvider
from math import floor

fake = faker.Faker()
# Seeds important to avoid errors
d1 = fake.date_of_birth(minimum_age = 0, maximum_age = 0)
print(d1)
d2 = datetime.date.today()
week = timedelta(days = 7)
d3 = d2 - week

print(d2)
print(d3)

if d2 > d1 : print("True")
