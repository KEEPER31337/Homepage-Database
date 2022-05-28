ALTER TABLE ctf_team ADD UNIQUE INDEX `is_duplicated` (`name` ASC, `contest_id` ASC) VISIBLE;

ALTER TABLE ctf_submit_log ADD COLUMN (
  `team_name` VARCHAR(45) NOT NULL DEFAULT 'DEFAULT_TEAM_NAME',
  `submitter_login_id` VARCHAR(80) NOT NULL DEFAULT 'DEFAULT_SUBMITTER_LOGIN_ID',
  `submitter_realname` VARCHAR(45) NOT NULL DEFAULT 'DEFAULT_SUBMITTER_REALNAME',
  `challenge_name` VARCHAR(200) NOT NULL DEFAULT 'DEFAULT_CHALLENGE_NAME',
  `contest_name` VARCHAR(45) NOT NULL DEFAULT 'DEFAULT_CONTEST_NAME');

ALTER TABLE ctf_submit_log
  DROP CONSTRAINT `fk_ctf_submit_log_ctf_challenge1`,
  DROP CONSTRAINT `fk_ctf_submit_log_ctf_team1`,
  DROP CONSTRAINT `fk_ctf_submit_log_member1`;

ALTER TABLE ctf_submit_log
  DROP KEY `fk_ctf_submit_log_ctf_team1_idx`,
  DROP KEY `fk_ctf_submit_log_member1_idx`,
  DROP KEY `fk_ctf_submit_log_ctf_challenge1_idx`;

ALTER TABLE ctf_submit_log
  DROP COLUMN team_id,
  DROP COLUMN submitter,
  DROP COLUMN challenge_id;

UPDATE `keeper`.`ctf_submit_log` SET 
  `team_name`='virtual_ctf_submit_log_team_name',
  `submitter_login_id`='virtual_ctf_submit_log_submitter_login_id',
  `submitter_realname`='virtual_ctf_submit_log_submitter_realname',
  `challenge_name`='virtual_ctf_submit_log_challenge_name',
  `contest_name`='virtual_ctf_submit_log_contest_name'
  WHERE id = 1;
