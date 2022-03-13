ALTER TABLE `keeper`.`study` ADD COLUMN (
  `member_number` INT NOT NULL DEFAULT 0,
  `thumbnail_id` INT NOT NULL),
  ADD INDEX `fk_study_thumbnail1_idx` (`thumbnail_id` ASC) VISIBLE,
  ADD CONSTRAINT `fk_study_thumbnail1`
    FOREIGN KEY (`thumbnail_id`)
    REFERENCES `keeper`.`thumbnail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;