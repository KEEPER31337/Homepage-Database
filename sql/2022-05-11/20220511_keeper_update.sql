USE `keeper` ;

-- -----------------------------------------------------
-- Table `keeper`.`ctf_contest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_contest` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_contest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL DEFAULT 'DEFAULT_CONTEST_NAME',
  `description` VARCHAR(45) NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `creator` INT NOT NULL DEFAULT 1,
  `is_joinable` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_contest_member1_idx` (`creator` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_contest_member1`
    FOREIGN KEY (`creator`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_team` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL DEFAULT 'DEFAULT_TEAM_NAME',
  `description` VARCHAR(200) NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `creator` INT NOT NULL DEFAULT 1,
  `score` INT NOT NULL DEFAULT 0,
  `contest_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_team_member1_idx` (`creator` ASC) VISIBLE,
  INDEX `fk_ctf_team_ctf_contest1_idx` (`contest_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_team_member1`
    FOREIGN KEY (`creator`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_team_ctf_contest1`
    FOREIGN KEY (`contest_id`)
    REFERENCES `keeper`.`ctf_contest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_challenge_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_challenge_type` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_challenge_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_challenge_category` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_challenge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_challenge` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL DEFAULT 'DEFAULT_CHALLENGE_NAME',
  `description` VARCHAR(200) NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `creator` INT NOT NULL DEFAULT 1,
  `is_solvable` TINYINT NOT NULL DEFAULT 0,
  `type_id` INT NULL,
  `category_id` INT NULL,
  `score` INT NOT NULL DEFAULT 0,
  `contest_id` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_challenge_ctf_challenge_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_ctf_challenge_ctf_challenge_category1_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_ctf_challenge_member1_idx` (`creator` ASC) VISIBLE,
  INDEX `fk_ctf_challenge_ctf_contest1_idx` (`contest_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_challenge_ctf_challenge_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `keeper`.`ctf_challenge_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_challenge_ctf_challenge_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `keeper`.`ctf_challenge_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_challenge_member1`
    FOREIGN KEY (`creator`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_challenge_ctf_contest1`
    FOREIGN KEY (`contest_id`)
    REFERENCES `keeper`.`ctf_contest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_team_has_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_team_has_member` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_team_has_member` (
  `ctf_team_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`ctf_team_id`, `member_id`),
  INDEX `fk_ctf_team_has_member_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_ctf_team_has_member_ctf_team1_idx` (`ctf_team_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_team_has_member_ctf_team1`
    FOREIGN KEY (`ctf_team_id`)
    REFERENCES `keeper`.`ctf_team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_team_has_member_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_flag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_flag` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_flag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL DEFAULT 'DEFAULT_FLAG_CONTENT',
  `team_id` INT NOT NULL DEFAULT 1,
  `challenge_id` INT NOT NULL DEFAULT 1,
  `is_correct` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_flag_ctf_team1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_ctf_flag_ctf_challenge1_idx` (`challenge_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_flag_ctf_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `keeper`.`ctf_team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_flag_ctf_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `keeper`.`ctf_challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`ctf_submit_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_submit_log` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_submit_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `submit_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `team_id` INT NOT NULL DEFAULT 1,
  `submitter` INT NOT NULL DEFAULT 1,
  `challenge_id` INT NOT NULL DEFAULT 1,
  `flag_submmitted` VARCHAR(200) NULL DEFAULT 'DEFAULT_FLAG_SUBMITTED',
  `is_correct` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_submit_log_ctf_team1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_ctf_submit_log_member1_idx` (`submitter` ASC) VISIBLE,
  INDEX `fk_ctf_submit_log_ctf_challenge1_idx` (`challenge_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_submit_log_ctf_team1`
    FOREIGN KEY (`team_id`)
    REFERENCES `keeper`.`ctf_team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_submit_log_member1`
    FOREIGN KEY (`submitter`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_submit_log_ctf_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `keeper`.`ctf_challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_contest`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_contest` (`id`, `name`, `description`, `register_time`, `creator`, `is_joinable`) VALUES (1, 'virtual_ctf_contest', 'virtual_ctf_contest_description', '2022-01-01 00:00:00', 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_team`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_team` (`id`, `name`, `description`, `register_time`, `creator`, `score`, `contest_id`) VALUES (1, 'virtual_ctf_team', 'virtual_ctf_team_description', '2022-01-01 00:00:00', 1, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_challenge_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_challenge_type` (`id`, `name`) VALUES (1, 'STANDARD');
INSERT INTO `keeper`.`ctf_challenge_type` (`id`, `name`) VALUES (2, 'DYNAMIC');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_challenge_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (1, 'Misc');
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (2, 'System');
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (3, 'Reversing');
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (4, 'Forensic');
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (5, 'Web');
INSERT INTO `keeper`.`ctf_challenge_category` (`id`, `name`) VALUES (6, 'Crypto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_challenge`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_challenge` (`id`, `name`, `description`, `register_time`, `creator`, `is_solvable`, `type_id`, `category_id`, `score`, `contest_id`) VALUES (1, 'virtual_ctf_challenge', 'virtual_ctf_challenge_description', '2022-01-01 00:00:00', 1, 0, NULL, NULL, 0, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_flag`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_flag` (`id`, `content`, `team_id`, `challenge_id`, `is_correct`) VALUES (1, 'virtual_ctf_flag', 1, 1, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_submit_log`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_submit_log` (`id`, `submit_time`, `team_id`, `submitter`, `challenge_id`, `flag_submmitted`, `is_correct`) VALUES (1, '2022-01-01 00:00:00', 1, 1, 1, 'virtual_ctf_submit_log_flag_submitted', 0);

COMMIT;

