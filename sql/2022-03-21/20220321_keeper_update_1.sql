INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (9, 'default_thumbnail_intro.png', 'keeper_files/thumbnail/default/default_thumbnail_intro.png', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (10, 'default_thumbnail_book.png', 'keeper_files/thumbnail/default/default_thumbnail_book.png', 33609, DEFAULT, '1.1.1.1', NULL);

INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (11, 'profile_role_chairman.gif', 'keeper_files/thumbnail/badge/profile_role_chairman.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (12, 'profile_role_vice_chairman.gif', 'keeper_files/thumbnail/badge/profile_role_vice_chairman.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (13, 'profile_role_external_manager.gif', 'keeper_files/thumbnail/badge/profile_role_external_manager.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (14, 'profile_role_study_manager.gif', 'keeper_files/thumbnail/badge/profile_role_study_manager.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (15, 'profile_role_it_manager.gif', 'keeper_files/thumbnail/badge/profile_role_it_manager.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (16, 'profile_role_clerk.gif', 'keeper_files/thumbnail/badge/profile_role_clerk.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (17, 'profile_role_general_affairs.gif', 'keeper_files/thumbnail/badge/profile_role_general_affairs.gif', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (18, 'profile_role_librarian.gif', 'keeper_files/thumbnail/badge/profile_role_librarian.gif', 33609, DEFAULT, '1.1.1.1', NULL);

UPDATE `file` SET `file_name` = 'profile_badge_state_graduate.gif', `file_path` = 'keeper_files/thumbnail/badge/profile_badge_state_graduate.gif' WHERE id = 5;
UPDATE `file` SET `file_name` = 'profile_badge_state_sleep.gif', `file_path` = 'keeper_files/thumbnail/badge/profile_badge_state_sleep.gif' WHERE id = 7;
UPDATE `file` SET `file_name` = 'profile_badge_state_regular.gif', `file_path` = 'keeper_files/thumbnail/badge/profile_badge_state_regular.gif' WHERE id = 8;

/* UPDATE dummpy rows */
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/default_thumbnail_intro.png', `file_id` = 9 WHERE id = 9;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/default_thumbnail_book.png', `file_id` = 10 WHERE id = 10;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_chairman.gif', `file_id` = 11 WHERE id = 11;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_vice_chairman.gif', `file_id` = 12 WHERE id = 12;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_external_manager.gif', `file_id` = 13 WHERE id = 13;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_study_manager.gif', `file_id` = 14 WHERE id = 14;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_it_manager.gif', `file_id` = 15 WHERE id = 15;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_clerk.gif', `file_id` = 16 WHERE id = 16;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_general_affairs.gif', `file_id` = 17 WHERE id = 17;
UPDATE `thumbnail` SET `path` = 'keeper_files/thumbnail/badge/profile_role_librarian.gif', `file_id` = 18 WHERE id = 18;
