CREATE TABLE `admission_form_entities` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `field_name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `default_values` VARCHAR(100) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`));


