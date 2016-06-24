CREATE TABLE `prospective_student` (
  `ukid` INT(10) UNSIGNED NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `year_of_joining` SMALLINT(5) NOT NULL,
  `gender` VARCHAR(5) NOT NULL,
  `college_id` INT(10) UNSIGNED NOT NULL,
  `prospective_studentcol` VARCHAR(15) NULL DEFAULT NULL,
  `facebook` VARCHAR(50) NULL DEFAULT NULL,
  `twitter` VARCHAR(50) NULL DEFAULT NULL,
  `hometown` VARCHAR(50) NULL DEFAULT NULL,
  `bio` VARCHAR(100) NULL DEFAULT NULL,
  `registration_id` VARCHAR(15) NULL DEFAULT NULL,
  `date_of_birth` DATE NULL DEFAULT NULL,
  `looking_for` VARCHAR(300) NULL DEFAULT NULL,
  `headline` VARCHAR(140) NULL DEFAULT NULL,
  INDEX `foreignK_college_id_idx` (`college_id` ASC),
  INDEX `foreignK_prosp_user_id_idx` (`ukid` ASC),
  CONSTRAINT `foreignK_college_id`
    FOREIGN KEY (`college_id`)
    REFERENCES `college` (`college_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `foreignK_prosp_user_id`
    FOREIGN KEY (`ukid`)
    REFERENCES `authenticator` (`ukid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
