SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `keeper`;

ALTER TABLE `keeper`.`study`
  DROP COLUMN `member_number`;

ALTER TABLE `keeper`.`game_member_info`
  ADD COLUMN `baseball_per_day` INT NOT NULL DEFAULT 0;

ALTER TABLE `keeper`.`game_member_info`
  ADD COLUMN `baseball_day_point` INT NOT NULL DEFAULT 0;

ALTER TABLE `keeper`.`game_member_info`
  ADD COLUMN `play_date` DATE NOT NULL DEFAULT (CURRENT_DATE);

SET SQL_MODE=@OLD_SQL_MODE;