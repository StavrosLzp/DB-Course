from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db ## initially created by __init__.py, need to be used here
from dbdemo.forms import *

@app.route("/", methods=['GET', 'POST'])
def index():
    cur = db.connection.cursor()
    cur.close()
    username = None
    password = None
    role_id = 0
    form = login()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        cur = db.connection.cursor()
        query = f"""
                SELECT role_id FROM library_user 
                WHERE username = '{username}' AND user_password = '{password}';
                """
        cur.execute(query)
        result = cur.fetchall()
        if result:
            role_id = result[0][0]
        cur.close()
        form.username.data = ""
        form.password.data = ""
    if role_id == 1:
        return redirect('/admin_dash')
    elif role_id == 2:
        return redirect('/operator_dash')
    elif role_id == 3 or role_id == 4:
        return redirect('/user_dash')
    else :
        return render_template("landing.html", pageTitle="Landing Page",
            username = username, password = password, form = form)
        
@app.route("/admin_dash")
def admin():
    return render_template("dash_admin.html", pageTitle="Admin Dashboard")

@app.route("/operator_dash")
def operator():
    return render_template("dash_operator.html", pageTitle="Operator Dashboard")

@app.route("/user_dash")
def user():
    return render_template("dash_user.html", pageTitle="User Dashboard")

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found2(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500