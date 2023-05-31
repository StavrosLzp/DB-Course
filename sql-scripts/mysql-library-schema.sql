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
    REFERENCES `category` (`category_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_category_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
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
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
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
  `user_birthdate` DATE NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
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
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_publisher_book1_idx` ON `publisher` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reservation_date` DATE NOT NULL,
  `reservation_status` ENUM('awaiting_pick_up', 'on_hold') NOT NULL,
  `book_book_id` INT NOT NULL,
  `library_user_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reservation_id`),
  CONSTRAINT `fk_reservation_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_library_user1`
    FOREIGN KEY (`library_user_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_reservation_book1_idx` ON `reservation` (`book_book_id` ASC) VISIBLE;

CREATE INDEX `fk_reservation_library_user1_idx` ON `reservation` (`library_user_user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `review_text` VARCHAR(350) NULL DEFAULT NULL,
  `review_rating` INT NOT NULL,
  `review_date` DATE NOT NULL,
  `book_book_id` INT NOT NULL,
  `library_user_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_review_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_library_user1`
    FOREIGN KEY (`library_user_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_review_book1_idx` ON `review` (`book_book_id` ASC) VISIBLE;

CREATE INDEX `fk_review_library_user1_idx` ON `review` (`library_user_user_id` ASC) VISIBLE;


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
    REFERENCES `school` (`school_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_school_book_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
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
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_table1_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_table1_book1_idx` ON `book_keyword` (`book_book_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `borrowing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `borrowing` (
  `borrowing_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrowing_date` DATE NOT NULL,
  `borrowing_status` ENUM('active', 'returned') NOT NULL,
  `book_book_id` INT NOT NULL,
  `library_user_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`borrowing_id`),
  CONSTRAINT `fk_borrowing_book1`
    FOREIGN KEY (`book_book_id`)
    REFERENCES `book` (`book_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_borrowing_library_user1`
    FOREIGN KEY (`library_user_user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_borrowing_book1_idx` ON `borrowing` (`book_book_id` ASC) VISIBLE;

CREATE INDEX `fk_borrowing_library_user1_idx` ON `borrowing` (`library_user_user_id` ASC) VISIBLE;

USE `library` ;

-- -----------------------------------------------------
-- Placeholder table for view `Loans_per_school_admin_this_year`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Loans_per_school_admin_this_year` (`user_id` INT, `user_first_name` INT, `user_last_name` INT, `borrowings_count` INT);

-- -----------------------------------------------------
-- Placeholder table for view `books_written_per_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books_written_per_author` (`author_id` INT, `author_first_name` INT, `author_last_name` INT, `books_written` INT);

-- -----------------------------------------------------
-- View `Loans_per_school_admin_this_year`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Loans_per_school_admin_this_year`;
USE `library`;
CREATE  OR REPLACE VIEW `Loans_per_school_admin_this_year` AS
SELECT op.user_id, op.user_first_name, op.user_last_name, COUNT(b.borrowing_id) AS borrowings_count from library_user op
LEFT JOIN school s ON s.library_admin_user_id = op.user_id
LEFT JOIN library_user u ON s.school_id = u.school_id
LEFT JOIN borrowing b ON u.user_id = b.library_user_user_id
WHERE u.user_id <> 0
AND YEAR(b.borrowing_date) = YEAR(NOW())
GROUP BY s.school_id;

-- -----------------------------------------------------
-- View `books_written_per_author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `books_written_per_author`;
USE `library`;
CREATE  OR REPLACE VIEW `books_written_per_author` AS
select a1.author_id, a1.author_first_name, a1.author_last_name, count(b.book_id) AS books_written from author a1
left join book_author ba ON  ba.author_author_id = a1.author_id
left join book b on b.book_id = ba.book_book_id
group by a1.author_id
order by a1.author_id asc;
USE `library`;

DELIMITER $$
USE `library`$$
CREATE TRIGGER user_Role_default
BEFORE INSERT ON library_user
FOR EACH ROW
BEGIN
    if NEW.role_id = NULL THEN
		SET NEW.role_id = 5;
	END IF;
END$$

USE `library`$$
CREATE TRIGGER enforce_reservation_limit
BEFORE INSERT ON reservation
FOR EACH ROW
BEGIN
    SET @reserve_count = NULL;
    SET @user_role_id_var = NULL;
    SET @reservation_limit = NULL;

    SELECT role_id into @user_role_id_var
    FROM library_user
    WHERE user_id = NEW.library_user_user_id;

    -- Prevent users from reserve book that they currently have borrowed
    IF (SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id =  NEW.book_book_id AND library_user_user_id = NEW.library_user_user_id AND borrowing_status = 'active') >= 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot reserve a copy of a Book that the same user has borrowed';
    END IF;
    
    -- Get the total number of books reserved by the user in the current week
    SELECT COUNT(*) INTO @reserve_count
    FROM reservation
    WHERE library_user_user_id = NEW.library_user_user_id
    AND DATEDIFF(NEW.reservation_date, reservation_date) <= 7;
    
    -- Determine the borrowing limit based on the user's role
    IF @user_role_id_var = 4 THEN -- Student role
        SET @reservation_limit = 2;
    ELSEIF @user_role_id_var = 3 THEN -- Professor role
        SET @reservation_limit = 1;
    END IF;
    
    -- Check if the reservation limit has been reached
    IF @reserve_count >= @reservation_limit THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Cannot reserve more books for that user';
    END IF;
    
    IF NEW.reservation_date IS NULL THEN
		SET NEW.reservation_date = CURDATE();
	END IF;
    
    
	-- Check availability 
	
    IF (SELECT school_book_amount FROM school_book 
    WHERE book_book_id =  NEW.book_book_id
    AND school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)) < 1 THEN
		-- No books available  status -> on hold 
        SET NEW.reservation_status = 'on_hold';
	ELSE -- Remove one book from school and status -> waiting for pick up
		UPDATE school_book set school_book_amount = school_book_amount - 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
		AND book_book_id = NEW.book_book_id;
        SET NEW.reservation_status = 'awaiting_pick_up';
	END IF;
END$$

USE `library`$$
CREATE TRIGGER reservation_delete_update_availability
BEFORE DELETE ON reservation
FOR EACH ROW
BEGIN
	
	IF OLD.reservation_status = 'awaiting_pick_up' THEN
		UPDATE school_book set school_book_amount = school_book_amount + 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = OLD.library_user_user_id)
		AND book_book_id = OLD.book_book_id;
	END IF;
END$$

USE `library`$$
CREATE DEFINER = CURRENT_USER TRIGGER `library`.`review_BEFORE_INSERT` BEFORE INSERT ON `review` FOR EACH ROW
BEGIN
	IF (NEW.review_rating > 5 OR NEW.review_rating < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'review rating between 0 and 5';
    END IF;
    
    SET NEW.review_date = CURDATE();
END$$

USE `library`$$
CREATE TRIGGER enforce_borrowing_limit
BEFORE INSERT ON borrowing
FOR EACH ROW
BEGIN
    SET @borrowing_count = NULL;
    SET @user_role_id_var = NULL;
    SET @borrowing_limit = NULL;

    SELECT role_id into @user_role_id_var
    FROM library_user
    WHERE user_id = NEW.library_user_user_id;

    
    IF (SELECT COUNT(borrowing_id) FROM borrowing WHERE book_book_id =  NEW.book_book_id AND library_user_user_id = NEW.library_user_user_id AND borrowing_status = 'active') >= 1 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot Borrow more than one copy of a Book.';
    END IF;
    
    -- Get the total number of books borrowed by the user in the current week
    SELECT COUNT(*) INTO @borrowing_count
    FROM borrowing
    WHERE library_user_user_id = NEW.library_user_user_id
    -- AND DATEDIFF(NEW.borrowing_date, borrowing_date) > 7 
    AND borrowing_status = 'active';
    
    -- Determine the borrowing limit based on the user's role
    IF @user_role_id_var = 4 THEN -- Student role
        SET @borrowing_limit = 2;
    ELSEIF @user_role_id_var = 3 THEN -- Professor role
        SET @borrowing_limit = 1;
    END IF;
    
    -- Check if the borrowing limit has been reached
    IF @borrowing_count >= @borrowing_limit THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Borrowing limit has been reached, make reservation instead.';
    END IF;
    
    if NEW.borrowing_date IS NULL THEN
		SET NEW.borrowing_date = CURDATE();
	END IF;
    
	-- Check availability 	
    IF (SELECT school_book_amount FROM school_book 
    WHERE book_book_id =  NEW.book_book_id
    AND school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)) < 1 THEN
		SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No books available, make reservation instead.';
	-- If user borrowing has a reservation delete reservation
	ELSEIF EXISTS ( SELECT * FROM reservation WHERE book_book_id =  NEW.book_book_id 
	AND library_user_user_id = NEW.library_user_user_id) THEN 
		DELETE FROM reservation WHERE book_book_id =  NEW.book_book_id 
		AND library_user_user_id = NEW.library_user_user_id;
	ElSEIF NEW.borrowing_status = 'active' THEN-- Remove one book from school 
		UPDATE school_book set school_book_amount = school_book_amount - 1
		WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
		AND book_book_id = NEW.book_book_id;
	END IF;
    
END$$

USE `library`$$
CREATE TRIGGER IncreaseBookAmountTrigger AFTER UPDATE ON borrowing
FOR EACH ROW
BEGIN

  -- Check if the borrowing status has changed to "returned"
  IF new.borrowing_status = 'returned' AND OLD.borrowing_status = 'active' THEN
	UPDATE school_book SET school_book_amount = school_book_amount + 1 
	WHERE school_school_id = (SELECT school_id from library_user WHERE user_id = NEW.library_user_user_id)
	AND book_book_id = NEW.book_book_id;
  END IF;
END;$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
