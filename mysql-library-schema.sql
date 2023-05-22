-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema libary
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `libary` ;

-- -----------------------------------------------------
-- Schema libary
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `libary` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `libary` ;

-- -----------------------------------------------------
-- Table `libary`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`book` ;

CREATE TABLE IF NOT EXISTS `libary`.`book` (
  `book_ISBN` INT UNSIGNED NOT NULL,
  `book_title` VARCHAR(60) NOT NULL,
  `book_page_no` INT UNSIGNED NOT NULL,
  `book_subject` VARCHAR(45) NOT NULL,
  `book_language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`book_ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_book_title` ON `libary`.`book` (`book_title` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`author`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`author` ;

CREATE TABLE IF NOT EXISTS `libary`.`author` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_last_name` VARCHAR(45) NOT NULL,
  `author_first_name` VARCHAR(45) NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`author_id`),
  CONSTRAINT `fk_author_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `libary`.`book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_author_last_name` ON `libary`.`author` (`author_last_name` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `libary`.`author` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`library_user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`library_user_role` ;

CREATE TABLE IF NOT EXISTS `libary`.`library_user_role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(45) NOT NULL,
  `role_description` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `libary`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`school` ;

CREATE TABLE IF NOT EXISTS `libary`.`school` (
  `school_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `school_admin_id` INT UNSIGNED NULL DEFAULT NULL,
  `school_name` VARCHAR(50) NOT NULL,
  `school_mail_address` VARCHAR(70) NOT NULL,
  `city` VARCHAR(40) NOT NULL,
  `school_phone_number` VARCHAR(10) NOT NULL,
  `school_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`school_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_school_admin_id` ON `libary`.`school` (`school_admin_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`library_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`library_user` ;

CREATE TABLE IF NOT EXISTS `libary`.`library_user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `user_password` VARCHAR(16) NOT NULL,
  `user_first_name` VARCHAR(45) NOT NULL,
  `user_last_name` VARCHAR(45) NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `school_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `libary`.`library_user_role` (`role_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_school_id`
    FOREIGN KEY (`school_id`)
    REFERENCES `libary`.`school` (`school_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `fk_user_role_id` ON `libary`.`library_user` (`role_id` ASC) VISIBLE;

CREATE INDEX `fk_user_school_id` ON `libary`.`library_user` (`school_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`borrowing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`borrowing` ;

CREATE TABLE IF NOT EXISTS `libary`.`borrowing` (
  `borrowing_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `borrowing_date` DATE NOT NULL,
  `borrowing_return_date` DATE NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`borrowing_id`),
  CONSTRAINT `fk_borrowing_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `libary`.`book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_borrowing_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `libary`.`library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `libary`.`borrowing` (`user_id` ASC, `book_ISBN` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `libary`.`borrowing` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `libary`.`borrowing` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`publisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`publisher` ;

CREATE TABLE IF NOT EXISTS `libary`.`publisher` (
  `publisher_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `publisher_name` VARCHAR(45) NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`publisher_id`),
  CONSTRAINT `fk_publisher_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `libary`.`book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_fk_book_ISBN` ON `libary`.`publisher` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`reservation` ;

CREATE TABLE IF NOT EXISTS `libary`.`reservation` (
  `reservation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reservation_date` DATE NOT NULL,
  `reservation_return_date` DATE NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reservation_id`),
  CONSTRAINT `fk_reservation_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `libary`.`book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `libary`.`library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `libary`.`reservation` (`user_id` ASC, `book_ISBN` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `libary`.`reservation` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `libary`.`reservation` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `libary`.`review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `libary`.`review` ;

CREATE TABLE IF NOT EXISTS `libary`.`review` (
  `review_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `review_text` VARCHAR(150) NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_review_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `libary`.`book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `libary`.`library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `libary`.`review` (`user_id` ASC, `book_ISBN` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `libary`.`review` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `libary`.`review` (`book_ISBN` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
