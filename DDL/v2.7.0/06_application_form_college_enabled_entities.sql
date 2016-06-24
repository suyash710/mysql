CREATE TABLE `application_form_college_enabled_entities` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `college` INT(10) UNSIGNED NOT NULL,
  `admission_form_entity` INT(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreign_collegeId_idx` (`college` ASC),
  INDEX `foreign_admission_form_id_idx` (`admission_form_entity` ASC),
  CONSTRAINT `foreign_collegeId`
    FOREIGN KEY (`college`)
    REFERENCES `college` (`college_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `foreign_admission_form_id`
    FOREIGN KEY (`admission_form_entity`)
    REFERENCES `admission_form_entities` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
