ALTER TABLE `prospective_student` 
CHANGE COLUMN `prospective_studentcol` `phone` VARCHAR(15) NULL DEFAULT NULL ;

ALTER TABLE `prospective_student` 
CHANGE COLUMN `name` `f_name` VARCHAR(50) NOT NULL ,
ADD COLUMN `m_name` VARCHAR(50) NULL DEFAULT NULL AFTER `f_name`,
ADD COLUMN `l_name` VARCHAR(50) NULL DEFAULT NULL AFTER `m_name`;
