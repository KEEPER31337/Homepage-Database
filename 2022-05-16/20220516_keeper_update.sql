/* Modify column name, flag_submmitted -> flag_submitted */
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `keeper`.`ctf_submit_log`
  CHANGE COLUMN `flag_submmitted` `flag_submitted` VARCHAR(200);

SET SQL_MODE=@OLD_SQL_MODE;
