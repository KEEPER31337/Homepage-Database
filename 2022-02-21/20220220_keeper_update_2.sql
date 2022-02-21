ALTER TABLE `keeper`.`game_member_info`
    ADD COLUMN `dice_day_point` INT NOT NULL DEFAULT 0;

ALTER TABLE `keeper`.`game_member_info`
    ADD COLUMN `roulette_day_point` INT NOT NULL DEFAULT 0;

ALTER TABLE `keeper`.`game_member_info`
    ADD COLUMN `lotto_day_point` INT NOT NULL DEFAULT 0;

ALTER TABLE `keeper`.`attendance`
    ADD COLUMN `date` DATE NOT NULL DEFAULT (CURRENT_DATE);

ALTER TABLE `keeper`.`attendance`
    ADD UNIQUE INDEX `is_duplicated` (`member_id` ASC, `date` ASC) VISIBLE;