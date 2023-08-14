use keeper;

-- -----------------------------------------------------
-- Table `keeper`.`book_borrow_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book_borrow_info` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book_borrow_info` (
  `id` INT UNIQUE NOT NULL AUTO_INCREMENT,
  `member_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  `borrow_date` DATE NOT NULL DEFAULT (CURRENT_DATE),
  `expire_date` DATE NOT NULL,
  `register_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `update_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME),
  `last_request_date` DATE NULL DEFAULT (CURRENT_DATE),
  PRIMARY KEY (`id`),
  INDEX `fk_book_borrow_info_book1_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_book_borrow_info_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_book_borrow_info_book_borrow_status1_idx` (`status_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_borrow_info_book1`
    FOREIGN KEY (`book_id`)
    REFERENCES `keeper`.`book` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_borrow_info_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `keeper`.`member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_book_borrow_info_book_borrow_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `keeper`.`book_borrow_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `keeper`.`book_borrow_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`book_borrow_log` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book_borrow_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `borrow_date` DATE NULL,
  `expire_date` DATE NULL,
  `return_date` DATE NULL,
  `reject_date` DATE NULL,
  `book_title` VARCHAR(250) NOT NULL,
  `book_author` VARCHAR(40) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `member_id` INT NOT NULL,
  `member_nickname` VARCHAR(40) NOT NULL,
  `member_realname` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `keeper`.`category`
-- -----------------------------------------------------
INSERT INTO `keeper`.`category` (`id`, `name`) VALUES (202, '발표자료');
INSERT INTO `keeper`.`category` (`id`, `name`) VALUES (203, '기술문서');
INSERT INTO `keeper`.`category` (`id`, `name`) VALUES (204, '회계부');

DELIMITER $$

USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`book_borrow_info_BEFORE_INSERT` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`book_borrow_info_BEFORE_INSERT` BEFORE INSERT ON `book_borrow_info` FOR EACH ROW
BEGIN
	IF NEW.expire_date IS NULL THEN
		SET NEW.expire_date = DATE_ADD(NEW.borrow_date, INTERVAL 14 DAY);
	END IF;
END$$


USE `keeper`$$
DROP TRIGGER IF EXISTS `keeper`.`book_borrow_info_BEFORE_UPDATE` $$
USE `keeper`$$
CREATE DEFINER = CURRENT_USER TRIGGER `keeper`.`book_borrow_info_BEFORE_UPDATE` BEFORE UPDATE ON `book_borrow_info` FOR EACH ROW
BEGIN
	SET NEW.update_time = CURRENT_TIME;
END$$

DELIMITER ;