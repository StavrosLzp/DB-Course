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

CREATE TABLE Library_User_Role (
  role_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(45) NOT NULL,
  role_description VARCHAR(200) NOT NULL,
  PRIMARY KEY (role_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Library_User (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  user_password VARCHAR(16) NOT NULL,
  user_first_name VARCHAR(45) NOT NULL,
  user_last_name VARCHAR(45) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  school_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT fk_user_role_id FOREIGN KEY (role_id) REFERENCES Library_User_Role (role_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_user_school_id FOREIGN KEY (school_id) REFERENCES School (school_id) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
CREATE TABLE Book (
  book_ISBN INT UNSIGNED NOT NULL,
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
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (author_id),
  KEY idx_author_last_name (author_last_name),
  KEY idx_fk_book_ISBN (book_ISBN),
  CONSTRAINT fk_author_book_ISBN FOREIGN KEY (book_ISBN) REFERENCES Book (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
CREATE TABLE author_book (
  author_id INT UNSIGNED NOT NULL,
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (author_id,book_ISBN),
  -- Index 
  CONSTRAINT fk_author_book_book FOREIGN KEY (book_ISBN) REFERENCES actor (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_author_book_author FOREIGN KEY (author_id) REFERENCES actor (author_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/

CREATE TABLE Publisher (
  publisher_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  publisher_name VARCHAR(45) NOT NULL,
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (publisher_id),
  KEY idx_fk_book_ISBN (book_ISBN),
  CONSTRAINT fk_publisher_book_ISBN FOREIGN KEY (book_ISBN) REFERENCES Book (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Reservation (
  reservation_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  reservation_date DATE NOT NULL,
  reservation_return_date DATE NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (reservation_id),
  UNIQUE KEY  (user_id,book_ISBN),
  KEY idx_fk_user_id (user_id),
  KEY idx_fk_book_ISBN (book_ISBN),
  CONSTRAINT fk_reservation_user_id FOREIGN KEY (user_id) REFERENCES Library_User (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_reservation_book_ISBN FOREIGN KEY (book_ISBN) REFERENCES Book (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Borrowing(
  borrowing_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  borrowing_date DATE NOT NULL,
  borrowing_return_date DATE NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (borrowing_id),
  UNIQUE KEY  (user_id,book_ISBN),
  KEY idx_fk_user_id (user_id),
  KEY idx_fk_book_ISBN (book_ISBN),
  CONSTRAINT fk_borrowing_user_id FOREIGN KEY (user_id) REFERENCES Library_User (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_borrowing_book_ISBN FOREIGN KEY (book_ISBN) REFERENCES Book (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Review (
  review_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  review_text VARCHAR(150),
  user_id INT UNSIGNED NOT NULL,
  book_ISBN INT UNSIGNED NOT NULL,
  PRIMARY KEY (review_id),
  UNIQUE KEY  (user_id,book_ISBN),
  KEY idx_fk_user_id (user_id),
  KEY idx_fk_book_ISBN (book_ISBN),
  CONSTRAINT fk_review_user_id FOREIGN KEY (user_id) REFERENCES Library_User (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_review_book_ISBN FOREIGN KEY (book_ISBN) REFERENCES Book (book_ISBN) ON DELETE RESTRICT ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;