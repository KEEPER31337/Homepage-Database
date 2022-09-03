
DELIMITER $$

USE `keeper_prod`$$
DROP TRIGGER IF EXISTS `keeper_prod`.`seminar_BEFORE_INSERT` $$
USE `keeper_prod`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper_prod`.`seminar_BEFORE_INSERT` BEFORE INSERT ON `seminar` FOR EACH ROW
BEGIN
	IF NEW.name IS NULL THEN
        SET NEW.name = DATE_FORMAT(CURRENT_TIME,'%Y%m%d');
    END IF;
END$$

DELIMITER ;