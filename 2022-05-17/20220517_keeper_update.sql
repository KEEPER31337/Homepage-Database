-- -----------------------------------------------------
-- Table `keeper`.`ctf_dynamic_challenge_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_dynamic_challenge_info` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_dynamic_challenge_info` (
  `challenge_id` INT NOT NULL DEFAULT 1,
  `min_score` INT NOT NULL DEFAULT 1,
  `max_score` INT NOT NULL DEFAULT 100,
  PRIMARY KEY (`challenge_id`),
  INDEX `fk_ctf_dynamic_challenge_info_ctf_challenge1_idx` (`challenge_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_dynamic_challenge_info_ctf_challenge1`
    FOREIGN KEY (`challenge_id`)
    REFERENCES `keeper`.`ctf_challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `keeper`.`ctf_dynamic_challenge_info`
-- -----------------------------------------------------
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`ctf_dynamic_challenge_info` (`challenge_id`, `min_score`, `max_score`) VALUES (1, 1, 100);

COMMIT;
