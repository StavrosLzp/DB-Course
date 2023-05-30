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
    book_id = SelectField(
        label = "Book",
        validators = [DataRequired(message = "Book is a required field.")],
        coerce = int
    )
    # grade = IntegerField(
    #     label = "Grade",
    #     validators = [NumberRange(min = 0, max = 100, message = "Grade between 0 and 100 inclusive.")]
    # )

    # ## In a real scenario, where the courses would be a separate entity, the
    # ## choices list below would be populated by the corresponding data
    # ## retrieved from the database. See createGrade in routes.py for an example
    # ## of this with student_id
    # course_name = SelectField(
    #     label = "Course",
    #     validators = [DataRequired(message = "Course is a required field.")],
    #     choices = ["PAC", "PAS", "SHO", "DRI", "DEF", "PHY"]
    # )

    submit = SubmitField("Show")

