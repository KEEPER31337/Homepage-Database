# keeper update sql, written in 20220802

USE `keeper`;

-- -----------------------------------------------------
-- Table `keeper`.`election`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`election` ;

CREATE TABLE IF NOT EXISTS `keeper`.`election` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `creator` INT NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `is_available` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_election_member1_idx` (`creator` ASC) VISIBLE,
  CONSTRAINT `fk_election_member1`
    FOREIGN KEY (`creator`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`election_voter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`election_voter` ;

CREATE TABLE IF NOT EXISTS `keeper`.`election_voter` (
  `voter_id` INT NOT NULL DEFAULT 1,
  `election_id` INT NOT NULL DEFAULT 1,
  `is_voted` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`election_id`, `voter_id`),
  INDEX `fk_election_voter_election1_idx` (`election_id` ASC) VISIBLE,
  CONSTRAINT `fk_election_voter_member1`
    FOREIGN KEY (`voter_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_election_voter_election1`
    FOREIGN KEY (`election_id`)
    REFERENCES `keeper`.`election` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`election_candidate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`election_candidate` ;

CREATE TABLE IF NOT EXISTS `keeper`.`election_candidate` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `election_id` INT NOT NULL DEFAULT 1,
  `candidate_id` INT NOT NULL DEFAULT 1,
  `member_job_id` INT NOT NULL DEFAULT 9,
  `description` VARCHAR(200) NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `vote_count` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_election_candidate_member_job1_idx` (`member_job_id` ASC) VISIBLE,
  INDEX `fk_election_candidate_member1_idx` (`candidate_id` ASC) VISIBLE,
  INDEX `fk_election_candidate_election1_idx` (`election_id` ASC) VISIBLE,
  CONSTRAINT `fk_election_candidate_member_job1`
    FOREIGN KEY (`member_job_id`)
    REFERENCES `keeper`.`member_job` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_election_candidate_member1`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_election_candidate_election1`
    FOREIGN KEY (`election_id`)
    REFERENCES `keeper`.`election` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`election_chart_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`election_chart_log` ;

CREATE TABLE IF NOT EXISTS `keeper`.`election_chart_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vote_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `election_candidate_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_election_chart_log_election_candidate1_idx` (`election_candidate_id` ASC) VISIBLE,
  CONSTRAINT `fk_election_chart_log_election_candidate1`
    FOREIGN KEY (`election_candidate_id`)
    REFERENCES `keeper`.`election_candidate` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `keeper`.`election`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`election` (`id`, `name`, `description`, `creator`, `register_time`, `is_available`) VALUES (1, 'virtual_election', NULL, 1, '2022-01-01 00:00:00', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `keeper`.`election_candidate`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`election_candidate` (`id`, `election_id`, `candidate_id`, `member_job_id`, `description`, `register_time`, `vote_count`) VALUES (1, 1, 1, 9, NULL, '2022-01-01 00:00:00', 0);

COMMIT;