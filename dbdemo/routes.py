from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db ## initially created by __init__.py, need to be used here


@app.route("/")
def index():
    return render_template("landing.html", pageTitle="Landing Page")

#@app.errorhandler(500)
#def page_not_found(e):
#    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500
