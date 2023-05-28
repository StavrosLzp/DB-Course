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
    school_name = StringField(label = "School name", validators = [DataRequired(message = "School name is a required field.")])

    loan_count = StringField(label = "Loan count", validators = [DataRequired(message = "Borrowing_count is a required field.")])

    submit = SubmitField("Create")


