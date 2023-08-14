USE `keeper` ;

-- -----------------------------------------------------
-- Table `keeper`.`ctf_challenge_has_ctf_challenge_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_challenge_has_ctf_challenge_category` ;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge_has_ctf_challenge_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ctf_challenge_id` INT NOT NULL,
  `ctf_challenge_category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ctf_challenge_has_ctf_challenge_category_ctf_challenge_c_idx` (`ctf_challenge_category_id` ASC) VISIBLE,
  INDEX `fk_ctf_challenge_has_ctf_challenge_category_ctf_challenge1_idx` (`ctf_challenge_id` ASC) VISIBLE,
  CONSTRAINT `fk_ctf_challenge_has_ctf_challenge_category_ctf_challenge1`
    FOREIGN KEY (`ctf_challenge_id`)
    REFERENCES `keeper`.`ctf_challenge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ctf_challenge_has_ctf_challenge_category_ctf_challenge_cat1`
    FOREIGN KEY (`ctf_challenge_category_id`)
    REFERENCES `keeper`.`ctf_challenge_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `keeper`.`member_read_posting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`member_read_posting` ;

CREATE TABLE IF NOT EXISTS `keeper`.`member_read_posting` (
  `id` INT NOT NULL,
  `member_id` INT NOT NULL,
  `posting_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_member_read_posting_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_member_read_posting_posting1_idx` (`posting_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_read_posting_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_read_posting_posting1`
    FOREIGN KEY (`posting_id`)
    REFERENCES `keeper`.`posting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;