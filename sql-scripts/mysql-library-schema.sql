-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `library` ;

-- -----------------------------------------------------
-- Schema library
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `library` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `library` ;

-- -----------------------------------------------------
-- Table `author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `author` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_first_name` VARCHAR(45) NOT NULL,
  `author_last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_author_last_name` ON `author` (`author_last_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_ISBN` VARCHAR(20) NOT NULL,
  `book_title` VARCHAR(60) NOT NULL,
  `book_page_no` INT UNSIGNED NOT NULL,
  `book_language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`book_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_book_title` ON `book` (`book_title` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `book_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_author` (
  `book_book_id` INT NOT NULL,
  `author_author_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`book_book_id`, `author_author_id`),
  CONSTRAINT `fk_book_author_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `author` (`author_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_author_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_book_author_author1_idx` ON `book_author` (`author_author_id` ASC) VISIBLE;

CREATE INDEX `fk_book_author_book1_idx` ON `book_author` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_category` (
  `category_category_id` INT UNSIGNED NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`category_category_id`, `book_book_id`),
  CONSTRAINT `fk_book_category_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `category` (`category_id`),
  CONSTRAINT `fk_book_category_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_book_category_category1_idx` ON `book_category` (`category_category_id` ASC) VISIBLE;

CREATE INDEX `fk_book_category_book1_idx` ON `book_category` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_user_role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  `role_description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `school`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school` (
  `school_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `school_name` VARCHAR(50) NOT NULL,
  `school_principal_name` VARCHAR(50) NOT NULL,
  `library_admin_user_id` INT UNSIGNED NOT NULL,
  `school_mail_address` VARCHAR(70) NOT NULL,
  `city` VARCHAR(40) NOT NULL,
  `school_phone_number` VARCHAR(10) NOT NULL,
  `school_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`school_id`),
  CONSTRAINT `fk_school_library_admin1`
    FOREIGN KEY (`library_admin_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `school_name_UNIQUE` ON `school` (`school_name` ASC) VISIBLE;

CREATE UNIQUE INDEX `library_admin_user_id_UNIQUE` ON `school` (`library_admin_user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(16) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `role_id` INT UNSIGNED NULL,
  `school_id` INT UNSIGNED NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `library_user_role` (`role_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `school` (`school_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_user_role_id` ON `library_user` (`role_id` ASC) VISIBLE;

CREATE INDEX `fk_user_school_id` ON `library_user` (`school_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `publisher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `publisher` (
  `publisher_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `publisher_name` VARCHAR(45) NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`publisher_id`),
  CONSTRAINT `fk_publisher_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_publisher_book1_idx` ON `publisher` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reservation_date` DATE NOT NULL,
  `status` ENUM('awaiting_pick_up', 'on_hold') NOT NULL,
  `book_book_id` INT NOT NULL,
  `library_user_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reservation_id`, `library_user_user_id`),
  CONSTRAINT `fk_reservation_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_library_user1`
    FOREIGN KEY (`library_user_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_reservation_book1_idx` ON `reservation` (`book_book_id` ASC) VISIBLE;

CREATE INDEX `fk_reservation_library_user1_idx` ON `reservation` (`library_user_user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `review_text` VARCHAR(150) NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_review_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `review` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `review` (`user_id` ASC) VISIBLE;

CREATE INDEX `fk_review_book1_idx` ON `review` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_book` (
  `school_school_id` INT UNSIGNED NOT NULL,
  `school_book_amount` INT UNSIGNED NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`school_school_id`, `book_book_id`),
  CONSTRAINT `fk_school_book_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`),
  CONSTRAINT `fk_school_book_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_school_book_book1_idx` ON `school_book` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `keyword` (
  `keyword_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `book_keyword`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_keyword` (
  `keyword_keyword_id` INT UNSIGNED NOT NULL,
  `book_book_id` INT NOT NULL,
  PRIMARY KEY (`keyword_keyword_id`, `book_book_id`),
  CONSTRAINT `fk_table1_keyword1`
    FOREIGN KEY (`keyword_keyword_id`)
    REFERENCES `keyword` (`keyword_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_table1_book1_idx` ON `book_keyword` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `borrowing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borrowing` (
  `borrowing_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrowing_date` DATE NOT NULL,
  `status` ENUM('active', 'returned') NOT NULL,
  `book_book_id` INT NOT NULL,
  `library_user_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`borrowing_id`),
  CONSTRAINT `fk_borrowing_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_borrowing_library_user1`
    FOREIGN KEY (`library_user_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_borrowing_book1_idx` ON `borrowing` (`book_book_id` ASC) VISIBLE;

CREATE INDEX `fk_borrowing_library_user1_idx` ON `borrowing` (`library_user_user_id` ASC) VISIBLE;

USE `library`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER enforce_borrowing_limit
BEFORE INSERT ON borrowing
FOR EACH ROW
BEGIN
    DECLARE user_id_var INT;
    DECLARE borrowing_count INT;
    DECLARE user_role_id_var INT;
    DECLARE borrowing_limit INT;
    DECLARE book_id_var INT;
    
    -- Get the user ID and role ID of the borrower and the book id
    SELECT library_user_user_id, book_book_id INTO user_id_var,  book_id_var
    FROM borrowing
    WHERE borrowing_id = NEW.borrowing_id;
    
    SELECT role_id into user_role_id_var
    FROM library_user
    WHERE user_id = user_id_var;
    
    IF (SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id = book_id_var) > 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Book is not available for reservation.';
    END IF;
    
    -- Get the total number of books borrowed by the user in the current week
    SELECT COUNT(*) INTO borrowing_count
    FROM borrowing
    WHERE library_user_user_id = user_id_var;
   -- AND YEARWEEK(borrowing_date) = YEARWEEK(NEW.borrowing_date);
    
    -- Determine the borrowing limit based on the user's role
    IF user_role_id_var = 4 THEN -- Student role
        SET borrowing_limit = 2;
    ELSEIF user_role_id_var = 3 THEN -- Professor role
        SET borrowing_limit = 1;
    END IF;
    
    -- Check if the borrowing limit has been reached
    IF borrowing_count >= borrowing_limit THEN
        INSERT INTO reservation (reservation_date, status, library_user_user_id, book_book_id)
        VALUES (CURDATE(),  'on_hold', user_id_var, book_id_var);
    END IF;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
