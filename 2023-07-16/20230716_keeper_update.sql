USE `keeper`;

ALTER TABLE `keeper`.`study`
  CHANGE COLUMN note_link notion_link VARCHAR(256) NULL;

-- -----------------------------------------------------
-- Data for table `keeper`.`member_job`
-- -----------------------------------------------------
START TRANSACTION;

UPDATE `keeper`.`member_job` SET `name` = 'ROLE_FRONT_전산관리자' WHERE `id` = 5;
UPDATE `keeper`.`member_job` SET `name` = 'ROLE_BACK_전산관리자', `badge_thumbnail_id` = 15 WHERE `id` = 6;
UPDATE `keeper`.`member_job` SET `name` = 'ROLE_서기', `badge_thumbnail_id` = 16 WHERE `id` = 7;
UPDATE `keeper`.`member_job` SET `name` = 'ROLE_총무', `badge_thumbnail_id` = 17 WHERE `id` = 8;
UPDATE `keeper`.`member_job` SET `name` = 'ROLE_사서', `badge_thumbnail_id` = 18 WHERE `id` = 9;
UPDATE `keeper`.`member_job` SET `name` = 'ROLE_회원'  WHERE `id` = 10;
INSERT INTO `keeper`.`member_job` (`id`, `name`, `badge_thumbnail_id`) VALUES (11, 'ROLE_출제자', NULL);

COMMIT;