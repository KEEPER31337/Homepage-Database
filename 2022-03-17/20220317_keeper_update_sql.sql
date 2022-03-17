ALTER TABLE `keeper`.`member_rank` 
    ADD COLUMN (`badge_thumbnail_id` INT NULL),
    ADD INDEX `fk_member_rank_thumbnail1_idx` (`badge_thumbnail_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_member_rank_thumbnail1`
        FOREIGN KEY (`badge_thumbnail_id`)
        REFERENCES `keeper`.`thumbnail` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE `keeper`.`member_job` 
    ADD COLUMN (`badge_thumbnail_id` INT NULL),
    ADD INDEX `fk_member_job_thumbnail1_idx` (`badge_thumbnail_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_member_job_thumbnail1`
        FOREIGN KEY (`badge_thumbnail_id`)
        REFERENCES `keeper`.`thumbnail` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

ALTER TABLE `keeper`.`member_type` 
    ADD COLUMN `badge_thumbnail_id` INT NULL,
    ADD INDEX `fk_member_type_thumbnail1_idx` (`badge_thumbnail_id` ASC) VISIBLE,
    ADD CONSTRAINT `fk_member_type_thumbnail1`
        FOREIGN KEY (`badge_thumbnail_id`)
        REFERENCES `keeper`.`thumbnail` (`id`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION;

UPDATE `keeper`.`file` SET `file_name` = 'default_thumbnail_member.png', `file_path` =  'keeper_files/thumbnail/default/default_thumbnail_member.png' WHERE `id` = 1;
UPDATE `keeper`.`file` SET `file_name` = 'default_thumbnail_posting.png', `file_path` =  'keeper_files/thumbnail/default/default_thumbnail_posting.png' WHERE `id` = 2;
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (3, 'profile_badge_grade_first.gif', 'keeper_files/thumbnail/badge/profile_badge_grade_first.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (4, 'profile_badge_grade_second.gif', 'keeper_files/thumbnail/badge/profile_badge_grade_second.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (5, 'profile_badge_state_graduate', 'keeper_files/thumbnail/badge/profile_badge_state_graduate.png', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (6, 'profile_badge_state_quit', 'keeper_files/thumbnail/badge/profile_badge_state_quit.png', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (7, 'profile_badge_state_sleep', 'keeper_files/thumbnail/badge/profile_badge_state_sleep.png', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (8, 'profile_badge_state_regular', 'keeper_files/thumbnail/badge/profile_badge_state_regular.png', 33609, DEFAULT, '1.1.1.1', NULL);

UPDATE `keeper`.`thumbnail` SET `path` = 'keeper_files/thumbnail/default/default_thumbnail_member.png' WHERE `id` = 1;
UPDATE `keeper`.`thumbnail` SET `path` = 'keeper_files/thumbnail/default/default_thumbnail_posting.png' WHERE `id` = 2;
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (3, 'keeper_files/thumbnail/badge/profile_badge_grade_first.gif', 3);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (4, 'keeper_files/thumbnail/badge/profile_badge_grade_second.gif', 4);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (5, 'keeper_files/thumbnail/badge/profile_badge_state_graduate.png', 5);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (6, 'keeper_files/thumbnail/badge/profile_badge_state_quit.png', 6);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (7, 'keeper_files/thumbnail/badge/profile_badge_state_sleep.png', 7);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (8, 'keeper_files/thumbnail/badge/profile_badge_state_regular.png', 8);

UPDATE `keeper`.`member_type` SET `badge_thumbnail_id` = 8 WHERE `id` = 2;
UPDATE `keeper`.`member_type` SET `badge_thumbnail_id` = 7 WHERE `id` = 3;
UPDATE `keeper`.`member_type` SET `badge_thumbnail_id` = 5 WHERE `id` = 4;
UPDATE `keeper`.`member_type` SET `badge_thumbnail_id` = 6 WHERE `id` = 5;

UPDATE `keeper`.`member_rank` SET `badge_thumbnail_id` = 4 WHERE `id` = 1;
UPDATE `keeper`.`member_rank` SET `badge_thumbnail_id` = 3 WHERE `id` = 2;

UPDATE `keeper`.`member` SET `thumbnail_id` = 6 WHERE `id` = 1;