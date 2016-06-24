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
