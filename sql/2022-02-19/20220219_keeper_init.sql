-- MySQL Script generated by MySQL Workbench
-- Sat Feb 19 10:18:30 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema keeper
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema keeper
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `keeper` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `keeper` ;

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
  `nick_name` VARCHAR(40) NOT NULL,
  `birthday` DATE NULL,
  `student_id` VARCHAR(45) NULL,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `member_type_id` INT NULL DEFAULT 1,
  `member_rank_id` INT NULL DEFAULT 1,
  `point` INT NOT NULL DEFAULT 0,
  `level` INT NOT NULL DEFAULT 0,
  `thumbnail_id` INT NULL,
  `merit` INT NOT NULL DEFAULT 0,
  `demerit` INT NOT NULL DEFAULT 0,
  `generation` FLOAT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_id_UNIQUE` (`login_id` ASC) VISIBLE,
  UNIQUE INDEX `email_address_UNIQUE` (`email_address` ASC) VISIBLE,
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC) VISIBLE,
  INDEX `fk_member_member_type1_idx` (`member_type_id` ASC) VISIBLE,
  INDEX `fk_member_member_rank1_idx` (`member_rank_id` ASC) VISIBLE,
  INDEX `fk_member_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_member_type1`
    FOREIGN KEY (`member_type_id`)
    REFERENCES `keeper`.`member_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_member_rank1`
    FOREIGN KEY (`member_rank_id`)
    REFERENCES `keeper`.`member_rank` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`category` ;

CREATE TABLE IF NOT EXISTS `keeper`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `parent_id` INT NULL DEFAULT 0,
  `href` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`posting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`posting` ;

CREATE TABLE IF NOT EXISTS `keeper`.`posting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(250) NOT NULL,
  `content` TEXT NOT NULL,
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
  `is_temp` TINYINT NOT NULL DEFAULT 0,
  `password` VARCHAR(512) NULL,
  `category_id` INT NOT NULL,
  `thumbnail_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_posting_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_posting_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_posting_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  CONSTRAINT `fk_posting_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posting_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `keeper`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_posting_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
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
  `posting_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_file_posting1_idx` (`posting_id` ASC) VISIBLE,
  CONSTRAINT `fk_file_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
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
  `file_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_thumbnail_file1_idx` (`file_id` ASC) VISIBLE,
  CONSTRAINT `fk_thumbnail_file1`
    FOREIGN KEY (`file_id`)
    REFERENCES `keeper`.`file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`book_department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book_department` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book_department` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`book`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(250) NOT NULL,
  `author` VARCHAR(40) NOT NULL,
  `information` TEXT NULL,
  `department` INT NULL,
  `total` INT NOT NULL DEFAULT 1,
  `borrow` INT NOT NULL DEFAULT 0,
  `enable` INT NOT NULL DEFAULT 1,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `thumbnail_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_book_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  INDEX `fk_book_book_department1_idx` (`department` ASC) VISIBLE,
  CONSTRAINT `fk_book_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_book_department1`
    FOREIGN KEY (`department`)
    REFERENCES `keeper`.`book_department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `keeper`.`equipment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`equipment` ;

CREATE TABLE IF NOT EXISTS `keeper`.`equipment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `information` TEXT NULL,
  `total` INT NOT NULL DEFAULT 1,
  `borrow` INT NOT NULL DEFAULT 0,
  `enable` INT NOT NULL DEFAULT 1,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `thumbnail_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_equipment_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  CONSTRAINT `fk_equipment_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


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
-- Table `keeper`.`comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`comment` ;

CREATE TABLE IF NOT EXISTS `keeper`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `update_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `ip_address` VARCHAR(128) NOT NULL,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `member_job_id` INT NOT NULL,
  INDEX `fk_member_has_member_job_member_job1_idx` (`member_job_id` ASC) VISIBLE,
  INDEX `fk_member_has_member_job_member1_idx` (`member_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_member_has_member_job_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_member_job_member_job1`
    FOREIGN KEY (`member_job_id`)
    REFERENCES `keeper`.`member_job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_has_posting_like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_has_posting_like` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_has_posting_like` (
  `member_id` INT NOT NULL,
  `posting_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `posting_id`),
  INDEX `fk_member_has_posting_posting1_idx` (`posting_id` ASC) VISIBLE,
  INDEX `fk_member_has_posting_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_has_posting_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_posting_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_has_posting_dislike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_has_posting_dislike` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_has_posting_dislike` (
  `member_id` INT NOT NULL,
  `posting_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `posting_id`),
  INDEX `fk_member_has_posting1_posting1_idx` (`posting_id` ASC) VISIBLE,
  INDEX `fk_member_has_posting1_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_has_posting1_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_posting1_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_has_comment_like`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_has_comment_like` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_has_comment_like` (
  `member_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `comment_id`),
  INDEX `fk_member_has_comment_comment1_idx` (`comment_id` ASC) VISIBLE,
  INDEX `fk_member_has_comment_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_has_comment_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `keeper`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`member_has_comment_dislike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_has_comment_dislike` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_has_comment_dislike` (
  `member_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`member_id`, `comment_id`),
  INDEX `fk_member_has_comment1_comment1_idx` (`comment_id` ASC) VISIBLE,
  INDEX `fk_member_has_comment1_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_has_comment1_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_has_comment1_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `keeper`.`comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`static_write_title`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`static_write_title` ;

CREATE TABLE IF NOT EXISTS `keeper`.`static_write_title` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NULL,
  `type` VARCHAR(40) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`static_write_subtitle_image`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`static_write_subtitle_image` ;

CREATE TABLE IF NOT EXISTS `keeper`.`static_write_subtitle_image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `subtitle` VARCHAR(250) NULL,
  `static_write_title_id` INT NOT NULL,
  `thumbnail_id` INT NULL,
  `display_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_static_write_subtitle_image_static_write_title1_idx` (`static_write_title_id` ASC) VISIBLE,
  INDEX `fk_static_write_subtitle_image_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  CONSTRAINT `fk_static_write_subtitle_image_static_write_title1`
    FOREIGN KEY (`static_write_title_id`)
    REFERENCES `keeper`.`static_write_title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_static_write_subtitle_image_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`static_write_content`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`static_write_content` ;

CREATE TABLE IF NOT EXISTS `keeper`.`static_write_content` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` TEXT NULL,
  `static_write_subtitle_image_id` INT NOT NULL,
  `display_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_static_write_content_static_write_subtitle_image1_idx` (`static_write_subtitle_image_id` ASC) VISIBLE,
  CONSTRAINT `fk_static_write_content_static_write_subtitle_image1`
    FOREIGN KEY (`static_write_subtitle_image_id`)
    REFERENCES `keeper`.`static_write_subtitle_image` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`attendance` ;

CREATE TABLE IF NOT EXISTS `keeper`.`attendance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `point` INT NOT NULL DEFAULT 100,
  `random_point` INT NOT NULL DEFAULT 0,
  `rank_point` INT NOT NULL DEFAULT 0,
  `continuous_point` INT NOT NULL DEFAULT 0,
  `ip_address` VARCHAR(128) NOT NULL,
  `greetings` VARCHAR(250) NULL,
  `continuous_day` INT NOT NULL,
  `member_id` INT NOT NULL,
  `rank` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_attendance_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_attendance_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`non_absence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`non_absence` ;

CREATE TABLE IF NOT EXISTS `keeper`.`non_absence` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `term` VARCHAR(45) NOT NULL,
  `day` INT NOT NULL,
  `point` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`friend`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`friend` ;

CREATE TABLE IF NOT EXISTS `keeper`.`friend` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `follower` INT NOT NULL,
  `followee` INT NOT NULL,
  `register_date` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`),
  INDEX `fk_friend_member1_idx` (`follower` ASC) VISIBLE,
  INDEX `fk_friend_member2_idx` (`followee` ASC) VISIBLE,
  CONSTRAINT `fk_friend_member1`
    FOREIGN KEY (`follower`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_friend_member2`
    FOREIGN KEY (`followee`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`point_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`point_log` ;

CREATE TABLE IF NOT EXISTS `keeper`.`point_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `member_id` INT NOT NULL,
  `point` INT NOT NULL DEFAULT 0,
  `detail` VARCHAR(45) NULL,
  `presented` INT NULL,
  `is_spent` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_point_log_member1_idx` (`presented` ASC) VISIBLE,
  INDEX `fk_point_log_member2_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_point_log_member1`
    FOREIGN KEY (`presented`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_point_log_member2`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`game_member_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`game_member_info` ;

CREATE TABLE IF NOT EXISTS `keeper`.`game_member_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `dice_per_day` INT NOT NULL DEFAULT 0,
  `roulette_per_day` INT NOT NULL DEFAULT 0,
  `lotto_per_day` INT NOT NULL DEFAULT 0,
  `last_play_time` DATETIME NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`),
  INDEX `fk_game_member_info_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_game_member_info_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `keeper`.`member_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`member_type` (`id`, `name`) VALUES (DEFAULT, '비회원');
INSERT INTO `keeper`.`member_type` (`id`, `name`) VALUES (DEFAULT, '정회원');
INSERT INTO `keeper`.`member_type` (`id`, `name`) VALUES (DEFAULT, '휴면회원');
INSERT INTO `keeper`.`member_type` (`id`, `name`) VALUES (DEFAULT, '졸업');
INSERT INTO `keeper`.`member_type` (`id`, `name`) VALUES (DEFAULT, '탈퇴');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`member_rank`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`member_rank` (`id`, `name`) VALUES (DEFAULT, '일반회원');
INSERT INTO `keeper`.`member_rank` (`id`, `name`) VALUES (DEFAULT, '우수회원');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`member`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`member` (`id`, `login_id`, `email_address`, `password`, `real_name`, `nick_name`, `birthday`, `student_id`, `register_date`, `member_type_id`, `member_rank_id`, `point`, `level`, `thumbnail_id`, `merit`, `demerit`, `generation`) VALUES (DEFAULT, 'virtual_member', 'virtual_email', 'virtual_password', '탈퇴회원', '탈퇴회원', NULL, '000000000', '2022-01-01 00:00:00', NULL, NULL, 0, 0, NULL, 0, 0, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (219, 'KEEPER', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (29422, '동아리 소개', 219, 'about');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (8, '이벤트', 219, 'event');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (9, '동아리 일정', 219, 'schedule');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (2, '게시판', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (105, '공지사항', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (6105, '건의사항', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (116, '자유게시판', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (147718, '연재글', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (3, '동아리활동', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (117, '발표자료', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (105900, '스터디', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (2996, '기술문서', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (23400, '회계부', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (34608, 'KUCIS', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (5125, '정보', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (508, '해킹대회정보', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (648, '유용한사이트', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (647, 'Tools', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (662, '외부문서&강의', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (81570, '취업&면접', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (1377, '시험', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (5, '서비스', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (106402, '도서 신청', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (27, '기자재 신청', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (60024, '도서 대여', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (84493, '기자재 대여', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (6, '포인트', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (30052, '랭킹', 6, 'attendance');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (33777, '출석부', 6, 'attendance');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (11302, '게임', 6, 'game');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (1, 'virtual_category', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`posting`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`posting` (`id`, `title`, `content`, `member_id`, `visit_count`, `like_count`, `dislike_count`, `comment_count`, `register_time`, `update_time`, `ip_address`, `allow_comment`, `is_notice`, `is_secret`, `is_temp`, `password`, `category_id`, `thumbnail_id`) VALUES (1, 'virtual_posting', 'virtual_posting_content', 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, '0.0.0.0', DEFAULT, DEFAULT, DEFAULT, DEFAULT, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`book_department`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'language');
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'security');
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'textbook');
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'certification');
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'document');
INSERT INTO `keeper`.`book_department` (`id`, `name`) VALUES (DEFAULT, 'etc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`member_job`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_회장');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_부회장');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_대외부장');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_학술부장');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_전산관리자');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_서기');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_총무');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_사서');
INSERT INTO `keeper`.`member_job` (`id`, `name`) VALUES (DEFAULT, 'ROLE_회원');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`static_write_title`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`static_write_title` (`id`, `title`, `type`) VALUES (DEFAULT, NULL, 'intro');
INSERT INTO `keeper`.`static_write_title` (`id`, `title`, `type`) VALUES (DEFAULT, NULL, 'activity');
INSERT INTO `keeper`.`static_write_title` (`id`, `title`, `type`) VALUES (DEFAULT, NULL, 'excellece');
INSERT INTO `keeper`.`static_write_title` (`id`, `title`, `type`) VALUES (DEFAULT, NULL, 'history');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`non_absence`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`non_absence` (`id`, `term`, `day`, `point`) VALUES (DEFAULT, 'YEAR', 365, 20000);
INSERT INTO `keeper`.`non_absence` (`id`, `term`, `day`, `point`) VALUES (DEFAULT, 'MONTH', 28, 5000);
INSERT INTO `keeper`.`non_absence` (`id`, `term`, `day`, `point`) VALUES (DEFAULT, 'WEEK', 7, 1000);

COMMIT;

