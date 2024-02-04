/* ADD file_id column fk with file table */
ALTER TABLE `keeper`.`ctf_challenge`
  ADD COLUMN `file_id` INT NULL,
  ADD INDEX `fk_ctf_challenge_file1_idx` (`file_id` ASC) VISIBLE,
  ADD CONSTRAINT `fk_ctf_challenge_file1`
    FOREIGN KEY (`file_id`)
    REFERENCES `keeper`.`file` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

/* Insert default row on member_job table "ROLE_출제자" */
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`member_job` (`id`, `name`, `badge_thumbnail_id`) VALUES (10, 'ROLE_출제자', NULL);
COMMIT;
