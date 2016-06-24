#bhushan

ALTER TABLE `counseling_booth_programme` 
DROP FOREIGN KEY `foreingK_program_id`;
ALTER TABLE `counseling_booth_programme` 
CHANGE COLUMN `program_id` `programme_id` INT(10) UNSIGNED NOT NULL ;
ALTER TABLE `counseling_booth_programme` 
ADD CONSTRAINT `foreingK_program_id`
  FOREIGN KEY (`programme_id`)
  REFERENCES `programme` (`programme_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
