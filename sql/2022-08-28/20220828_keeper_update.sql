
START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`seminar_attendance_status` (`id`, `type`) VALUES (DEFAULT, '출석 전');

COMMIT;