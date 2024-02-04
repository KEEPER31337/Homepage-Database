use keeper;

ALTER TABLE `keeper`.`seminar` 
  ADD COLUMN `attendance_start_time` DATETIME NULL DEFAULT NULL AFTER `open_time`;