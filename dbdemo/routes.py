from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db ## initially created by __init__.py, need to be used here
from dbdemo.forms import *


@app.route("/", methods=['GET', 'POST'])
def index():
    username = None
    password = None
    form = login()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        form.username.data = ""
        form.password.data = ""
    return render_template("landing.html", pageTitle="Landing Page",
        username = username, password = password, form = form)

#@app.errorhandler(500)
#def page_not_found(e):
#    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
