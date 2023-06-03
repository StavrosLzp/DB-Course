from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField, DateField, TextAreaField, SelectField, RadioField, EmailField
from wtforms.validators import DataRequired, Email, Optional, NumberRange

# when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
# with the additional restrictions specified for each field


class login(FlaskForm):
    username = StringField(label = "Username", validators = [DataRequired(message = "Username is a required field.")])

    password = StringField(label = "Password", validators = [DataRequired(message = "Password is a required field.")])

    submit = SubmitField("Login")
    
class sign_up_form(FlaskForm):
    username = StringField(label = "Username", validators = [DataRequired(message = "Username is a required field.")])

    password = StringField(label = "Password", validators = [DataRequired(message = "Password is a required field.")])

    school = SelectField(label = "School", validators = [DataRequired(message = "School is a required field.")])

    first_name = StringField(label = "First Name", validators = [DataRequired(message = "First name is a required field.")])
    
    last_name = StringField(label = "Last Name", validators = [DataRequired(message = "Last name is a required field.")])
    
    birthdate = DateField(label = "Birth Date", validators = [DataRequired(message = "Birth Date is a required field.")])
    
    submit = SubmitField("Login")
    
class loans_view(FlaskForm):
    month = StringField(label = "Month (int)")

    year = StringField(label = "Year (int)")

    submit = SubmitField("Search")
    
class school_form(FlaskForm):
    school_name = StringField(label = "School Name", validators = [DataRequired(message = "School Name is a required field.")])
    
    school_principal_name = StringField(label = "Principal Name", validators = [DataRequired(message = "Principal Name is a required field.")])
    
    school_mail_address = StringField(label = "School Mail Address", validators = [DataRequired(message = "School Mail Address is a required field.")])
    
    school_city = StringField(label = "School City", validators = [DataRequired(message = "School City is a required field.")])
    
    school_phone_number = StringField(label = "School Phone Number", validators = [DataRequired(message = "School Phone Number is a required field.")])
    
    school_email = EmailField(label = "School Email", validators = [DataRequired(message = "Principal Name is a required field."), Email()])
    
    submit = SubmitField("Add School")
    
class category(FlaskForm):
    category = StringField(label = "Category")

    submit = SubmitField("Search")
    
    
class books_form(FlaskForm):
    book_title = StringField(label = "Book Title")
    
    book_category = SelectField(label = "Book Category", coerce = int)
    
    book_author = SelectField(label = "Book Authors", coerce = int)
    
    book_copies = StringField(label = "Book Copies")

    submit = SubmitField("Show")
    
class owed_returs_form(FlaskForm): #Όνομα, Επώνυμο, Ημέρες Καθυστέρησης
    first_name = StringField(label = "First Name")
    
    last_name = StringField(label = "Last Name")

    days_due = IntegerField(label = "Days due", validators = [NumberRange(min = 1, max = 9999, message = "Days due")])

    submit = SubmitField("Search")
    
class avg_review(FlaskForm): 
    first_name = StringField(label = "First Name")
    
    last_name = StringField(label = "Last Name")

    book_category = SelectField(label = "Book Category", coerce = int)

    submit = SubmitField("Search")

class user_books_form(FlaskForm):
    title = StringField(label = "Search by Title")
    
    author = StringField(label = "Search by Authors")
    
    category = SelectField(label = "Search by Category")

    submit = SubmitField("Search")

class user_review_form(FlaskForm):
    rating = IntegerField(label = "Rating", validators = [NumberRange(min = 1, max = 5, message = "1-5")])
    
    description = TextAreaField(label = "Review")

    submit = SubmitField("Submit")

class change_info_form(FlaskForm):
    username = StringField(label = "Username", validators = [DataRequired(message = "Username is a required field.")])

    password = StringField(label = "Password", validators = [DataRequired(message = "Password is a required field.")])

    first_name = StringField(label = "First Name", validators = [DataRequired(message = "First name is a required field.")])
    
    last_name = StringField(label = "Last Name", validators = [DataRequired(message = "Last name is a required field.")])
    
    school = SelectField(label = "School", validators = [DataRequired(message = "School is a required field.")])

    birthdate = DateField(label = "Birth Date", validators = [DataRequired(message = "Birth Date is a required field.")])
    
    submit = SubmitField("Save")

    