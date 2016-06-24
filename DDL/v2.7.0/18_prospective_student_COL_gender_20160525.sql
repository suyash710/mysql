#Sid

ALTER TABLE `prospective_student` 
CHANGE COLUMN `gender` `gender` ENUM('male', 'female', 'other') NOT NULL COMMENT '' ;