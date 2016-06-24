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
ALTER TABLE `prospective_student` 
CHANGE COLUMN `prospective_studentcol` `phone` VARCHAR(15) NULL DEFAULT NULL ;

ALTER TABLE `prospective_student` 
CHANGE COLUMN `name` `f_name` VARCHAR(50) NOT NULL ,
ADD COLUMN `m_name` VARCHAR(50) NULL DEFAULT NULL AFTER `f_name`,
ADD COLUMN `l_name` VARCHAR(50) NULL DEFAULT NULL AFTER `m_name`;
CREATE TABLE `admission_form_entities` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `field_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `default_values` VARCHAR(100) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `prospective_student_information` (
  `id` INT(11) UNSIGNED NOT NULL,
  `ukid` INT(10) UNSIGNED NULL,
  `f_name` VARCHAR(50) NOT NULL,
  `m_name` VARCHAR(50) NULL DEFAULT NULL,
  `l_name` VARCHAR(50) NULL DEFAULT NULL,
  `year_of_passing_12th` SMALLINT(4) NOT NULL,
  `percentage_12th` FLOAT NOT NULL,
  `board_or_university` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreignKey_userId_idx` (`ukid` ASC),
  CONSTRAINT `foreignKey_userId`
    FOREIGN KEY (`ukid`)
    REFERENCES `authenticator` (`ukid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE `college_entity` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `college_id` INT(10) NOT NULL,
  `admission_form_entity_id` INT(10) NOT NULL,
  PRIMARY KEY (`id`));
  
ALTER TABLE `college_entity` 
CHANGE COLUMN `id` `id` INT(10) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `college_id` `collegeId` INT(10) UNSIGNED NOT NULL ;


ALTER TABLE `college_entity` 
ADD CONSTRAINT `foreignKey_college_id`
  FOREIGN KEY (`collegeId`)
  REFERENCES `college` (`college_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `foreignKey_admission_form_id`
  FOREIGN KEY (`admission_form_entity_id`)
  REFERENCES `admission_form_entities` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `college_entity` 
DROP FOREIGN KEY `foreignKey_college_id`,
DROP FOREIGN KEY `foreignKey_admission_form_id`;
ALTER TABLE `college_entity` 
ADD CONSTRAINT `foreignKey_college_id`
  FOREIGN KEY (`collegeId`)
  REFERENCES `college` (`college_id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `foreignKey_admission_form_id`
  FOREIGN KEY (`admission_form_entity_id`)
  REFERENCES `admission_form_entities` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

CREATE TABLE `prospective_student_record` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `ukid` INT(10) UNSIGNED NOT NULL,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `foreignK_userId_idx` (`ukid` ASC),
  CONSTRAINT `foreignK_userId`
    FOREIGN KEY (`ukid`)
    REFERENCES `authenticator` (`ukid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
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
DROP TABLE IF EXISTS `prospective_student_information`;ALTER TABLE `registration_master` 
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
ALTER TABLE `user_attributes` 
CHANGE COLUMN `user_type` `user_type` VARCHAR(25) NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE `prospective_student_record` 
ADD COLUMN `admission_form_entity` INT(10) NOT NULL AFTER `value`;




ALTER TABLE `prospective_student_record` 
ADD INDEX `foreignK_admissionFormId_idx` (`admission_form_entity` ASC);
ALTER TABLE `prospective_student_record` 
ADD CONSTRAINT `foreignK_admissionFormId`
  FOREIGN KEY (`admission_form_entity`)
  REFERENCES `admission_form_entities` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
ALTER TABLE `prospective_student` 
ADD COLUMN `linkedin` VARCHAR(255) NULL COMMENT '' AFTER `twitter`;
ALTER TABLE `college_drive_data` 
CHANGE COLUMN `user_type` `user_type` VARCHAR(25) NOT NULL COMMENT '' ;
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
    ON UPDATE CASCADE);#Bhushan

ALTER TABLE `prospective_student_programbooth_mapping` 
RENAME TO  `counseling_booth_programme` ;
#Bhushan

ALTER TABLE `application_form_college_enabled_entities` 
RENAME TO  `admission_form_college_enabled_entities` ;
#Sid

ALTER TABLE `prospective_student` 
CHANGE COLUMN `gender` `gender` ENUM('male', 'female', 'other') NOT NULL COMMENT '' ;#bhushan

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
#@author:bhushan

drop view `users_profile_view`;
CREATE 
    ALGORITHM = UNDEFINED 
    SQL SECURITY DEFINER
VIEW `users_profile_view` AS
    SELECT 
        `admin_profile`.`ukid` AS `ukid`,
        'admin' AS `position`,
        `admin_profile`.`salutation` AS `salutation`,
        `admin_profile`.`f_name` AS `f_name`,
        `admin_profile`.`m_name` AS `m_name`,
        `admin_profile`.`l_name` AS `l_name`,
        `admin_profile`.`department_id` AS `department_id`,
        `admin_profile`.`gender` AS `gender`,
        `admin_profile`.`college_id` AS `college_id`,
        `admin_profile`.`designation_id` AS `designation_id`,
        NULL AS `programme_id`,
        NULL AS `programme_name`,
        NULL AS `year_of_joining`,
        NULL AS `year`,
        NULL AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        `designation`.`name` AS `designation_name`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `admin_profile`.`bio` AS `bio`,
        NULL AS `sequence_id`,
        `media_object`.`media_location` AS `photo`
    FROM
        (((((`admin_profile`
        LEFT JOIN `user_attributes` ON ((`admin_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`admin_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `designation` ON ((`admin_profile`.`designation_id` = `designation`.`id`)))
        LEFT JOIN `college` ON ((`admin_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`))) 
    UNION SELECT 
        `student_profile`.`ukid` AS `ukid`,
        'student' AS `student`,
        NULL AS `salutation`,
        `student_profile`.`f_name` AS `f_name`,
        `student_profile`.`m_name` AS `m_name`,
        `student_profile`.`l_name` AS `l_name`,
        `student_profile`.`department_id` AS `department_id`,
        `student_profile`.`gender` AS `gender`,
        `student_profile`.`college_id` AS `college_id`,
        NULL AS `designation_id`,
        `student_profile`.`programme_id` AS `programme_id`,
        `programme`.`programme_name` AS `programme_name`,
        `student_profile`.`year_of_joining` AS `year_of_joining`,
        `student_profile`.`year` AS `year`,
        `student_profile`.`section_id` AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        NULL AS `designation_name`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `student_profile`.`bio` AS `bio`,
        `student_profile`.`sequence_id` AS `sequence_id`,
        `media_object`.`media_location` AS `media_location`
    FROM
        (((((`student_profile`
        LEFT JOIN `user_attributes` ON ((`student_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`student_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `college` ON ((`student_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
        LEFT JOIN `programme` ON ((`programme`.`programme_id` = `student_profile`.`programme_id`))) 
    UNION SELECT 
        `prospective_student`.`ukid` AS `ukid`,
        'prospective_student' AS `prospective_student`,
        NULL AS `NULL`,
        `prospective_student`.`f_name` AS `f_name`,
        `prospective_student`.`m_name` AS `m_name`,
        `prospective_student`.`l_name` AS `l_name`,
        NULL AS `department_id`,
        `prospective_student`.`gender` AS `gender`,
        `prospective_student`.`college_id` AS `college_id`,
        NULL AS `designation_id`,
        `prospective_student_programme`.`programme_id` AS `programme_id`,
        `programme`.`programme_name` AS `programme_name`,
        `prospective_student`.`year_of_joining` AS `year_of_joining`,
        NULL AS `year`,
        NULL AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        NULL AS `department_name`,
        NULL AS `designation_name`,
        NULL AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `prospective_student`.`registration_id` AS `registration_id`,
        `prospective_student`.`bio` AS `bio`,
        NULL AS `sequence_id`,
        `media_object`.`media_location` AS `media_location`
    FROM
        ((((`prospective_student`
        LEFT JOIN `user_attributes` ON ((`prospective_student`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `prospective_student_programme` ON ((`prospective_student_programme`.`ukid` = `prospective_student`.`ukid`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
        LEFT JOIN `programme` ON ((`programme`.`programme_id` = `prospective_student_programme`.`programme_id`))) 
    UNION SELECT 
        `faculty_profile`.`ukid` AS `ukid`,
        'faculty' AS `faculty`,
        `faculty_profile`.`salutation` AS `salutation`,
        `faculty_profile`.`f_name` AS `f_name`,
        `faculty_profile`.`m_name` AS `m_name`,
        `faculty_profile`.`l_name` AS `l_name`,
        `faculty_profile`.`department_id` AS `department_id`,
        `faculty_profile`.`gender` AS `gender`,
        `faculty_profile`.`college_id` AS `college_id`,
        `faculty_profile`.`designation_id` AS `designation_id`,
        NULL AS `prorgramme_id`,
        NULL AS `programme_name`,
        NULL AS `year_of_joining`,
        NULL AS `year`,
        NULL AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        `designation`.`name` AS `name`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `faculty_profile`.`bio` AS `bio`,
        NULL AS `NULL`,
        `media_object`.`media_location` AS `media_location`
    FROM
        (((((`faculty_profile`
        LEFT JOIN `user_attributes` ON ((`faculty_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`faculty_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `designation` ON ((`faculty_profile`.`designation_id` = `designation`.`id`)))
        LEFT JOIN `college` ON ((`faculty_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
    ORDER BY `ukId`;
#Sid 

#Creates unique index for users and groups

DELETE n1 FROM user_group_members n1, user_group_members n2 WHERE n1.id > n2.id AND n1.ukid = n2.ukid and n1.group_id = n2.group_id;

ALTER TABLE `user_group_members` 
ADD UNIQUE INDEX `unique_user_group` (`group_id` ASC, `ukid` ASC);