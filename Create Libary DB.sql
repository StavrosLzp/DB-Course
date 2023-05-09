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
  
CREATE TABLE User (
  user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  username VARCHAR(20) NOT NULL,
  user_password VARCHAR(16) NOT NULL,
  user_first_name VARCHAR(45) NOT NULL,
  user_last_name VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_id)
  )ENGINE=InnoDB DEFAULT CHARSET=utf8;
  
  
