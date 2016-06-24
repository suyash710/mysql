#Author - Suyash

#Purpose - To have a list of classes

#Type - master

CREATE  TABLE `Class` (

  `name` VARCHAR(25) NOT NULL ,

  `strength` INT NOT NULL ,

  `average` INT NOT NULL ,

  PRIMARY KEY (`name`, `strength`, `average`) );