SET SQL_MODE = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION";

ALTER TABLE `keeper`.`attendance`
    ADD COLUMN `rank_point` INT NOT NULL DEFAULT 0,
    ADD COLUMN `continuous_point` INT NOT NULL DEFAULT 0,
    CHANGE COLUMN `continous_day` `continuous_day` INT NOT NULL;