#Author - Suyash

#Purpose - To have a list of Colleges

#Type - variable	

UPDATE TABLE `db`.`school` (

  `name` VARCHAR(20) NOT NULL ,

  `city` VARCHAR(45) NOT NULL ,

  `students` INT NOT NULL ,

  `university` VARCHAR(5) NOT NULL ,

  PRIMARY KEY (`name`, `city`, `students`, `university`) );