USE `keeper`;

-- -----------------------------------------------------
-- Table `keeper`.`posting_has_file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `keeper`.`posting_has_file` (
    `posting_id` INT NOT NULL,
    `file_id` INT NOT NULL,
    PRIMARY KEY (`posting_id`, `file_id`),
    INDEX `fk_posting_has_file_file1_idx` (`file_id` ASC) VISIBLE,
    INDEX `fk_posting_has_file_posting1_idx` (`posting_id` ASC) VISIBLE,
    CONSTRAINT `fk_posting_has_file_posting1` FOREIGN KEY (`posting_id`) REFERENCES `keeper`.`posting` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_posting_has_file_file1` FOREIGN KEY (`file_id`) REFERENCES `keeper`.`file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `keeper`.`ctf_challenge_has_file`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `keeper`.`ctf_challenge_has_file`;

CREATE TABLE IF NOT EXISTS `keeper`.`ctf_challenge_has_file` (
    `ctf_challenge_id` INT NOT NULL,
    `file_id` INT NOT NULL,
    PRIMARY KEY (`ctf_challenge_id`, `file_id`),
    INDEX `fk_ctf_challenge_has_file_file1_idx` (`file_id` ASC) VISIBLE,
    INDEX `fk_ctf_challenge_has_file_ctf_challenge1_idx` (`ctf_challenge_id` ASC) VISIBLE,
    CONSTRAINT `fk_ctf_challenge_has_file_ctf_challenge1` FOREIGN KEY (`ctf_challenge_id`) REFERENCES `keeper`.`ctf_challenge` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_ctf_challenge_has_file_file1` FOREIGN KEY (`file_id`) REFERENCES `keeper`.`file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- Move data to new tables.
INSERT INTO
    `posting_has_file` (
        SELECT
            `posting_id`,
            `id` as file_id
        FROM
            `file`
        WHERE
            `posting_id` IS NOT NULL
    );

INSERT INTO
    `ctf_challenge_has_file` (
        SELECT
            `id` as ctf_challenge_id,
            `file_id`
        FROM
            `ctf_challenge`
        WHERE
            `file_id` IS NOT NULL
    );

-- Remove foreign key constraints and columns.
ALTER TABLE
    file DROP FOREIGN KEY `fk_file_posting1`,
    DROP COLUMN `posting_id`;

ALTER TABLE
    ctf_challenge DROP FOREIGN KEY `fk_ctf_challenge_file1`,
    DROP COLUMN `file_id`;