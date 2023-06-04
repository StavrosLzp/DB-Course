# DB-Course

## Dependencies

 - [MySQL](https://www.mysql.com/) for Windows. **IMPORTANT!!! " C:\Program Files\MySQL\MySQL Server 8.0\bin " NEEDS TO BE ADDED TO PATH FOR BACKUPS TO WORK**
 - [Python](https://www.python.org/downloads/), with the additional libraries:
    - [Flask](https://flask.palletsprojects.com/en/2.0.x/)
    - [Flask-MySQLdb](https://flask-mysqldb.readthedocs.io/en/latest/)
    - [faker](https://faker.readthedocs.io/en/master/) (for data generation)
    - [Flask-WTForms](https://flask-wtf.readthedocs.io/en/1.0.x/) and [email-validator](https://pypi.org/project/email-validator/) (a more involved method of input validation)

Use `pip3 install <package_name>` to install each individual Python package (library) directly for the entire system, or create a virtual environment with the [`venv`](https://docs.python.org/3/library/venv.html) module. The necessary packages for this app are listed in `requirements.txt` and can be installed all together via `pip install -r requirements.txt`.


## Instalation guide

- Clone repository through git or GitHub Desktop 
- Make sure all dependenies are met
- Run the following :
    - myslq -u root -p
    - source C:...\DB-Course\sql-scripts\mysql-library-schema.sql;
    - source C:...\DB-Course\sql-scripts\mysql-library-insert-data.sql;
    - (or run the sql files through mysql workbench)
- Run run.py in the dbdemo folder
- Connect to [the website](http://localhost:5000/)





