SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `keeper`;

ALTER TABLE `keeper`.`member` ADD COLUMN `total_attendance` INT NOT NULL DEFAULT 0;

/* Update previous member attendance days count. */
UPDATE `keeper`.`member` AS m,
    (SELECT member_id, COUNT(*) AS attend_count FROM attendance GROUP BY member_id) AS a
    SET m.total_attendance = a.attend_count WHERE m.id = a.member_id;

DELIMITER $$

USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`attendance_AFTER_INSERT` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`attendance_AFTER_INSERT` AFTER INSERT ON `attendance` FOR EACH ROW
BEGIN
	UPDATE member SET total_attendance = total_attendance + 1 WHERE id = NEW.member_id;
END$$

DELIMITER ;


SET SQL_MODE=@OLD_SQL_MODE;