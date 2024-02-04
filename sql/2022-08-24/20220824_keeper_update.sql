
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