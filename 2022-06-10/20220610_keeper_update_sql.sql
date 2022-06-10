# keeper update sql, written in 20220610 and applied 20220611

USE `keeper`;

/* Add foreign key on ctf_submit_log ctf_contest_id */
ALTER TABLE `keeper`.`ctf_submit_log` 
    ADD COLUMN `ctf_contest_id` INT NOT NULL DEFAULT 1,
    ADD INDEX `fk_ctf_submit_log_ctf_contest1_idx` (`ctf_contest_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_ctf_submit_log_ctf_contest1`
        FOREIGN KEY (`ctf_contest_id`)
        REFERENCES `keeper`.`ctf_contest` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

/* Connect as SUPER account for setting trigger creation allow */
/* SET GLOBAL log_bin_trust_function_creators=1; */

/* Add trigger on ctf_contest before delete */
DELIMITER $$

USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`ctf_contest_BEFORE_DELETE` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`ctf_contest_BEFORE_DELETE` BEFORE DELETE ON `ctf_contest` FOR EACH ROW
BEGIN
	UPDATE ctf_submit_log SET ctf_contest_id = 1 WHERE ctf_contest_id = OLD.id;
END$$

DELIMITER ;
