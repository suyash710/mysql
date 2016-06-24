#Author - Suyash

#Purpose - To have a list of Countries

UPDATE  TABLE `country` (

  `name` VARCHAR(40) NOT NULL ,

  `population` INT NOT NULL ,

  `capital` VARCHAR(45) NOT NULL ,

  PRIMARY KEY (`name`, `population`, `capital`) ,

  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,

  UNIQUE INDEX `capital_UNIQUE` (`capital` ASC) )

COMMENT = 'Country database _ TBL';