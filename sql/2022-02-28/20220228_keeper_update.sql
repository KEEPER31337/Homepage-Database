-- -----------------------------------------------------
-- Table `keeper`.`study`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`study` ;

CREATE TABLE IF NOT EXISTS `keeper`.`study` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `information` VARCHAR(256) NULL,
  `register_time` DATETIME NULL DEFAULT (CURRENT_TIME),
  `year` INT NULL,
  `season` INT NULL,
  `git_link` VARCHAR(256) NULL,
  `note_link` VARCHAR(256) NULL,
  `etc_link` VARCHAR(256) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `keeper`.`study_has_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`study_has_member` ;

CREATE TABLE IF NOT EXISTS `keeper`.`study_has_member` (
  `study_id` INT NOT NULL,
  `member_id` INT NOT NULL,
  PRIMARY KEY (`study_id`, `member_id`),
  INDEX `fk_study_has_member_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_study_has_member_study1_idx` (`study_id` ASC) VISIBLE,
  CONSTRAINT `fk_study_has_member_study1`
    FOREIGN KEY (`study_id`)
    REFERENCES `keeper`.`study` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_study_has_member_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;