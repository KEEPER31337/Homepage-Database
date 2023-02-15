SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `keeper`;

ALTER TABLE `category`
    MODIFY COLUMN `parent_id` INT NULL,
    ADD INDEX `fk_category_category1_idx` (`parent_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_category_category1`
        FOREIGN KEY (`parent_id`)
        REFERENCES `keeper`.`category` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

UPDATE `category` SET `parent_id` = NULL WHERE `parent_id` = 0;


ALTER TABLE `comment`
    MODIFY `parent_id` INT NULL,
    ADD INDEX `fk_comment_comment1_idx` (`parent_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_comment_comment1`
        FOREIGN KEY (`parent_id`)
        REFERENCES `keeper`.`comment` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

UPDATE `comment` SET `parent_id` = NULL WHERE `parent_id` = 0;

ALTER TABLE `book`
    CHANGE COLUMN `total` `total_quantity` INT NOT NULL DEFAULT 1,
    CHANGE COLUMN `enable` `current_quantity` INT NOT NULL DEFAULT 1,
    DROP COLUMN `borrow`;


ALTER TABLE `book_borrow_info`
    MODIFY COLUMN `expire_date` DATE NOT NULL,
    ADD COLUMN `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
    ADD COLUMN `update_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
    DROP COLUMN `quantity`;


DELIMITER $$

USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`book_borrow_info_BEFORE_INSERT` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`book_borrow_info_BEFORE_INSERT` BEFORE INSERT ON `book_borrow_info` FOR EACH ROW
BEGIN
	IF NEW.expire_date IS NULL THEN
		SET NEW.expire_date = DATE_ADD(NEW.borrow_date, INTERVAL 14 DAY);
	END IF;
END$$


USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`book_borrow_info_BEFORE_UPDATE` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`book_borrow_info_BEFORE_UPDATE` BEFORE UPDATE ON `book_borrow_info` FOR EACH ROW
BEGIN
	SET NEW.update_time = CURRENT_TIME;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
