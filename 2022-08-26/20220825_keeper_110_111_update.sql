
-- -----------------------------------------------------
-- Table `keeper`.`survey`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`survey` ;

CREATE TABLE IF NOT EXISTS `keeper`.`survey` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `open_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `close_time` DATETIME NULL,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(200) NULL,
  `is_visible` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`survey_reply`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`survey_reply` ;

CREATE TABLE IF NOT EXISTS `keeper`.`survey_reply` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`survey_member_reply`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`survey_member_reply` ;

CREATE TABLE IF NOT EXISTS `keeper`.`survey_member_reply` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL DEFAULT 1,
  `survey_id` INT NOT NULL DEFAULT 1,
  `reply_id` INT NOT NULL DEFAULT 1,
  `reply_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`),
  INDEX `fk_survey_member_reply_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_survey_member_reply_survey1_idx` (`survey_id` ASC) VISIBLE,
  INDEX `fk_survey_member_reply_survey_reply1_idx` (`reply_id` ASC) VISIBLE,
  UNIQUE INDEX `is_reply_duplicated` (`member_id` ASC, `survey_id` ASC) INVISIBLE,
  CONSTRAINT `fk_survey_member_reply_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_survey_member_reply_survey1`
    FOREIGN KEY (`survey_id`)
    REFERENCES `keeper`.`survey` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_survey_member_reply_survey_reply1`
    FOREIGN KEY (`reply_id`)
    REFERENCES `keeper`.`survey_reply` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`survey_reply_excuse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`survey_reply_excuse` ;

CREATE TABLE IF NOT EXISTS `keeper`.`survey_reply_excuse` (
  `survey_member_reply_id` INT NOT NULL DEFAULT 1,
  `rest_excuse` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`survey_member_reply_id`),
  CONSTRAINT `fk_survey_reply_excuse_survey_member_reply1`
    FOREIGN KEY (`survey_member_reply_id`)
    REFERENCES `keeper`.`survey_member_reply` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`seminar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`seminar` ;

CREATE TABLE IF NOT EXISTS `keeper`.`seminar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `open_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `attendance_close_time` DATETIME NULL,
  `lateness_close_time` DATETIME NULL,
  `attendance_code` VARCHAR(10) BINARY NULL,
  `name` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`seminar_attendance_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`seminar_attendance_status` ;

CREATE TABLE IF NOT EXISTS `keeper`.`seminar_attendance_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`seminar_attendance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`seminar_attendance` ;

CREATE TABLE IF NOT EXISTS `keeper`.`seminar_attendance` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seminar_id` INT NOT NULL DEFAULT 1,
  `member_id` INT NOT NULL DEFAULT 1,
  `status_id` INT NOT NULL DEFAULT 1,
  `attend_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  PRIMARY KEY (`id`),
  INDEX `fk_seminar_attendance_seminar1_idx` (`seminar_id` ASC) VISIBLE,
  INDEX `fk_seminar_attendance_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_seminar_attendance_seminar_attendance_status1_idx` (`status_id` ASC) VISIBLE,
  UNIQUE INDEX `is_seminar_attendance_duplicated` (`member_id` ASC, `seminar_id` ASC) VISIBLE,
  CONSTRAINT `fk_seminar_attendance_seminar1`
    FOREIGN KEY (`seminar_id`)
    REFERENCES `keeper`.`seminar` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seminar_attendance_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seminar_attendance_seminar_attendance_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `keeper`.`seminar_attendance_status` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`seminar_attendance_excuse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`seminar_attendance_excuse` ;

CREATE TABLE IF NOT EXISTS `keeper`.`seminar_attendance_excuse` (
  `seminar_attendance_id` INT NOT NULL,
  `absence_excuse` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`seminar_attendance_id`),
  CONSTRAINT `fk_seminar_attendance_excuse_seminar_attendance1`
    FOREIGN KEY (`seminar_attendance_id`)
    REFERENCES `keeper`.`seminar_attendance` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `keeper`;

DELIMITER $$

USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`survey_BEFORE_INSERT` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`survey_BEFORE_INSERT` BEFORE INSERT ON `survey` FOR EACH ROW
BEGIN
	IF NEW.name IS NULL THEN
        SET NEW.name = DATE_FORMAT(CURRENT_TIME,'%Y%m%d_활동인원조사');
    END IF;
END$$


USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`seminar_BEFORE_INSERT` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`seminar_BEFORE_INSERT` BEFORE INSERT ON `seminar` FOR EACH ROW
BEGIN
	IF NEW.name IS NULL THEN
        SET NEW.name = DATE_FORMAT(CURRENT_TIME,'%Y%m%d_세미나');
    END IF;
END$$


DELIMITER ;

-- -----------------------------------------------------
-- Data for table `keeper`.`survey`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`survey` (`id`, `open_time`, `close_time`, `name`, `description`, `is_visible`) VALUES (DEFAULT, '2022-01-01 00:00:00', '2022-01-01 00:00:00', 'virtual_survey', NULL, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`survey_reply`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`survey_reply` (`id`, `type`) VALUES (DEFAULT, '활동');
INSERT INTO `keeper`.`survey_reply` (`id`, `type`) VALUES (DEFAULT, '휴면(군휴학)');
INSERT INTO `keeper`.`survey_reply` (`id`, `type`) VALUES (DEFAULT, '휴면(기타)');
INSERT INTO `keeper`.`survey_reply` (`id`, `type`) VALUES (DEFAULT, '졸업');
INSERT INTO `keeper`.`survey_reply` (`id`, `type`) VALUES (DEFAULT, '탈퇴');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`seminar`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`seminar` (`id`, `open_time`, `attendance_close_time`, `lateness_close_time`, `attendance_code`, `name`) VALUES (DEFAULT, '2022-01-01 00:00:00', '2022-01-01 00:00:00', '2022-01-01 00:00:00', '000', 'virtual_seminar');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`seminar_attendance_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`seminar_attendance_status` (`id`, `type`) VALUES (DEFAULT, '출석');
INSERT INTO `keeper`.`seminar_attendance_status` (`id`, `type`) VALUES (DEFAULT, '지각');
INSERT INTO `keeper`.`seminar_attendance_status` (`id`, `type`) VALUES (DEFAULT, '결석');
INSERT INTO `keeper`.`seminar_attendance_status` (`id`, `type`) VALUES (DEFAULT, '개인사정');

COMMIT;

USE `keeper`;

-- -----------------------------------------------------
-- Table `keeper`.`merit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`merit_type` ;

CREATE TABLE IF NOT EXISTS `keeper`.`merit_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `merit` INT NOT NULL DEFAULT 0,
  `is_merit` TINYINT NOT NULL DEFAULT 1,
  `detail` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`merit_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`merit_log` ;

CREATE TABLE IF NOT EXISTS `keeper`.`merit_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `awarder_id` INT NOT NULL DEFAULT 1,
  `giver_id` INT NOT NULL DEFAULT 1,
  `time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `merit_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_merit_log_member1_idx` (`awarder_id` ASC) VISIBLE,
  INDEX `fk_merit_log_member2_idx` (`giver_id` ASC) VISIBLE,
  INDEX `fk_merit_log_merit_type1_idx` (`merit_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_merit_log_member1`
    FOREIGN KEY (`awarder_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_merit_log_member2`
    FOREIGN KEY (`giver_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_merit_log_merit_type1`
    FOREIGN KEY (`merit_type_id`)
    REFERENCES `keeper`.`merit_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `keeper`.`merit_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`merit_type` (`id`, `merit`, `is_merit`, `detail`) VALUES (DEFAULT, 0, 1, 'virtual_merit');

COMMIT;