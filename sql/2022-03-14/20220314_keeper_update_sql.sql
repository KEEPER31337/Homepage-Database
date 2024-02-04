ALTER TABLE `keeper`.`study` MODIFY COLUMN `thumbnail_id` INT NOT NULL DEFAULT 1;

ALTER TABLE `keeper`.`study`
  ADD COLUMN `head_member_id` INT NULL,
  ADD INDEX `fk_study_member1_idx` (`head_member_id` ASC) VISIBLE,
  ADD CONSTRAINT `fk_study_member1`
    FOREIGN KEY (`head_member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


DELETE FROM `keeper`.`file` WHERE id = 1;
DELETE FROM `keeper`.`file` WHERE id = 2;
DELETE FROM `keeper`.`thumbnail` WHERE id = 1;
DELETE FROM `keeper`.`thumbnail` WHERE id = 2;

INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (1, 'default_thumbnail_rectangle.jpg', 'keeper_files/thumbnail/default/default_thumbnail_rectangle.jpg', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`file` (`id`, `file_name`, `file_path`, `file_size`, `upload_time`, `ip_address`, `posting_id`) VALUES (2, 'default_thumbnail_square.jpg', 'keeper_files/thumbnail/default/default_thumbnail_square.jpg', 33609, DEFAULT, '1.1.1.1', NULL);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (1, 'keeper_files/thumbnail/default/default_thumbnail_rectangle.jpg', 1);
INSERT INTO `keeper`.`thumbnail` (`id`, `path`, `file_id`) VALUES (2, 'keeper_files/thumbnail/default/default_thumbnail_square.jpg', 2);
