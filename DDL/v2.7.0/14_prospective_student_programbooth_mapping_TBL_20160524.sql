CREATE TABLE `prospective_student_programbooth_mapping` (
  `id` INT(10) UNSIGNED NOT NULL,
  `program_id` INT(10) UNSIGNED NOT NULL,
  `booth_id` INT(10) UNSIGNED NOT NULL,
  `created_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updation_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreingK_program_id_idx` (`program_id` ASC),
  INDEX `foreignK_booth_id_idx` (`booth_id` ASC),
  CONSTRAINT `foreingK_program_id`
    FOREIGN KEY (`program_id`)
    REFERENCES `programme` (`programme_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `foreignK_booth_id`
    FOREIGN KEY (`booth_id`)
    REFERENCES `booth` (`booth_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

ALTER TABLE `prospective_student_programbooth_mapping` 
CHANGE COLUMN `id` `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ;

