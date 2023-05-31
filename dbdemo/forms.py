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
    
    book_author = StringField(label = "Book Authors")
    
    book_copies = StringField(label = "Book Copies")

    submit = SubmitField("Show")

class author(FlaskForm):
    author = StringField(label = "Author")

    submit = SubmitField("Search")

class title(FlaskForm):
    title = StringField(label = "Title")

    submit = SubmitField("Search")
