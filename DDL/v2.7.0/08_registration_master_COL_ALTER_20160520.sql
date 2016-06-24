ALTER TABLE `registration_master` 
DROP FOREIGN KEY `fk_registration_master_department`;
ALTER TABLE `registration_master` 
CHANGE COLUMN `department_id` `department_id` INT(10) UNSIGNED NULL COMMENT '' ;
ALTER TABLE `registration_master` 
ADD CONSTRAINT `fk_registration_master_department`
  FOREIGN KEY (`department_id`)
  REFERENCES `department` (`department_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
ALTER TABLE `registration_master` 
CHANGE COLUMN `user_type` `user_type` VARCHAR(25) NOT NULL COMMENT '' ;
