ALTER TABLE `keeper`.`game_member_info`
    ADD UNIQUE INDEX `member_is_duplicated` (`member_id` ASC) VISIBLE;