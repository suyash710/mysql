CREATE  TABLE `db`.`city` (

  `name` VARCHAR(20) NOT NULL ,

  `pin` INT NOT NULL ,

  `std code` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`name`, `std code`, `pin`) ,

  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,

  UNIQUE INDEX `pin_UNIQUE` (`pin` ASC) );