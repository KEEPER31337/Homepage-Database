SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

USE `keeper`;

ALTER TABLE `keeper`.`ctf_team` ADD COLUMN `last_solve_time` DATETIME NOT NULL DEFAULT (CURRENT_TIME);

UPDATE ctf_team AS t, (SELECT id, register_time FROM ctf_contest) AS c
    SET t.last_solve_time = c.register_time WHERE t.contest_id = c.id;

UPDATE ctf_team AS t, 
    (SELECT team_name, MAX(submit_time) AS last_solve_time 
        FROM ctf_submit_log WHERE is_correct GROUP BY team_name) AS r
    SET t.last_solve_time = r.last_solve_time WHERE t.name = r.team_name;

SET SQL_MODE=@OLD_SQL_MODE;
