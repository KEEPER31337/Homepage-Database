SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP TABLE IF EXISTS `keeper`.`book_borrow_status` ;

CREATE TABLE IF NOT EXISTS `keeper`.`book_borrow_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

ALTER TABLE `keeper`.`book`
  DROP COLUMN `information`;

ALTER TABLE `keeper`.`book_borrow_info`
  ADD COLUMN `status_id` INT NOT NULL,
  ADD INDEX `fk_book_borrow_info_book_borrow_status1_idx` (`status_id` ASC) VISIBLE,
  ADD CONSTRAINT `fk_book_borrow_info_book_borrow_status1`
    FOREIGN KEY (`status_id`)
    REFERENCES `keeper`.`book_borrow_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`book_borrow_status` (`id`, `status`) VALUES (DEFAULT, '대출 대기 중');
INSERT INTO `keeper`.`book_borrow_status` (`id`, `status`) VALUES (DEFAULT, '대출 거부');
INSERT INTO `keeper`.`book_borrow_status` (`id`, `status`) VALUES (DEFAULT, '대출 승인');
INSERT INTO `keeper`.`book_borrow_status` (`id`, `status`) VALUES (DEFAULT, '반납 대기 중');

COMMIT;

SET SQL_MODE=@OLD_SQL_MODE;
