CREATE TABLE `prospective_student_programme` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT(10) UNSIGNED NULL,
  `programme_id` INT(10) UNSIGNED NULL,
  `created_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `foreignKey_user_id_idx` (`user_id` ASC),
  INDEX `foreign_Key_progg_id_idx` (`programme_id` ASC),
  CONSTRAINT `foreignKey_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `authenticator` (`ukid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `foreign_Key_progg_id`
    FOREIGN KEY (`programme_id`)
    REFERENCES `programme` (`programme_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);