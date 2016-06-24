use collpoll;
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

