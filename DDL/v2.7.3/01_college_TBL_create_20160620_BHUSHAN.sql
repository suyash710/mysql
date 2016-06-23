#Author - Suyash

#Purpose - To have a list of Colleges

#Type - constant	

CREATE TABLE `db`.`college` (

  `name` VARCHAR(20) NOT NULL ,

  `city` VARCHAR(45) NOT NULL ,

  `students` INT NOT NULL ,

  `university` VARCHAR(5) NOT NULL ,

  PRIMARY KEY (`name`, `city`, `students`, `university`) );