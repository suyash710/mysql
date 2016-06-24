use collpoll;

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
    REFERENCES `collpoll`.`authenticator` (`ukid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
