SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `keeper`;

ALTER TABLE `keeper`.`ctf_challenge` ADD COLUMN `max_submit_count` INT NOT NULL DEFAULT 1;

ALTER TABLE `keeper`.`ctf_flag` ADD COLUMN `last_try_time` DATETIME NULL;
ALTER TABLE `keeper`.`ctf_flag` ADD COLUMN `remained_submit_count` INT NOT NULL DEFAULT 1;

UPDATE ctf_flag AS f,
    (SELECT c.id AS cid, t.id AS tid, l.st AS lst
        FROM (SELECT MAX(submit_time) AS st, team_name, challenge_name
            FROM ctf_submit_log
            GROUP BY team_name, challenge_name) AS l
        JOIN ctf_challenge AS c ON l.challenge_name = c.name
        JOIN ctf_team AS t ON l.team_name = t.name) AS li
    SET f.last_try_time = li.lst
    WHERE f.team_id = li.tid AND f.challenge_id = li.cid;

SET SQL_MODE=@OLD_SQL_MODE;
