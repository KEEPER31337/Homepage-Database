USE keeper;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge_has_ctf_challenge_category` (
  `ctf_challenge_id` INT NOT NULL,
  `ctf_challenge_category_id` INT NOT NULL,
  PRIMARY KEY (`ctf_challenge_id`, `ctf_challenge_category_id`),
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

INSERT INTO ctf_challenge_has_ctf_challenge_category 
    SELECT id AS ctf_challenge_id, category_id AS ctf_challenge_category_id FROM ctf_challenge WHERE category_id IS NOT NULL;

ALTER TABLE ctf_challenge DROP CONSTRAINT fk_ctf_challenge_ctf_challenge_category1;
ALTER TABLE ctf_challenge DROP COLUMN category_id;
