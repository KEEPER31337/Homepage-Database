ALTER TABLE `keeper`.`comment`
    MODIFY COLUMN `content` TEXT NOT NULL;

ALTER TABLE `keeper`.`member`
    MODIFY COLUMN `student_id` VARCHAR(45) NULL;

INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`)
    VALUES (1, 'virtual_category', NULL, NULL);
INSERT INTO `keeper`.`posting` (`id`, `title`, `content`, `member_id`, `visit_count`, `like_count`, `dislike_count`, `comment_count`, `register_time`, `update_time`, `ip_address`, `allow_comment`, `is_notice`, `is_secret`, `is_temp`, `password`, `category_id`, `thumbnail_id`)
    VALUES (1, 'virtual_posting', 'virtual_posting_content', 1, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, '0.0.0.0', DEFAULT, DEFAULT, DEFAULT, DEFAULT, NULL, 1, NULL);

INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (219, 'KEEPER', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (29422, '동아리 소개', 219, 'about');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (8, '이벤트', 219, 'event');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (9, '동아리 일정', 219, 'schedule');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (2, '게시판', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (105, '공지사항', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (6105, '건의사항', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (116, '자유게시판', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (147718, '연재글', 2, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (3, '동아리활동', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (117, '발표자료', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (105900, '스터디', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (2996, '기술문서', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (23400, '회계부', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (34608, 'KUCIS', 3, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (5125, '정보', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (508, '해킹대회정보', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (648, '유용한사이트', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (647, 'Tools', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (662, '외부문서&강의', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (81570, '취업&면접', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (1377, '시험', 5125, 'board');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (5, '서비스', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (106402, '도서 신청', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (27, '기자재 신청', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (60024, '도서 대여', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (84493, '기자재 대여', 5, 'library');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (6, '포인트', NULL, NULL);
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (30052, '랭킹', 6, 'attendance');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (33777, '출석부', 6, 'attendance');
INSERT INTO `keeper`.`category` (`id`, `name`, `parent_id`, `href`) VALUES (11302, '게임', 6, 'game');