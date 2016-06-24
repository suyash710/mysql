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
