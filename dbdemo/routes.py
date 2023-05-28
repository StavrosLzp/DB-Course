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
        role_id = cur.fetchall()[0][0]
        cur.close()
        form.username.data = ""
        form.password.data = ""
    if role_id == 0 :
        return render_template("landing.html", pageTitle="Landing Page",
            username = username, password = password, form = form)
    elif role_id == 1:
        return redirect('/admin_dash')
        
@app.route("/admin_dash")
def admin():
    return render_template("admin.html", pageTitle="Admin Dash")

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found2(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500