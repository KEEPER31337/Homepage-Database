
USE `keeper`;

ALTER TABLE `keeper`.`posting`
  DROP COLUMN `like_count`;

ALTER TABLE `keeper`.`posting`
  DROP COLUMN `dislike_count`;

ALTER TABLE `keeper`.`comment`
  DROP COLUMN `like_count`;

ALTER TABLE `keeper`.`comment`
  DROP COLUMN `dislike_count`;

INSERT INTO `keeper`.`book_borrow_status` (`id`, `status`) VALUES (DEFAULT, '반납');
