
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='';

ALTER TABLE `keeper`.`seminar` MODIFY COLUMN `attendance_code` VARCHAR(10) NULL;

START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`merit_type` (`id`, `merit`, `is_merit`, `detail`) VALUES (DEFAULT, 3, 0, '결석');

COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;