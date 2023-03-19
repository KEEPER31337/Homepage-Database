USE `keeper`;

ALTER TABLE
    `keeper`.`posting` DROP COLUMN `comment_count`;

ALTER TABLE
    `keeper`.`book` DROP COLUMN `current_quantity`;