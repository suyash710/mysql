#Sid
ALTER TABLE `prospective_student_programme` 
DROP FOREIGN KEY `foreignKey_user_id`;
ALTER TABLE `prospective_student_programme` 
CHANGE COLUMN `user_id` `ukid` INT(10) UNSIGNED NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE `prospective_student_programme` 
ADD CONSTRAINT `foreignKey_user_id`
  FOREIGN KEY (`ukid`)
  REFERENCES `authenticator` (`ukid`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
