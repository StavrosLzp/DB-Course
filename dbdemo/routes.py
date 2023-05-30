from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db  # initially created by __init__.py, need to be used here
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
                SELECT role_id, user_id FROM library_user 
                WHERE username = '{username}' AND user_password = '{password}';
                """
        cur.execute(query)
        result = cur.fetchall()
        if result:
            role_id = result[0][0]
            user_id = result[0][1]
        cur.close()
        # form.username.data = ""
        form.password.data = ""
    if role_id == 1:
        return redirect('/admin_dash')
    elif role_id == 2:
        return redirect('/operator_dash/'+ str(user_id))
    elif role_id == 3 or role_id == 4:
        cur = db.connection.cursor()
        query = f"""
                SELECT user_id FROM library_user WHERE username='{username}';
                """
        cur.execute(query)
        result = cur.fetchall()
        return redirect(url_for('user', ID=str(result[0][0])))
    else:
        return render_template("landing.html", pageTitle="Landing Page",
                               username=username, password=password, form=form)


@app.route("/admin_dash")
def admin():

    # 3.1.4 START
    query = f"""
                select a.author_id, a.author_first_name, a.author_last_name, b.book_id from author a
                left join book_author ba ON  ba.author_author_id = a.author_id
                left join book b on b.book_id = ba.book_book_id
                WHERE NOT EXISTS(SELECT * from borrowing WHERE book_book_id = b.book_id);
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    no_lend_authors = [dict(zip(column_names, entry))
                       for entry in cur.fetchall()]
    # 3.1.4 END
     # 3.1.5 START
    query =  f"""
                SELECT op1.user_id, op1.user_first_name, op1.user_last_name, op2.user_id AS user2_user_id, op2.user_first_name AS user2_first_name, op2.user_last_name AS user2_last_name, op2.borrowings_count
                FROM Loans_per_school_admin_this_year op1
                Join Loans_per_school_admin_this_year op2 ON op1.user_id < op2.user_id AND op1.borrowings_count = op2.borrowings_count
                WHERE op1.borrowings_count > 20;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    same_l_operators = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    # 3.1.5 END
    
    # 3.1.6 START
    query =  f"""
                    Select c1.category_name, c2.category_name AS category2_name, count(*) AS comb_amount from book b
                    join book_category bc1 ON bc1.book_book_id = b.book_id
                    join book_category bc2 ON bc2.book_book_id = b.book_id AND bc1.category_category_id < bc2.category_category_id
                    join category c1 ON bc1.category_category_id = c1.category_id
                    join category c2 ON bc2.category_category_id = c2.category_id
                    group by c1.category_id, c2.category_id
                    order by comb_amount Desc;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    top3_cats = [dict(zip(column_names, entry)) for entry in cur.fetchall()][0:3]
    
    # 3.1.6 END
    
   
    return render_template("dash_admin.html", pageTitle="Admin Dashboard", 
        no_lend_authors = no_lend_authors, same_l_operators = same_l_operators, top3_cats = top3_cats)

@app.route("/admin_dash/loans", methods=['GET', 'POST'])
def loans():
    # 3.1.1 Loans month search
    cur = db.connection.cursor()
    cur.close()
    month = None
    year = None
    form = loans_view()
    print("1Not")
    query = """
        SELECT s.school_id, s.school_name, COUNT(b.borrowing_id) AS borrowings_count
        FROM school s
        LEFT JOIN library_user u ON s.school_id = u.school_id
        LEFT JOIN borrowing b ON u.user_id = b.library_user_user_id
        WHERE u.user_id <> 0
        """

    cur = db.connection.cursor()
    if form.validate_on_submit():
        print("start")
        month = form.month.data
        form.month.data = ""
        year = form.year.data
        form.year.data = ""
        if month:
            query += f" AND MONTH(b.borrowing_date) = {month}  "
        if year:
            query += f" AND YEAR(b.borrowing_date) = {year}  "

    query += "GROUP BY s.school_id;"
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    loans = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("loans.html", pageTitle="View Loans", loans=loans, form=form)


@app.route("/admin_dash/category_info", methods=['GET', 'POST'])
def category_info():
    query = "select category.category_name from category;"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    categorys = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    form = category()
    query1 = f"""
        select a.author_id, a.author_first_name, a.author_last_name from author a where a.author_id = ""
            """
    query2 = f"select u.user_first_name, u.user_last_name from library_user u where u.role_id = '' "

    if form.validate_on_submit():
        cat = form.category.data
        query1 = f"""
                select a.author_id, a.author_first_name, a.author_last_name from author a
                left join book_author ba ON  ba.author_author_id = a.author_id
                left join book b on b.book_id = ba.book_book_id
                left join book_category bc on bc.book_book_id = b.book_id
                left join category c on c.category_id = bc.category_category_id
                where c.category_name = "{cat}"
                group by a.author_id
                order by a.author_id;
                """

        query2 = f"""
                select u.user_id, u.user_first_name, u.user_last_name from library_user u 
                Left join borrowing bo ON u.user_id = bo.library_user_user_id
                left join book b on b.book_id = bo.book_book_id
                left join book_category bc on bc.book_book_id = b.book_id
                left join category c on c.category_id = bc.category_category_id
                where c.category_name = "{cat}"
                and u.role_id = 3; 
                """

    cur = db.connection.cursor()
    cur.execute(query1)
    column_names = [i[0] for i in cur.description]
    authors = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    cur = db.connection.cursor()
    cur.execute(query2)
    column_names = [i[0] for i in cur.description]
    users = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("category_info.html", pageTitle="View category info", form=form, categorys=categorys, authors=authors, users=users)


@app.route("/admin_dash/top_teach_borrowers")
def top_teach_borrowers():
    query = f"""
                SELECT u.user_id, u.user_first_name, u.user_last_name, COUNT(b.borrowing_id) AS num_books_borrowed
                FROM library_user u
                JOIN borrowing b ON u.user_id = b.library_user_user_id
                WHERE datediff(NOW(),u.user_birthdate) < 40 * 365
                AND u.role_id = 3
                GROUP BY u.user_id
                ORDER BY num_books_borrowed DESC;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    return render_template("top_teach_borrowers.html", pageTitle="View top teacher borrowers", results=results)



    
@app.route("/operator_dash/<int:ID>")
def operator(ID):
    print(ID)
    return render_template("dash_operator.html", pageTitle="Operator Dashboard")


@app.route("/user_dash/<int:ID>")
def user(ID):
    print(ID)
    query = f"""SELECT book_title, borrowing_status FROM
                borrowing JOIN book ON book_book_id=book_id 
                WHERE library_user_user_id='{ID}';
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    book = [dict(zip(column_names, entry))
            for entry in cur.fetchall()]
    
    query = f"""SELECT user_first_name, user_last_name 
                FROM library_user 
                WHERE user_id='{ID}';
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    name = [dict(zip(column_names, entry))
            for entry in cur.fetchall()]

    return render_template("dash_user.html", pageTitle="User Dashboard",
                           book=book,name=name)


@app.route("/user_dash/reservation", methods=['GET', 'POST'])
def reservation():
    query = "select category.category_name from category;"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    categorys = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    formcat = category()
    formtitle=title()
    formauth=author()
    query=""
    if formtitle.validate_on_submit():
        titl = formtitle.title.data
        query= f"""SELECT book_title,author_first_name, author_last_name, category_name FROM 
                    book JOIN book_author ON book_id=book_author.book_book_id
                    JOIN author ON author_author_id=author_id
                    JOIN book_category ON book_id=book_category.book_book_id
                    JOIN category ON category_category_id=category_id
                    WHERE book_title='{titl}';
                """
        
    if formauth.validate_on_submit():
        aut = formauth.author.data

    if formcat.validate_on_submit():
        cat = formcat.category.data

    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    books = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    return render_template("reservation.html", pageTitle="Available Books",
                           categorys=categorys, 
                           books=books,
                           formcat=formcat,
                           formtitle=formtitle,
                           formauth=formauth)


@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle="Not Found"), 404


@app.errorhandler(500)
def page_not_found2(e):
    return render_template("errors/500.html", pageTitle="Internal Server Error"), 500
