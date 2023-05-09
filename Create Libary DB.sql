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
  
