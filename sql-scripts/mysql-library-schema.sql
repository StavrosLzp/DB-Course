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
  `book_ISBN` INT UNSIGNED NOT NULL,
  `book_title` VARCHAR(60) NOT NULL,
  `book_page_no` INT UNSIGNED NOT NULL,
  `book_subject` VARCHAR(45) NOT NULL,
  `book_language` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`book_ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_book_title` ON `book` (`book_title` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `book_author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `book_author` (
  `author_author_id` INT UNSIGNED NOT NULL,
  `book_book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`author_author_id`, `book_book_ISBN`),
  CONSTRAINT `fk_book_author_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `author` (`author_id`),
  CONSTRAINT `fk_book_author_book1`
    FOREIGN KEY (`book_book_ISBN`)
    REFERENCES `book` (`book_ISBN`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_book_author_author1_idx` ON `book_author` (`author_author_id` ASC) VISIBLE;

CREATE INDEX `fk_book_author_book1_idx` ON `book_author` (`book_book_ISBN` ASC) VISIBLE;


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
  `school_admin_name` VARCHAR(50) NOT NULL,
  `school_mail_address` VARCHAR(70) NOT NULL,
  `city` VARCHAR(40) NOT NULL,
  `school_phone_number` VARCHAR(10) NOT NULL,
  `school_email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`school_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `school_name_UNIQUE` ON `school` (`school_name` ASC) VISIBLE;

CREATE INDEX `idx_school_admin_id` ON `school` (`school_admin_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `library_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `library_user` (
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
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`publisher_id`),
  CONSTRAINT `fk_publisher_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE INDEX `idx_fk_book_ISBN` ON `publisher` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reservation_date` DATE NOT NULL,
  `status` ENUM('on-hold', 'active', 'returned', 'due') NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`reservation_id`),
  CONSTRAINT `fk_reservation_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `reservation` (`user_id` ASC, `book_ISBN` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `reservation` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `reservation` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `review_text` VARCHAR(150) NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `book_ISBN` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`review_id`),
  CONSTRAINT `fk_review_book_ISBN`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `book` (`book_ISBN`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_review_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `library_user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE UNIQUE INDEX `user_id` ON `review` (`user_id` ASC, `book_ISBN` ASC) VISIBLE;

CREATE INDEX `idx_fk_user_id` ON `review` (`user_id` ASC) VISIBLE;

CREATE INDEX `idx_fk_book_ISBN` ON `review` (`book_ISBN` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `school_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_book` (
  `school_school_id` INT UNSIGNED NOT NULL,
  `book_book_ISBN` INT UNSIGNED NOT NULL,
  `school_book_amount` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`school_school_id`, `book_book_ISBN`),
  CONSTRAINT `fk_school_book_book1`
    FOREIGN KEY (`book_book_ISBN`)
    REFERENCES `book` (`book_ISBN`),
  CONSTRAINT `fk_school_book_school1`
    FOREIGN KEY (`school_school_id`)
    REFERENCES `school` (`school_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE INDEX `fk_school_book_book1_idx` ON `school_book` (`book_book_ISBN` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
