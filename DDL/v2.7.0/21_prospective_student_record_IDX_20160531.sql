#author - Sid
ALTER TABLE `prospective_student_record` 
DROP FOREIGN KEY `foreignK_userId`;
ALTER TABLE `prospective_student_record` 
ADD CONSTRAINT `foreignK_userId`
  FOREIGN KEY (`ukid`)
  REFERENCES `authenticator` (`ukid`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
