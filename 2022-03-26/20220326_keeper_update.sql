UPDATE thumbnail SET path = "keeper_files/thumbnail/default/default_thumbnail_intro.png" WHERE id = 9;
UPDATE thumbnail SET path = "keeper_files/thumbnail/default/default_thumbnail_book.png" WHERE id = 10;

UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_state_graduate.gif" WHERE id = 5;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_state_sleep.gif" WHERE id = 7;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_state_regular.gif" WHERE id = 8;

UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_chairman.gif" WHERE id = 11;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_vice_chairman.gif" WHERE id = 12;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_external_manager.gif" WHERE id = 13;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_study_manager.gif" WHERE id = 14;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_it_manager.gif" WHERE id = 15;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_clerk.gif" WHERE id = 16;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_general_affairs.gif" WHERE id = 17;
UPDATE thumbnail SET path = "keeper_files/thumbnail/badge/profile_badge_role_librarian.gif" WHERE id = 18;

UPDATE file SET file_name = "profile_badge_role_chairman.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_chairman.gif" WHERE id = 11;
UPDATE file SET file_name = "profile_badge_role_vice_chairman.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_vice_chairman.gif" WHERE id = 12;
UPDATE file SET file_name = "profile_badge_role_external_manager.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_external_manager.gif" WHERE id = 13;
UPDATE file SET file_name = "profile_badge_role_study_manager.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_study_manager.gif" WHERE id = 14;
UPDATE file SET file_name = "profile_badge_role_it_manager.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_it_manager.gif" WHERE id = 15;
UPDATE file SET file_name = "profile_badge_role_clerk.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_clerk.gif" WHERE id = 16;
UPDATE file SET file_name = "profile_badge_role_general_affairs.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_general_affairs.gif" WHERE id = 17;
UPDATE file SET file_name = "profile_badge_role_librarian.gif", file_path = "keeper_files/thumbnail/badge/profile_badge_role_librarian.gif" WHERE id = 18;

INSERT INTO category(id,name) VALUE(10,"오류제보");

/* Release server only */
UPDATE posting SET is_notice = 0 WHERE category_id = 5424 AND is_notice = 1 AND id <> 38846;
UPDATE comment SET content = REGEXP_REPLACE(content, '<[^>]+>', '');