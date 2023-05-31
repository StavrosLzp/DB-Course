from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField, DateField, TextAreaField, SelectField, RadioField
from wtforms.validators import DataRequired, Email, Optional, NumberRange

# when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
# with the additional restrictions specified for each field


class login(FlaskForm):
    username = StringField(label = "Username", validators = [DataRequired(message = "Username is a required field.")])

    password = StringField(label = "Password", validators = [DataRequired(message = "Password is a required field.")])

    submit = SubmitField("Login")
    
class loans_view(FlaskForm):
    month = StringField(label = "Month (int)")

    year = StringField(label = "Year (int)")

    submit = SubmitField("Search")
    
class category(FlaskForm):
    category = StringField(label = "Category")

    submit = SubmitField("Search")
    
    
class books_form(FlaskForm):
    book_title = StringField(label = "Book Title")
    
    book_category = SelectField(label = "Book Category", coerce = int)
    
    book_author = SelectField(label = "Book Authors", coerce = int)
    
    book_copies = IntegerField(label = "Book Copies", validators = [NumberRange(min = 0, max = 100, message = "Boooks Number")])

    submit = SubmitField("Show")
    
class owed_returs_form(FlaskForm): #Όνομα, Επώνυμο, Ημέρες Καθυστέρησης
    first_name = StringField(label = "Book Title")
    
    last_name = StringField(label = "Book Category", coerce = int)

    days_due = IntegerField(label = "Book Copies", validators = [NumberRange(min = 0, max = 9999, message = "Days due")])

    submit = SubmitField("Serch")

class user_books_form(FlaskForm):
    title = StringField(label = "Search by Title")
    
    author = StringField(label = "Search by Authors")
    
    category = StringField(label = "Search by Category")

    submit = SubmitField("Search")

    