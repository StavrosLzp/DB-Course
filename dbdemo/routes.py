from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db  # initially created by __init__.py, need to be used here
from dbdemo.forms import *
import datetime
import os

@app.route("/", methods=['GET', 'POST'])
def index():
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
        form.username.data = ""
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
        
 
@app.route("/sign_up", methods=['GET', 'POST'])
def sign_up():
    form = sign_up_form()
    # Get categories for drop down list
    cur = db.connection.cursor()
    cur.execute('SELECT school_id, school_name FROM school;')
    form.school.choices = list(cur.fetchall())
    cur.close()
    message = ""
    
    if form.validate_on_submit():
        try:
            username = form.username.data
            password = form.password.data
            first_name = form.first_name.data
            last_name = form.last_name.data
            school = form.school.data
            birthdate = form.birthdate.data
            img_link = form.img_link.data
            cur = db.connection.cursor()
            if img_link:
                query = f"""
                    INSERT INTO library_user (username,user_password,user_first_name,user_last_name,school_id,user_birthdate,role_id,img_link)
                    VALUES ("{username}", "{password}", "{first_name}", "{last_name}", "{school}", "{birthdate}", "5", "{img_link}");
                    """
            else:
                query = f"""
                        INSERT INTO library_user (username,user_password,user_first_name,user_last_name,school_id,user_birthdate,role_id)
                        VALUES ("{username}", "{password}", "{first_name}", "{last_name}", "{school}", "{birthdate}", "5");
                        """
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Sign up successfull. Your account will soon be reviewed for activation by your chool operator", "success")
            return redirect("/")
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
           #  print(str(e))
            message = "Something Failed please try again later"
    return render_template("sign_up.html", pageTitle="Landing Page", form=form, message=message)


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
                select l1.user_id, l1.user_first_name, l1.user_last_name,
                l2.user_id AS user2_user_id, l2.user_first_name AS user2_first_name, l2.user_last_name AS user2_last_name, 
                l1.borrowing_year , l2.approved_borrowings_count AS borrowings_count
                from Loans_per_school_admin_year l1
                join Loans_per_school_admin_year l2 ON l1.user_id < l2.user_id
                WHERE l1.borrowing_year = l2.borrowing_year
                AND l1.approved_borrowings_count = l2.approved_borrowings_count;
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
    
    file = open("save_date.txt", "r")
    last_backup_date = file.read()
    file.close()
    
    return render_template("dash_admin.html", pageTitle="Admin Dashboard", 
        no_lend_authors = no_lend_authors, same_l_operators = same_l_operators, top3_cats = top3_cats, last_backup_date=last_backup_date)

@app.route("/admin_dash/loans", methods=['GET', 'POST'])
def loans():
    # 3.1.1 Loans month search
    cur = db.connection.cursor()
    cur.close()
    month = None
    year = None
    form = loans_view()
   #  print("1Not")
    query = """
        SELECT s.school_id, s.school_name, COUNT(b.borrowing_id) AS borrowings_count
        FROM school s
        LEFT JOIN library_user u ON s.school_id = u.school_id
        LEFT JOIN borrowing b ON u.user_id = b.library_user_user_id
        WHERE u.user_id <> 0
        """

    cur = db.connection.cursor()
    if form.validate_on_submit():
       #  print("start")
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
    query1 = f"select a.author_id, a.author_first_name, a.author_last_name from author a where a.author_id = '' "
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

@app.route("/admin_dash/less_than_5_books_from_max")
def less_than_5_books_from_max():
    query =  f"""
                select author_id, author_first_name, author_last_name, books_written from books_written_per_author
                where books_written <= (SELECT MAX(books_written) - 5 from books_written_per_author)
                order by books_written desc;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    return render_template("less_than_5_books_from_max.html", pageTitle="5 or more books away from most books written", results=results)

@app.route("/admin_dash/add_school", methods=['GET', 'POST'])
def add_school():
    form = school_form()
    if form.validate_on_submit():
        try:
            school_name = form.school_name.data
            school_principal_name = form.school_principal_name.data
            school_mail_address = form.school_mail_address.data
            school_city = form.school_city.data
            school_phone_number = form.school_phone_number.data
            school_email = form.school_email.data
            query =  f"""
                    INSERT INTO school (school_name,school_principal_name,school_mail_address,city,school_phone_number,school_email)
                    VALUES ("{school_name}", "{school_principal_name}","{school_mail_address}", "{school_city}", "{school_phone_number}", "{school_email}");
                    """
            cur = db.connection.cursor()
           #  print(query)
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Succesfull Insert", "success")
            return redirect("/admin_dash")
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
           #  print(str(e))
    return render_template("add_school.html", pageTitle="Landing Page", form=form)

@app.route("/admin_dash/activate_users", methods=['GET', 'POST'])
def admin_activate_users():
    
    query = f"""SELECT user_id, username, user_first_name, user_last_name, user_birthdate
                FROM library_user 
                WHERE role_id = 5
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    
    query2 = f"""SELECT user_id, username, user_first_name, user_last_name, user_birthdate
                FROM library_user 
                WHERE role_id = 2
                """
    cur = db.connection.cursor()
    cur.execute(query2)
    column_names = [i[0] for i in cur.description]
    results2 = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("admin_activate_operator.html", pageTitle = "Search", results=results, results2 = results2)

@app.route('/admin_activate_user', methods=['GET', 'POST'])
def admin_activate_user():
    user_id = request.form['user_id']
    role_id = request.form['role_id']
    
    query = f"""UPDATE library_user SET role_id = {role_id} WHERE user_id = {user_id}; """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('admin_activate_users'))
    except Exception as error:
        error_message = str(error)
        return render_template("reserve_error.html", pageTitle="Error During Reservation",
                           error=error_message)
        
        
@app.route('/admin_deactivate_user', methods=['GET', 'POST'])
def admin_deactivate_user():
    user_id = request.form['user_id']
    query = f"""UPDATE library_user
                SET role_id = 5
                WHERE user_id='{user_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('admin_activate_users'))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('admin_activate_users'))
        
@app.route('/admin_delete_user', methods=['GET', 'POST'])
def admin_delete_user():
    user_id = request.form['user_id']
    query = f"""DELETE FROM library_user
                WHERE user_id='{user_id}';           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(url_for('admin_activate_users'))

@app.route('/admin_backup', methods=['GET', 'POST'])
def admin_backup():
    database = "library"
    backup_dbname = database + '_backup.sql'
    
    mysqldump_cmd = f"mysqldump -h localhost -u root --routines {database} > {backup_dbname}"
    os.popen(mysqldump_cmd)
    
    flash("Backup Succesfull" ,"success")
    last_backup_date = open("save_date.txt", "w")
    last_backup_date.write(str(datetime.datetime.now()))
    last_backup_date.close()
    return redirect(url_for('admin'))

@app.route('/admin_restore', methods=['GET', 'POST'])
def admin_restore():
    database = "library"
    backup_dbname = database + '_backup.sql'
    # cur = db.connection.cursor()
    # cur.execute(f'DROP SCHEMA IF EXISTS `{database}` ;')
    # cur.execute(f'CREATE DATABASE {database}')
    # db.connection.commit()
    # cur.close()
    mysqldump_cmd = f"mysql -h localhost -u root {database} < {backup_dbname}"
    os.popen(mysqldump_cmd)
    

    flash("Restore Succesfull" ,"success")
    return redirect(url_for('admin'))

#########################################################

@app.route("/operator_dash/<int:user_ID>")
def operator(user_ID):
    query = f"""SELECT user_first_name, user_last_name, school_id, user_id
                FROM library_user 
                WHERE user_id='{user_ID}';
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry))
            for entry in cur.fetchall()]
    return render_template("dash_operator.html", pageTitle="Operator Dashboard", user_ID = user_ID, results = results)

@app.route("/operator_dash/<int:user_ID>/activate_users", methods=['GET', 'POST'])
def op_activate_users(user_ID):
    query = f"""SELECT user_id, username, user_first_name, user_last_name, user_birthdate
                FROM library_user 
                WHERE school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
                AND role_id = 5;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("operator_activate_users.html", pageTitle = "Search", results=results, user_ID=user_ID)


@app.route('/op_activate_user/<int:user_ID>', methods=['GET', 'POST'])
def op_activate_user(user_ID):
    user_id = request.form['user_id']
    role_id = request.form['role_id']
    
    query = f"""UPDATE library_user SET role_id = {role_id} WHERE user_id = {user_id}; """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('op_activate_users', user_ID=user_ID))
    except Exception as error:
        error_message = str(error)
        return render_template("reserve_error.html", pageTitle="Error During Reservation",
                           error=error_message)
        
@app.route('/op_delete_user/<int:user_ID>', methods=['GET', 'POST'])
def op_delete_user(user_ID):
    user_id = request.form['user_id']
    query = f"""DELETE FROM library_user
                WHERE user_id='{user_id}';           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(url_for('op_activate_users', user_ID=user_ID))



@app.route("/operator_dash/<int:user_ID>/activate_reviews", methods=['GET', 'POST'])
def operator_activate_reviews(user_ID):

    query = f"""SELECT r.review_id, r.book_book_id, r.review_rating, r.review_text, b.book_title, u.user_first_name, u.user_last_name
                FROM review r
                LEFT JOIN book b ON b.book_id = r.book_book_id
                LEFT JOIN library_user u ON u.user_id =  r.library_user_user_id
                WHERE u.school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
                AND r.review_status = 'pending_validation';
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("operator_activate_reviews.html", pageTitle = "Search", results=results, user_ID=user_ID)


@app.route('/validate_review/<int:user_ID>', methods=['GET', 'POST'])
def operator_activate_review(user_ID):
    review_id = request.form['review_id']
    
    query = f"""UPDATE review SET review_status = 'validated' WHERE review_id = {review_id}; """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_activate_reviews', user_ID=user_ID))
    except Exception as error:
        error_message = str(error)
        return render_template("reserve_error.html", pageTitle="Error During Review Update",
                           error=error_message)
        
@app.route('/delete_review/<int:user_ID>', methods=['GET', 'POST'])
def operator_delete_review(user_ID):
    review_id = request.form['review_id']
    query = f"""DELETE FROM review
                WHERE review_id='{review_id}';           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(url_for('operator_activate_reviews', user_ID=user_ID))


@app.route("/operator_dash/<int:user_ID>/search_books", methods=['GET', 'POST'])
def operator_show_books(user_ID):
    form = books_form()
    # Get categories for drop down list
    cur = db.connection.cursor()
    cur.execute('SELECT category_id, category_name FROM category;')
    form.book_category.choices = list(cur.fetchall())
    form.book_category.choices.insert(0,(0, "---"))
    # Get authors for drop down list
    cur.execute('SELECT author_id, CONCAT(author_first_name, " " ,author_last_name) AS author_name FROM author;')
    form.book_author.choices = list(cur.fetchall())
    form.book_author.choices.insert(0,(0, "---"))
    cur.close()

    book_title = None
    book_category = None
    book_author = None  
    book_copies = None
    query=f"""
             SELECT b.book_id, b.book_title, sb.school_book_amount, a.author_first_name, a.author_last_name FROM book b
                left join school_book sb on b.book_id = sb.book_book_id 
                left join book_category bc on b.book_id = bc.book_book_id 
                left join category c on c.category_id = bc.category_category_id
                left join book_author ba on b.book_id = ba.book_book_id 
                left join author a on a.author_id = ba.author_author_id 
                WHERE sb.school_school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
            """
    if form.validate_on_submit():
        book_title = form.book_title.data
        book_category = form.book_category.data
        book_author = form.book_author.data
        book_copies = form.book_copies.data

        if book_title:
            query += f"""AND b.book_title like "%{book_title}%" """

        if book_author: 
            query += f"AND ba.author_author_id = {book_author} "
                
        if book_category : 
            query += f"AND bc.category_category_id = {book_category} "
            
        if book_copies:
            query += f"AND sb.school_book_amount >= {book_copies} "
            
    query += f"""order by book_id;"""
   #  print(query)
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    newresults=merge_fields(results,'author_first_name','author_last_name','author_name')
    results=consolidate(newresults,'book_id', 'book_title','author_name','category_name', 'school_book_amount')
    cur.close()
    
    # Book Loan function
    form2 = books_loan()
    book_id = None
    username = None
    if form2.validate_on_submit():
        book_id = form2.book_id.data
        username = form2.username.data
        query = f"""INSERT INTO borrowing (borrowing_status, book_book_id, library_user_user_id)
                    VALUES ('active', {book_id},(SELECT user_id FROM library_user WHERE username = "{username}"));          
                """
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
           #  print(str(e))
        
    return render_template("operator_search_books.html", pageTitle = "Search", form = form, form2 = form2 , results=results,user_ID=user_ID)

@app.route('/operator_dash/<int:ID>/add_book/<int:school_id>', methods=['GET', 'POST'])
def add_book(ID,school_id):
    form = add_book_form()
    if form.validate_on_submit():
        # try:
            # Book table
            title = form.title.data
            isbn = form.isbn.data
            pages = form.pages.data
            language = form.language.data
            # Author table
            auth = form.authors.data
            # Publisher table
            publisher = form.publisher.data
            publisher=publisher.strip()
            # Category table
            cat = form.categories.data
            # Keywords table
            keyw = form.keywords.data
            # School Book table
            copies = form.copies.data
            #Book category, book author, book keyword
            check=auth.split()
            authors=convert_string_names_to_list_of_dictionaries(auth)
            if (len(check)%2)!=0:
                raise Exception("Please enter at least one author's name and surname")
            categories=cat.split(',')
            for i in range(len(categories)):
                categories[i] = categories[i].replace(" ", "")

            keywords=keyw.split(',')
            for i in range(len(keywords)):
                keywords[i] = keywords[i].replace(" ", "")

            # Checking for new publisher to insert
            query =f"""SELECT  publisher_name
                        FROM publisher;         
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            old_pub = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            old_publisher=extract_field_values(old_pub, 'keyword_name')
            cur.close()
            if not is_item_in_table(publisher,old_publisher):
                query =f"""INSERT INTO publisher (publisher_name)
                            VALUES ('{publisher}');        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            # Finding new publisher id
            query =f"""SELECT publisher_id 
                        FROM publisher 
                        WHERE publisher_name='{publisher}';        
                        """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            pub_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            publisher_id=pub_id[0]['publisher_id']

            # Inserting book
            query =f"""INSERT INTO book (book_ISBN, book_title, book_page_no, book_language, publisher_publisher_id)
                    VALUES ('{isbn}','{title}','{pages}','{language}','{publisher_id}');        
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()

            # Checking for new authors to insert
            query =f"""SELECT  author_first_name, author_last_name
                        FROM author;         
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            old_authors = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            for a in authors:
                if not is_item_in_table(a,old_authors):
                    query =f"""INSERT INTO author (author_first_name, author_last_name)
                                VALUES ('{a['author_first_name']}', '{a['author_last_name']}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()
            
            # Finding book_id
            query =f"""SELECT book_id FROM book WHERE book_title = '{title}';        
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            booid = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            book_id=booid[0]['book_id']

            # Inserting book-author relationship
            for a in authors:
                query =f"""SELECT author_id 
                        FROM author 
                        WHERE author_first_name='{a['author_first_name']}'
                        AND author_last_name='{a['author_last_name']}';        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                autid = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                cur.close()
                author_id=autid[0]['author_id']
                
                query =f"""INSERT INTO book_author (book_book_id, author_author_id)
                            VALUES ('{book_id}', '{author_id}');        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            # Checking for new categories to insert
            query =f"""SELECT  category_name
                        FROM category;         
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            old_cat = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            old_categories=extract_field_values(old_cat, 'category_name')
            cur.close()
            for c in categories:
                if not is_item_in_table(c,old_categories):
                    query =f"""INSERT INTO category (category_name)
                                VALUES ('{c}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()
        
            #  Inserting book-category relationship
            for c in categories:
                query =f"""SELECT category_id 
                        FROM category 
                        WHERE category_name='{c}';        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                cat_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                cur.close()
                category_id=cat_id[0]['category_id']
                
                query =f"""INSERT INTO book_category (book_book_id, category_category_id)
                            VALUES ('{book_id}', '{category_id}');        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            # Checking for new keywords to insert
            query =f"""SELECT  keyword_name
                        FROM keyword;         
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            old_keyw = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            old_keyword=extract_field_values(old_keyw, 'keyword_name')
            cur.close()
            for k in keywords:
                if not is_item_in_table(k,old_keyword):
                    query =f"""INSERT INTO keyword (keyword_name)
                                VALUES ('{k}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()
        
            #  Inserting book-keyword relationship
            for k in keywords:
                query =f"""SELECT keyword_id 
                        FROM keyword 
                        WHERE keyword_name='{k}';        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                keyw_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                cur.close()
                keyword_id=keyw_id[0]['keyword_id']
                
                query =f"""INSERT INTO book_keyword (book_book_id, keyword_keyword_id)
                            VALUES ('{book_id}', '{keyword_id}');        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            # Inserting into school_book
            query =f"""INSERT INTO school_book (school_school_id, school_book_amount, book_book_id)
                            VALUES ('{school_id}', '{copies}', '{book_id}');        
                        """
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            return redirect('/operator_dash/'+ str(ID))
        # except Exception as error:
            error_message = str(error)
            return render_template("add_book.html", pageTitle = "Add Book",form=form ,error_message=error_message,error=1)
        
    return render_template("add_book.html", pageTitle = "Add Book",form=form,error=0)


@app.route("/user_dash/reviews/<int:ID>", methods=['GET', 'POST'])
def user_reviews(ID):

    query = f"""SELECT r.review_id, r.book_book_id, r.review_rating, r.review_text, b.book_title, u.user_first_name, u.user_last_name
                FROM review r
                LEFT JOIN book b ON b.book_id = r.book_book_id
                LEFT JOIN library_user u ON u.user_id =  r.library_user_user_id
                WHERE r.library_user_user_id = {ID};
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    return render_template("user_view_reviews.html", pageTitle = "Search", results=results, ID=ID)

@app.route("/edit_review/<int:ID>", methods=['GET', 'POST'])
def user_edit_reviews(ID):
    form = user_review_form()
    if form.validate_on_submit():
        rating = form.rating.data
        description = form.description.data
        review_id = form.review_id.data
        query = f"""
                UPDATE review 
                SET review_rating = {rating}, review_text = '{description}', review_status = 'pending_validation'
                WHERE review_id = {review_id};
                """
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Edit Succesfull" ,"success")
        return redirect(url_for('user_reviews', ID = ID))
    
    
    cur = db.connection.cursor()
    review_id = request.form['review_id']
    
    cur.execute(f"SELECT review_rating, review_text, review_id FROM review WHERE review_id = {review_id}")
    result = cur.fetchall()
    cur.close()
    if result:
        rating = result[0][0]
        description = result[0][1]
        form.rating.data = rating
        form.description.data = description
        form.review_id.data = review_id
        
    return render_template("user_edit_review.html", pageTitle="Landing Page", form=form)

@app.route('/delete_review_user/<int:ID>', methods=['GET', 'POST'])
def delete_review_user(ID):
    review_id = request.form['review_id']
    query = f"""DELETE FROM review
                WHERE review_id='{review_id}';           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(url_for('user_reviews', ID = ID))

@app.route('/operator_dash/<int:ID>/delete_book/<int:book_id>', methods=['GET', 'POST'])
def delete_book(ID,book_id):
    query = f"""DELETE FROM book
                WHERE book_id='{book_id}';           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(f"/operator_dash/{ID}/search_books")


@app.route('/operator_dash/<int:ID>/edit_book/<int:book_id>', methods=['GET', 'POST'])
def edit_book(ID,book_id):
    form = edit_book_form()
    query =f"SELECT school_id FROM library_user WHERE user_id={ID};"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    schid = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    school_id=schid[0]['school_id']


    query =f"""SELECT book_id, book_title, book_ISBN, book_page_no, book_language, author_first_name, author_last_name, publisher_name, category_name, keyword_name, school_book_amount
            FROM book JOIN book_author ON book.book_id=book_author.book_book_id
            JOIN author ON book_author.author_author_id=author.author_id
            JOIN publisher ON publisher.publisher_id=book.publisher_publisher_id
            JOIN book_category ON book.book_id=book_category.book_book_id
            JOIN category ON category.category_id=book_category.category_category_id
            JOIN book_keyword ON book.book_id=book_keyword.book_book_id
            JOIN keyword ON keyword_keyword_id=book_keyword.keyword_keyword_id
            JOIN school_book ON school_book.book_book_id=book.book_id
            where book_id='{book_id}'
            AND school_school_id='{school_id}'
            ORDER BY book_id;
            """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    defa = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    defaul=merge_fields(defa,'author_first_name','author_last_name','author_name')
    defaults=consolidate(defaul,'book_id')


    prev_title= form.title.default=defaults[0]['book_title']
    prev_isbn=form.isbn.default=defaults[0]['book_ISBN']
    prev_pages=form.pages.default=defaults[0]['book_page_no']
    prev_language=form.language.default=defaults[0]['book_language']
    prev_authors=defaults[0]['author_name']
    prev_publisher=form.publisher.default=defaults[0]['publisher_name']
    prev_cat=form.categories.default=', '.join(defaults[0]['category_name'])
    prev_keyw=form.keywords.default=', '.join(defaults[0]['keyword_name'])
    prev_copies=form.copies.default=defaults[0]['school_book_amount']


    if type(prev_authors)==list:
        prev_authors=form.authors.default=', '.join(defaults[0]['author_name'])
    form.authors.default=prev_authors

    # prev_authors=prev_aut.split(",").sort()
    prev_categories=prev_cat.split(",")
    for i in range(len(prev_categories)):
        prev_categories[i] = prev_categories[i].strip()

    prev_keywords=prev_keyw.split(",")
    for i in range(len(prev_keywords)):
        prev_keywords[i] = prev_keywords[i].strip()


    if form.validate_on_submit():
        # try:
            # Book table
            title = form.title.data
            isbn = form.isbn.data
            pages = form.pages.data
            language = form.language.data
            # Author table
            authors = form.authors.data
            # Publisher table
            publisher = form.publisher.data
            publisher=publisher.strip()
            # Category table
            cat = form.categories.data
            # Keywords table
            keyw = form.keywords.data
            # School Book table
            copies = form.copies.data
            #Book category, book author, book keyword
            check=authors.split()
            if (len(check)%2)!=0:
                raise Exception("Please enter authors' names and surnames")
            categories=cat.split(',')
            for i in range(len(categories)):
                categories[i] = categories[i].strip()
            print(categories)
            keywords=keyw.split(',')
            for i in range(len(keywords)):
                keywords[i] = keywords[i].strip()


            # Checking for new publisher to insert
            if prev_publisher!=publisher:
                query =f"""SELECT  publisher_name
                            FROM publisher;         
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                old_pub = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                old_publisher=extract_field_values(old_pub, 'keyword_name')
                cur.close()
                if not is_item_in_table(publisher,old_publisher):
                    query =f"""INSERT INTO publisher (publisher_name)
                                VALUES ('{publisher}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()

                # Finding new publisher id
                query =f"""SELECT publisher_id 
                            FROM publisher 
                            WHERE publisher_name='{publisher}';        
                            """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                pub_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                cur.close()
                publisher_id=pub_id[0]['publisher_id']

            # Updating book
            changebook=0
            sets=" "

            if title!=prev_title:
                changebook+=1
                sets+=f"""book_title= '{title}', """

            if isbn!=prev_isbn:
                changebook+=1
                sets+=f"""book_ISBN= '{isbn}', """

            if pages!=prev_pages:
                changebook+=1
                sets+=f"""book_page_no= '{pages}', """
            
            if language!=prev_language:
                changebook+=1
                sets+=f"""book_language= '{language}', """
            
            if publisher!=prev_publisher:
                changebook+=1
                sets+=f"""publisher_publisher_id= '{publisher_id}', """
            
            if changebook>0:
                query =f"""UPDATE book
                            SET {sets[:-2]}
                            WHERE book_id= '{book_id}';        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            # Checking for new authors to insert
            authors=authors.split(',')
            for i in range(len(authors)):
                authors[i] = authors[i].strip()
            prev_authors=prev_authors.split(',')
            for i in range(len(prev_authors)):
                prev_authors[i] = prev_authors[i].strip()
            if authors!= prev_authors:
                addedaut=[]
                removedaut=[]
                find_added_and_removed_strings(prev_authors,authors,addedaut,removedaut)
                addedauth=', '.join(addedaut)
                removedauth=', '.join(removedaut)
                addedauthors=convert_string_names_to_list_of_dictionaries(addedauth)
                removedauthors=convert_string_names_to_list_of_dictionaries(removedauth)
                query =f"""SELECT  author_first_name, author_last_name
                            FROM author;         
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                old_authors = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                cur.close()
                for a in addedauthors:
                    if not is_item_in_table(a,old_authors):
                        query =f"""INSERT INTO author (author_first_name, author_last_name)
                                    VALUES ('{a['author_first_name']}', '{a['author_last_name']}');        
                                """
                        cur = db.connection.cursor()
                        cur.execute(query)
                        db.connection.commit()
                        cur.close()
                
                # Inserting book-author relationship
                for a in addedauthors:
                    query =f"""SELECT author_id 
                            FROM author 
                            WHERE author_first_name='{a['author_first_name']}'
                            AND author_last_name='{a['author_last_name']}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    autid = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    author_id=autid[0]['author_id']
                    
                    query =f"""INSERT INTO book_author (book_book_id, author_author_id)
                                VALUES ('{book_id}', '{author_id}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()
                
                # Deleting from book-author relationship
                for r in removedauthors:
                    query =f"""SELECT author_id 
                            FROM author 
                            WHERE author_first_name='{r['author_first_name']}'
                            AND author_last_name='{r['author_last_name']}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    autid = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    author_id=autid[0]['author_id']
                    query =f"""DELETE FROM book_author 
                                WHERE book_book_id='{book_id}'
                                AND author_author_id='{author_id}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()

            #Updating categories
            if sorted(categories)!= sorted(prev_categories):
                addedcat=[]
                removedcat=[]
                find_added_and_removed_strings(prev_categories,categories,addedcat,removedcat)            
                query =f"""SELECT  category_name
                            FROM category;         
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                old_cat = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                old_categories=extract_field_values(old_cat, 'category_name')
                cur.close()
                for c in addedcat:
                    if not is_item_in_table(c,old_categories):
                        query =f"""INSERT INTO category (category_name)
                                    VALUES ('{c}');        
                                """
                        cur = db.connection.cursor()
                        cur.execute(query)
                        db.connection.commit()
                        cur.close()
            
                #  Inserting book-category relationship
                for c in addedcat:
                    query =f"""SELECT category_id 
                            FROM category 
                            WHERE category_name='{c}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    cat_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    category_id=cat_id[0]['category_id']
                    
                    query =f"""INSERT INTO book_category (book_book_id, category_category_id)
                                VALUES ('{book_id}', '{category_id}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()

                # Deleting book_category realationship
                for c in removedcat:
                    query =f"""SELECT category_id 
                            FROM category 
                            WHERE category_name='{c}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    cat_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    category_id=cat_id[0]['category_id']
                    
                    query =f"""DELETE FROM book_category 
                                WHERE book_book_id= '{book_id}' 
                                AND  category_category_id= '{category_id}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()

            # Checking for new keywords to insert
            if sorted(keywords)!=sorted(prev_keywords):
                addedkw=[]
                removedkw=[]
                find_added_and_removed_strings(prev_keywords,keywords,addedkw,removedkw)            
                query =f"""SELECT  keyword_name
                            FROM keyword;         
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                column_names = [i[0] for i in cur.description]
                old_keyw = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                old_keyword=extract_field_values(old_keyw, 'keyword_name')
                cur.close()
                for k in addedkw:
                    if not is_item_in_table(k,old_keyword):
                        query =f"""INSERT INTO keyword (keyword_name)
                                    VALUES ('{k}');        
                                """
                        cur = db.connection.cursor()
                        cur.execute(query)
                        db.connection.commit()
                        cur.close()
            
                #  Inserting book-keyword relationship
                for k in addedkw:
                   #  print('Adding',k )
                    query =f"""SELECT keyword_id 
                            FROM keyword 
                            WHERE keyword_name='{k}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    keyw_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    keyword_id=keyw_id[0]['keyword_id']
                    
                    query =f"""INSERT INTO book_keyword (book_book_id, keyword_keyword_id)
                                VALUES ('{book_id}', '{keyword_id}');        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()
            
                #  Deleting from book-keyword relationship
                for k in removedkw:
                    query =f"""SELECT keyword_id 
                            FROM keyword 
                            WHERE keyword_name='{k}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    column_names = [i[0] for i in cur.description]
                    keyw_id = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
                    cur.close()
                    keyword_id=keyw_id[0]['keyword_id']
                    
                    query =f"""DELETE FROM book_keyword 
                            WHERE book_book_id= '{book_id}' 
                            AND keyword_keyword_id= '{keyword_id}';        
                            """
                    cur = db.connection.cursor()
                    cur.execute(query)
                    db.connection.commit()
                    cur.close()

            # Updating school_book
            if copies!=prev_copies:
                query =f"""UPDATE school_book
                            SET school_book_amount= '{copies}'
                            WHERE book_book_id= '{book_id}';        
                        """
                cur = db.connection.cursor()
                cur.execute(query)
                db.connection.commit()
                cur.close()

            return redirect(f"/operator_dash/{ID}/search_books")
        # except Exception as error:
            error_message = str(error)
            return render_template("edit_book.html", pageTitle = "Edit Book",form=form ,error_message=error_message,error=1)
    form.process()   
    return render_template("edit_book.html", pageTitle = "Edit Book",form=form,error=0)




@app.route("/operator_dash/<int:user_ID>/search_owed_returns", methods=['GET', 'POST'])
def operator_search_owed_returns(user_ID):
    form = owed_returs_form()
    first_name = None
    last_name = None
    days_due = 1
    query = f"""
            SELECT user_id, user_first_name, user_last_name, school_id, currently_borrowed, days_due FROM library_user_days_due
            WHERE school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
            """
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        days_due = form.days_due.data
        if first_name: query += f' AND user_first_name like "%{first_name}%" '
        if last_name: query += f' AND user_last_name like "%{last_name}%" '
    
    query += f' AND days_due >= {days_due} '           
    query += f";"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
   #  print(results)
   #  print("Hi")
    
    return render_template("operator_search_owed_returns.html", pageTitle = "Search", form = form ,results=results)

@app.route("/operator_dash/<int:user_ID>/average_rating", methods=['GET', 'POST'])
def operator_average_rating(user_ID):
    form = avg_review()
    # Get categories for drop down list
    cur = db.connection.cursor()
    cur.execute('SELECT category_id, category_name FROM category;')
    form.book_category.choices = list(cur.fetchall())
    form.book_category.choices.insert(0,(0, "---"))
    cur.close
    
    # avg rating per user
    query1 = f"""
            SELECT r.library_user_user_id, u.user_first_name, u.user_last_name, AVG(r.review_rating) AS average_rating
            FROM review r
            left join library_user u ON u.user_id = r.library_user_user_id
            JOIN book_category bc ON bc.book_book_id = r.book_book_id
            Where school_id = (SELECT school_id from library_user WHERE user_id = {user_ID}) AND review_status = 'validated'
            """
    query2 = f"""
            SELECT c.category_name, AVG(r.review_rating) AS average_rating
            FROM category c
            JOIN book_category bc ON c.category_id = bc.category_category_id
            JOIN book b ON bc.book_book_id = b.book_id
            LEFT JOIN review r ON b.book_id = r.book_book_id
            left join library_user u ON u.user_id = r.library_user_user_id
            WHERE u.school_id = (SELECT school_id from library_user WHERE user_id = {user_ID}) AND review_status = 'validated'
            """
            
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        book_category = form.book_category.data
        if first_name: 
            query1 += f' AND u.user_first_name like "%{first_name}%" '
            query2 += f' AND u.user_first_name like "%{first_name}%" '
        if last_name: 
            query1 += f' AND u.user_last_name like "%{last_name}%" '    
            query2 += f' AND u.user_last_name like "%{last_name}%" '  
        if book_category : 
            query1 += f"AND bc.category_category_id = {book_category} \n"
            query2 += f"AND bc.category_category_id = {book_category} \n"
    
    query1+="""
            GROUP BY library_user_user_id;
            """
    query2+="""
            GROUP BY c.category_id
            order by average_rating desc;
            """
            
    cur = db.connection.cursor()
    cur.execute(query1)
    column_names = [i[0] for i in cur.description]
    results1 = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    
    cur.execute(query2)
    column_names = [i[0] for i in cur.description]
    results2 = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    
    return render_template("operator_average_rating.html", pageTitle = "average_rating", form = form ,results1=results1,results2=results2)


@app.route("/operator_dash/<int:user_ID>/search_users", methods=['GET', 'POST'])
def operator_search_users(user_ID):
    form = user_search()
    first_name = None
    last_name = None
    username = None
    query = f"""
            SELECT u.user_id, u.username, u.user_first_name, u.user_last_name, u.img_link, r.role_name FROM library_user u
            LEFT JOIN library_user_role r ON r.role_id = u.role_id
            WHERE school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
            AND u.role_id <> 2
            """
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        username = form.username.data
        if first_name: query += f' AND user_first_name like "%{first_name}%" '
        if last_name: query += f' AND user_last_name like "%{last_name}%" '
        if username: query += f' AND username like "%{username}%" '
            
    query += f";"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()   
    
    return render_template("operator_search_users.html", pageTitle = "Search", form = form ,results=results, user_ID=user_ID)

@app.route('/operator_search_users_delete/<int:user_ID>', methods=['GET', 'POST'])
def operator_search_users_delete(user_ID):
    user_id = request.form['user_id']
    query = f"""DELETE FROM library_user
                WHERE user_id='{user_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_search_users', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_search_users', user_ID=user_ID))
    
@app.route('/operator_search_users_deactivate/<int:user_ID>', methods=['GET', 'POST'])
def operator_search_users_deactivate(user_ID):
    user_id = request.form['user_id']
    query = f"""UPDATE library_user
                SET role_id = 5
                WHERE user_id='{user_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_search_users', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_search_users', user_ID=user_ID))
    
@app.route('/operator_search_users_print_card/<int:user_ID>', methods=['GET', 'POST'])
def operator_search_users_print_card(user_ID):
    user_id = request.form['user_id']
    query = f"""SELECT u.user_id, u.username, u.user_first_name, u.user_last_name, s.school_name, r.role_name, u.img_link FROM library_user u
                LEFT JOIN library_user_role r ON r.role_id = u.role_id
                LEFT JOIN school s ON s.school_id = u.school_id
                WHERE u.user_id = {user_id};           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("user_card.html", pageTitle = "user_card", results=results, user_ID=user_ID)
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_search_users', user_ID=user_ID))
    
    
@app.route('/operator_dash/<int:user_ID>/borrowings', methods=['GET', 'POST'])
def operator_borrowings(user_ID):
    form = borrowing_search_form()
    first_name = None
    last_name = None
    form.borrowing_status.choices = [("---","---"),("active", "Active") ,("returned", "Returned")]
    query = f"""
            SELECT br.borrowing_id, br.borrowing_date, br.borrowing_status, b.book_title, u.user_first_name, u.user_last_name FROM borrowing br
            LEFT JOIN book b ON b.book_id = br.book_book_id
            LEFT JOIN library_user u ON u.user_id = br.library_user_user_id
            WHERE u.school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
            """
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        borrowing_status = form.borrowing_status.data
        if first_name: query += f' AND u.user_first_name like "%{first_name}%" '
        if last_name: query += f' AND u.user_last_name like "%{last_name}%" '
        if borrowing_status != "---" : query += f' AND borrowing_status = "{borrowing_status}" '
            
    query += f"ORDER BY br.borrowing_date desc;"
   #  print (query)
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    return render_template("operator_borrowings.html", pageTitle = "Search", form = form ,results=results, user_ID=user_ID)

@app.route('/operator_verify_return/<int:user_ID>', methods=['GET', 'POST'])
def operator_verify_return(user_ID):
    borrowing_id = request.form['borrowing_id']
    query = f"""UPDATE borrowing
                SET borrowing_status = "returned"
                WHERE borrowing_id='{borrowing_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_borrowings', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_borrowings', user_ID=user_ID))
    
    
@app.route('/operator_delete_borrowings/<int:user_ID>', methods=['GET', 'POST'])
def operator_delete_borrowings(user_ID):
    borrowing_id = request.form['borrowing_id']
    query = f"""DELETE FROM borrowing
                WHERE borrowing_id ='{borrowing_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_borrowings', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_borrowings', user_ID=user_ID))

@app.route('/operator_dash/<int:user_ID>/reservations', methods=['GET', 'POST'])
def operator_reservations(user_ID):
    cur = db.connection.cursor()
    cur.execute("DELETE FROM reservation WHERE DATEDIFF(NOW(), reservation_date) > 7")
    db.connection.commit()
    cur.close()
    form = borrowing_search_form()
    first_name = None
    last_name = None
    form.borrowing_status.choices = [("---","---"),("awaiting_pick_up", "Awaiting Pick Up") ,("on_hold", "On Hold")]
    query = f"""
            SELECT r.reservation_id, r.reservation_date, r.reservation_status, b.book_title, b.book_id, u.user_id, u.user_first_name, u.user_last_name FROM reservation r
            LEFT JOIN book b ON b.book_id = r.book_book_id
            LEFT JOIN library_user u ON u.user_id = r.library_user_user_id
            WHERE u.school_id = (SELECT school_id from library_user WHERE user_id = {user_ID})
            """
    if form.validate_on_submit():
        first_name = form.first_name.data
        last_name = form.last_name.data
        borrowing_status = form.borrowing_status.data
        if first_name: query += f' AND u.user_first_name like "%{first_name}%" '
        if last_name: query += f' AND u.user_last_name like "%{last_name}%" '
        if borrowing_status != "---" : query += f' AND reservation_status = "{borrowing_status}" '
            
    query += f"ORDER BY r.reservation_date desc;"
   #  print (query)
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    return render_template("operator_reservations.html", pageTitle = "Search", form = form ,results=results, user_ID=user_ID)

@app.route('/operator_borrowing_from_reservation/<int:user_ID>', methods=['GET', 'POST'])
def operator_borrowing_from_reservation(user_ID):
    book_id = request.form['book_id']
    user_id = request.form['user_id']
    query = f"""INSERT INTO borrowing (borrowing_status, book_book_id, library_user_user_id)
                VALUES ('active', {book_id}, {user_id});;           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_reservations', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_reservations', user_ID=user_ID))
    
@app.route('/operator_delete_reservation/<int:user_ID>', methods=['GET', 'POST'])
def operator_delete_reservation(user_ID):
    reservation_id = request.form['reservation_id']
    query = f"""DELETE FROM reservation
                WHERE reservation_id ='{reservation_id}';           
            """
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('operator_reservations', user_ID=user_ID))
    except Exception as e: ## OperationalError
        flash(str(e), "danger")
       #  print(str(e))
        return redirect(url_for('operator_reservations', user_ID=user_ID))



@app.route("/user_dash/<int:ID>")
def user(ID):

    query = f"""SELECT role_id
                FROM library_user
                WHERE user_id='{ID}';
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    rol = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    role=rol[0]['role_id']

    query = f"""SELECT book_title, borrowing_status FROM
                borrowing JOIN book ON book_book_id=book_id 
                WHERE library_user_user_id='{ID}'
                ORDER BY borrowing_status;
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    book = [dict(zip(column_names, entry))
            for entry in cur.fetchall()]
    
    query = f"""SELECT user_first_name, user_last_name, school_name, user_birthdate
                FROM library_user JOIN school ON library_user.school_id=school.school_id
                WHERE user_id={ID};
                """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    name = [dict(zip(column_names, entry))
            for entry in cur.fetchall()]

    return render_template("dash_user.html", pageTitle="User Dashboard",
                           book=book,name=name,ID=ID,role=role)


@app.route("/user_dash/teacher_update_info/<int:ID>", methods=['GET', 'POST'])
def teacher_update_info(ID):
    query = f"""
            SELECT username, user_password, user_first_name, user_last_name, user_birthdate,school_id
            FROM library_user
            WHERE user_id='{ID}';
            """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    info = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    form=change_info_form()

    cur = db.connection.cursor()
    cur.execute('SELECT school_id, school_name FROM school;')
    form.school.choices = list(cur.fetchall())
    cur.close()

    old_username = form.username.default = info[0]['username']
   #  print(old_username)
    old_password = form.password.default = info[0]['user_password']
    old_first_name = form.first_name.default = info[0]['user_first_name']
    old_last_name = form.last_name.default = info[0]['user_last_name']
    old_school=form.school.default=info[0]['school_id']
    old_birthdate = form.birthdate.default = info[0]['user_birthdate']
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        first_name = form.first_name.data
        last_name = form.last_name.data
        school = form.school.data
        birthdate = form.birthdate.data

        col = " "
        val = " "
        change = 0

        if username!=old_username:
            change+=1
            col+='username '
            val+=username +' '

        if password!=old_password:
            change+=1
            col+='user_password '
            val+=password +' '

        if first_name!=old_first_name:
            change+=1
            col+='user_first_name '
            val+=first_name +' '

        if last_name!=old_last_name:
            change+=1
            col+='user_last_name '
            val+=last_name + ' '

        if school!=old_school:
            change+=1
            col+='school_id '
            val+=school + ' ' 
            
        if birthdate!=old_birthdate:
            change+=1
            col+='user_birthdate '
            val+=str(birthdate) + ' '

        if change>0:
            colum=col.split()
            value=val.split()
            result = ", ".join([f"{c} = '{v}'" for c, v in zip(colum, value)])
           #  print(result)
            query = f"""
                    UPDATE library_user
                    SET {result}
                    WHERE user_id={ID};
                    """
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()

        return redirect(url_for('user', ID=ID))
    form.process()
    return render_template("change_info.html", pageTitle="Change Your Information",form=form)



@app.route("/user_dash/reservation/<int:ID>", methods=['GET', 'POST'])
def reservation(ID):
    query = "select category.category_name from category;"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    categorys = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()

    query = f"""
            SELECT book_id, book_title, reservation_date, reservation_status
            FROM reservation JOIN book ON book_book_id=book_id
            WHERE library_user_user_id='{ID}';
            """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    reservations = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    query=f"""SELECT book_id, book_title, author_first_name, author_last_name, category_name FROM 
                    book JOIN book_author ON book_id=book_author.book_book_id
                    JOIN author ON author_author_id=author_id
                    JOIN book_category ON book_id=book_category.book_book_id
                    JOIN category ON category_category_id=category_id
                    WHERE TRUE
                    """
    
    form=user_books_form()
    choises=[item['category_name'] for item in categorys]
    choises.insert(0,"")
    form.category.choices = choises

    if form.validate_on_submit():
        titl = form.title.data
        aut= form.author.data
        cat= form.category.data
        form.title.data=""
        form.author.data=""
        form.category.data=""   
        if titl:
            query += f""" AND book_title = '{titl}'  """
        if aut:
            query += f""" AND author_first_name='{aut.split()[0]}'
                        AND author_last_name='{aut.split()[1]}'; """
        if cat:
             query += f""" AND category_name = '{cat}'  """
        
         
    query += f"ORDER BY book_title;"
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    books = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    newBooks=merge_fields(books,'author_first_name','author_last_name','author_name')
    conBooks=consolidate(newBooks,'book_title','author_name','category_name')
    cur.close()
    return render_template("reservation.html", pageTitle="Available Books",
                           reservations=reservations, 
                           categorys=categorys, 
                           books=conBooks,
                           form=form,
                           ID=ID)

@app.route('/reserve/<int:ID>', methods=['GET', 'POST'])
def reserve(ID):
    book_id = request.form['book_id']

    query = f"""INSERT INTO reservation (book_book_id,library_user_user_id)
                VALUES ('{book_id}','{ID}');"""
    
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        return redirect(url_for('reservation', ID=ID))
    
    except Exception as error:
        error_message = str(error)
        return render_template("reserve_error.html", pageTitle="Error During Reservation",
                           error=error_message)

@app.route('/unreserve/<int:ID>', methods=['GET', 'POST'])
def unreserve(ID):
    book_id = request.form['book_id']
    query = f"""DELETE FROM reservation 
                WHERE library_user_user_id='{ID}'
                AND book_book_id='{book_id}';            
            """
    cur = db.connection.cursor()
    cur.execute(query)
    db.connection.commit()
    cur.close()
    return redirect(url_for('reservation', ID=ID))

@app.route('/update_reservation/<int:ID>', methods=['GET', 'POST'])
def update_reservation(ID):
    book_id = request.form['book_id']

    query = f"""SELECT  school_book_amount 
                FROM 
                (SELECT school_id FROM library_user WHERE user_id={ID}) AS a
                JOIN school_book ON a.school_id=school_school_id 
                WHERE book_book_id='{book_id}';"""
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    booksnum = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    books=booksnum[0]['school_book_amount']
    if books>0:
        query = f"""UPDATE reservation
                    SET reservation_status = 'awaiting_pick_up'
                    WHERE book_book_id={book_id} AND library_user_user_id={ID};"""
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
    return redirect(url_for('reservation', ID=ID))



@app.route('/user_review/<int:ID>/<int:book_id>', methods=['GET', 'POST'])
def user_review(ID,book_id):
    form=user_review_form()
    if form.validate_on_submit():
        rating = form.rating.data
        desc= form.description.data
        hasrv=0
        if  rating and desc:
            query = f"""SELECT role_id FROM library_user WHERE user_id='{ID}';"""
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            role = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            status='pending_validation'
            if role[0]['role_id']==3:
                status='validated'
            cur.close()
            query = f"""INSERT INTO review (library_user_user_id, 
                            book_book_id, review_rating, review_text, review_status)
                            VALUES ('{ID}','{book_id}','{rating}', '{desc}', '{status}');         
                """
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()

    query = f"""SELECT review_date, review_rating, review_text 
                FROM review 
                WHERE library_user_user_id ='{ID}'
                AND book_book_id='{book_id}'          
            """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    reviews = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    cur.close()
    return render_template("user_review.html", pageTitle="Review",
                           has_review=len(reviews),
                           rev=reviews,
                           form=form)
    
@app.route('/user_read_review', methods=['GET', 'POST'])
def user_read_review():
    book_id = request.form['book_id']
    query = f"""SELECT r.review_rating, r.review_text, u.username from review r
                LEFT JOIN library_user u ON u.user_id = r.library_user_user_id
                WHERE r.book_book_id = {book_id}
                ;           
            """
    cur = db.connection.cursor()
    cur.execute(query)
    column_names = [i[0] for i in cur.description]
    results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
    print("hi")
    print(results)
    cur.close()
        

    return render_template("user_read_review.html", pageTitle="Review", results = results)
    

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle="Not Found"), 404


@app.errorhandler(500)
def page_not_found2(e):
    return render_template("errors/500.html", pageTitle="Internal Server Error"), 500

# Function to merge 2 fields of each row of a list of dictionaries
def merge_fields(dictionaries, field1, field2, merged_field):
    merged_dictionaries = []
    
    for dictionary in dictionaries:
        merged_dictionary = dict(dictionary)
        if field1 in dictionary and field2 in dictionary:
            merged_value = dictionary[field1] + ' ' + dictionary[field2]
            merged_dictionary[merged_field] = merged_value
            del merged_dictionary[field1]
            del merged_dictionary[field2]
        
        merged_dictionaries.append(merged_dictionary)
    
    return merged_dictionaries

from collections import defaultdict
# Function that consolidates the list based on the specified field name and
# merges the specified fields correctly, handling multiple values. 
# The resulting list contains one dictionary for each uniqe
# value in the specified field, with merged fields as required.
def consolidate(lst, field_name, *fields):
    consolidated_dict = defaultdict(lambda: defaultdict(set))
    
    for d in lst:
        value = d[field_name]
        existing_dict = consolidated_dict[value]
        for key, val in d.items():
            if key != field_name:
                existing_dict[key].add(val)
    
    consolidated_list = []
    for value, nested_dict in consolidated_dict.items():
        consolidated_dict = {field_name: value}
        for key, value_set in nested_dict.items():
            if len(value_set) == 1:
                consolidated_dict[key] = next(iter(value_set))
            else:
                if key in fields:
                    consolidated_dict[key] = ", ".join(value_set)
                else:
                    consolidated_dict[key] = list(value_set)
        consolidated_list.append(consolidated_dict)
    
    return consolidated_list

# "John Doe, Jane Smith, Alice Brown" --->
# [{'author_first_name': 'John', 'author_last_name': 'Doe'}, 
# {'author_first_name': 'Jane', 'author_last_name': 'Smith'}, 
# {'author_first_name': 'Alice', 'author_last_name': 'Brown'}]
def convert_string_names_to_list_of_dictionaries(input_string):
    result = []
    entries = input_string.split(',')

    for entry in entries:
        names = entry.strip().split(' ')
        if len(names) == 2:
            first_name, last_name = names
            result.append({"author_first_name": first_name, "author_last_name": last_name})

    return result

def is_item_in_table(item, table):
    for i in table:
        if i == item:
            return True
    return False

def extract_field_values(dictionaries_list, field_name):
    result = []

    for dictionary in dictionaries_list:
        if field_name in dictionary:
            result.append(dictionary[field_name])

    return result

def find_added_and_removed_strings(Old, New, Added, Removed):
    for string in New:
        if string not in Old:
            Added.append(string)

    for string in Old:
        if string not in New:
            Removed.append(string)

def find_added_and_removed_dicts(Old, New, Added, Removed):
    for new_dict in New:
        if all(new_dict.get(field) == old_dict.get(field) for field in ['author_first_name', 'author_last_name'] for old_dict in Old):
            continue
        Added.append(new_dict)

    for old_dict in Old:
        if all(old_dict.get(field) == new_dict.get(field) for field in ['author_first_name', 'author_last_name'] for new_dict in New):
            continue
        Removed.append(old_dict)