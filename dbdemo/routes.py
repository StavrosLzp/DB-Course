from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from dbdemo import app, db  # initially created by __init__.py, need to be used here
from dbdemo.forms import *

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
            cur = db.connection.cursor()
            query = f"""
                    INSERT INTO library_user (username,user_password,user_first_name,user_last_name,school_id,user_birthdate,role_id)
                    VALUES ("{username}", "{password}", "{first_name}", "{last_name}", "{school}", "{birthdate}", "5");
                    """
            cur.execute(query)
            print(query)
            db.connection.commit()
            cur.close()
            flash("Sign up successfull. Your account will soon be reviewed for activation by your chool operator", "success")
            return redirect("/")
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
            print(str(e))
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
    query1 = f"select a.author_id, a.author_first_name, a.author_last_name from author a where a.author_id = "
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

@app.route("/operator_dash/<int:user_ID>/search_books", methods=['GET', 'POST'])
def operator_show_books(user_ID):
    
    # Get operator school id 
    query = f"""
            SELECT school_id from library_user 
            WHERE user_id = {user_ID};
            """
    cur = db.connection.cursor()
    cur.execute(query)
    result = cur.fetchall()
    school_id = result[0][0]
    cur.close()
    results = []

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
    if form.validate_on_submit():
        book_title = form.book_title.data
        book_category = form.book_category.data
        print(book_category)
        book_author = form.book_author.data
        book_copies = form.book_copies.data
        query = f"""
                SELECT b.book_id, b.book_title, sb.school_book_amount, a.author_first_name, a.author_last_name FROM book b
                left join school_book sb on b.book_id = sb.book_book_id 
                """
        if book_category : 
            query +="""left join book_category bc on b.book_id = bc.book_book_id 
                left join category c on c.category_id = bc.category_category_id"""
        query +="""left join book_author ba on b.book_id = ba.book_book_id 
                left join author a on a.author_id = ba.author_author_id """         
        query +=f"""
                WHERE sb.school_school_id = {school_id}
                AND b.book_title like "%{book_title}%" 
                """
        if book_author: query += f"AND ba.author_author_id = {book_author} \n"
                
        if book_category : query += f"AND bc.category_category_id = {book_category} \n"
        query += f"""
                AND sb.school_book_amount >= {book_copies}
                order by book_id;
                """
        print(query)
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        newresults=merge_fields(results,'author_first_name','author_last_name','author_name')
        results=consolidate(newresults,'book_id', 'book_title','author_name','category_name', 'school_book_amount')
        cur.close()
        #return render_template("operator_show_books.html", pageTitle = "Create Grade", results=results)
    return render_template("operator_search_books.html", pageTitle = "Search", form = form , results=results)

@app.route("/operator_dash/<int:user_ID>/search_owed_returns", methods=['GET', 'POST'])
def operator_search_owed_returns(user_ID):
    # Get Admin school id 
    query = f"""
            SELECT school_id from library_user 
            WHERE user_id = {user_ID};
            """
    cur = db.connection.cursor()
    cur.execute(query)
    result = cur.fetchall()
    school_id = result[0][0]
    cur.close()
    results = {}
    
    form = owed_returs_form()
    first_name = None
    last_name = None
    days_due = 1
    query = f"""
            SELECT user_id, user_first_name, user_last_name, school_id, currently_borrowed, days_due FROM library_user_days_due
            WHERE school_id = {school_id}
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
    print(results)
    print("Hi")
    
    return render_template("operator_search_owed_returns.html", pageTitle = "Search", form = form ,results=results)

@app.route("/operator_dash/<int:user_ID>/average_rating", methods=['GET', 'POST'])
def operator_average_rating(user_ID):
    # Get Admin school id 
    query = f"""
            SELECT school_id from library_user 
            WHERE user_id = {user_ID};
            """
    cur = db.connection.cursor()
    cur.execute(query)
    result = cur.fetchall()
    school_id = result[0][0]
    cur.close()
    
    
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
            Where school_id = {school_id} AND review_status = 'validated'
            """
    query2 = f"""
            SELECT c.category_name, AVG(r.review_rating) AS average_rating
            FROM category c
            JOIN book_category bc ON c.category_id = bc.category_category_id
            JOIN book b ON bc.book_book_id = b.book_id
            LEFT JOIN review r ON b.book_id = r.book_book_id
            left join library_user u ON u.user_id = r.library_user_user_id
            WHERE u.school_id = {school_id} AND review_status = 'validated'
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


@app.route("/user_dash/<int:ID>")
def user(ID):
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
                           book=book,name=name,ID=ID)


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
