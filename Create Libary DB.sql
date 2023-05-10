DROP SCHEMA IF EXISTS libary;
CREATE SCHEMA libary;
USE libary;

CREATE TABLE School (
  school_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  school_admin_id INT UNSIGNED,
  school_name VARCHAR(50) NOT NULL,
  school_mail_address VARCHAR(70) NOT NULL,
  city VARCHAR(40) NOT NULL,
  school_phone_number VARCHAR(10) NOT NULL,
  school_email VARCHAR(50) NOT NULL,
  PRIMARY KEY (school_id),
  KEY idx_school_admin_id (school_admin_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Library_User (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  user_password VARCHAR(16) NOT NULL,
  user_first_name VARCHAR(45) NOT NULL,
  user_last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Library_User_Role (
  role_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(45) NOT NULL,
  role_description VARCHAR(200) NOT NULL,
  PRIMARY KEY (role_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Book (
  book_ISBN INT UNSIGNED NOT NULL AUTO_INCREMENT,
  book_title VARCHAR(60) NOT NULL,
  book_page_no INT UNSIGNED NOT NULL,
  -- book_abstract 
  -- book_picture
  book_subject VARCHAR(45) NOT NULL,
  book_language VARCHAR(45) NOT NULL,
  -- book_keywords
  PRIMARY KEY (book_ISBN),
  KEY idx_book_title (book_title)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Author (
  author_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  author_last_name VARCHAR(45) NOT NULL,
  author_first_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (author_id),
  KEY idx_author_last_name (author_last_name)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Publisher (
  publisher_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (publisher_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Review (
  review_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  review_text VARCHAR(150),
  PRIMARY KEY (review_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
