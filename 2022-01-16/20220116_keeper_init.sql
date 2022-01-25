-- MySQL Script generated by MySQL Workbench
-- Sun Jan 16 21:57:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema keeper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema keeper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `keeper` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `keeper` ;

-- -----------------------------------------------------
-- Table `keeper`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(250) NOT NULL,
  `author` VARCHAR(40) NOT NULL,
  `picture` VARCHAR(512) NULL,
  `information` TEXT NULL,
  `total` INT NOT NULL DEFAULT 1,
  `borrow` INT NOT NULL DEFAULT 0,
  `enable` INT NOT NULL DEFAULT 1,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `keeper`.`equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`equipment` ;

CREATE TABLE IF NOT EXISTS `keeper`.`equipment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `picture` VARCHAR(512) NULL,
  `information` TEXT NULL,
  `total` INT NOT NULL DEFAULT 1,
  `borrow` INT NOT NULL DEFAULT 0,
  `enable` INT NOT NULL DEFAULT 1,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `keeper`.`member_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_type` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_rank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_rank` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_rank` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login_id` VARCHAR(80) NOT NULL,
  `email_address` VARCHAR(250) NOT NULL,
  `password` VARCHAR(512) NOT NULL,
  `real_name` VARCHAR(40) NOT NULL,
  `nick_name` VARCHAR(40) NULL,
  `birthday` DATE NULL,
  `student_id` VARCHAR(45) NOT NULL,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `member_type_id` INT NULL DEFAULT 1,
  `member_rank_id` INT NULL DEFAULT 1,
  `point` INT NOT NULL DEFAULT 0,
  `level` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_id_UNIQUE` (`login_id` ASC) VISIBLE,
  UNIQUE INDEX `email_address_UNIQUE` (`email_address` ASC) VISIBLE,
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE,
  INDEX `fk_member_member_type1_idx` (`member_type_id` ASC) VISIBLE,
  INDEX `fk_member_member_rank1_idx` (`member_rank_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_member_type1`
    FOREIGN KEY (`member_type_id`)
    REFERENCES `keeper`.`member_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_member_rank1`
    FOREIGN KEY (`member_rank_id`)
    REFERENCES `keeper`.`member_rank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`book_borrow_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book_borrow_info` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book_borrow_info` (
  `id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `quantity` INT NOT NULL DEFAULT 1,
  `borrow_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `expire_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`id`),
  INDEX `fk_book_borrow_info_book1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_book_borrow_info_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_borrow_info_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `keeper`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_borrow_info_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `keeper`.`equipment_borrow_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`equipment_borrow_info` ;

CREATE TABLE IF NOT EXISTS `keeper`.`equipment_borrow_info` (
  `id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `quantity` INT NOT NULL,
  `borrow_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `expire_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `member_id` INT NOT NULL,
  `equipment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipment_borrow_info_equipment1_idx` (`equipment_id` ASC) VISIBLE,
  INDEX `fk_equipment_borrow_info_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_equipment_borrow_info_equipment1`
    FOREIGN KEY (`equipment_id`)
    REFERENCES `keeper`.`equipment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_equipment_borrow_info_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `keeper`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`category` ;

CREATE TABLE IF NOT EXISTS `keeper`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`posting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`posting` ;

CREATE TABLE IF NOT EXISTS `keeper`.`posting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(250) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `member_id` INT NOT NULL,
  `visit_count` INT NOT NULL DEFAULT 0,
  `like_count` INT NOT NULL DEFAULT 0,
  `dislike_count` INT NOT NULL DEFAULT 0,
  `comment_count` INT NOT NULL DEFAULT 0,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `update_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `ip_address` VARCHAR(128) NOT NULL,
  `allow_comment` TINYINT NOT NULL DEFAULT 1,
  `is_notice` TINYINT NOT NULL DEFAULT 0,
  `is_secret` TINYINT NOT NULL DEFAULT 0,
  `password` VARCHAR(512) NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posting_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_posting_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_posting_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posting_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `keeper`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`comment` ;

CREATE TABLE IF NOT EXISTS `keeper`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` LONGTEXT NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `update_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `ip_adress` VARCHAR(128) NOT NULL,
  `like_count` INT NOT NULL DEFAULT 0,
  `dislike_count` INT NOT NULL DEFAULT 0,
  `parent_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `posting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_comment_posting1_idx` (`posting_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`file` ;

CREATE TABLE IF NOT EXISTS `keeper`.`file` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `file_name` VARCHAR(256) NOT NULL,
  `file_path` VARCHAR(512) NOT NULL,
  `file_size` BIGINT NOT NULL,
  `upload_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `ip_address` VARCHAR(128) NOT NULL,
  `posting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_file_posting1_idx` (`posting_id` ASC) VISIBLE,
  CONSTRAINT `fk_file_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`level_standard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`level_standard` ;

CREATE TABLE IF NOT EXISTS `keeper`.`level_standard` (
  `level` INT NOT NULL AUTO_INCREMENT,
  `minimum_point` INT NULL,
  PRIMARY KEY (`level`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_job` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_job` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_has_member_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_has_member_job` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_has_member_job` (
  `member_id` INT NOT NULL,
  `member_Job_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `member_Job_id`),
  INDEX `fk_member_has_member_job_member_Job1_idx` (`member_Job_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_has_member_job_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_member_job_member_Job1`
    FOREIGN KEY (`member_Job_id`)
    REFERENCES `keeper`.`member_job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`thumbnail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`thumbnail` ;

CREATE TABLE IF NOT EXISTS `keeper`.`thumbnail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(512) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Insert member type/rank/job data.
-- -----------------------------------------------------

INSERT INTO member_type(name) VALUES ("비회원"),("정회원"),("휴면회원"),("졸업"),("탈퇴");
INSERT INTO member_rank(name) VALUES ("일반회원"),("우수회원");
INSERT INTO member_job(name) VALUES ("회장"),("부회장"),("대외부장"),("학술부장"),("전산관리자"),("서기"),("총무"),("사서");