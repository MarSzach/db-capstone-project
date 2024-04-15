-- MySQL Workbench Synchronization
-- Generated: 2024-04-15 09:04
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Marcin

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `little_lemon_capstone_project`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`Bookings` 
DROP FOREIGN KEY `fk_Bookings_1`,
DROP FOREIGN KEY `fk_Bookings_2`;

ALTER TABLE `little_lemon_capstone_project`.`Orders` 
DROP FOREIGN KEY `fk_Orders_1`;

ALTER TABLE `little_lemon_capstone_project`.`DeliveryStatus` 
DROP FOREIGN KEY `fk_DeliveryStatus_1`;

ALTER TABLE `little_lemon_capstone_project`.`MenuOrder` 
DROP FOREIGN KEY `fk_MenuOrder_1`,
DROP FOREIGN KEY `fk_MenuOrder_2`;

ALTER TABLE `little_lemon_capstone_project`.`Bookings` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`Orders` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`DeliveryStatus` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`Menus` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
DROP COLUMN `Price`,
DROP COLUMN `MenuItem`,
ADD COLUMN `MenuItemID` INT(11) NULL DEFAULT NULL AFTER `Type`,
ADD INDEX `fk_Menus_1_idx` (`MenuItemID` ASC) VISIBLE;
;

ALTER TABLE `little_lemon_capstone_project`.`Customers` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`Staff` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `little_lemon_capstone_project`.`MenuOrder` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`MenuItems` (
  `MenuItemID` INT(11) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `Category` VARCHAR(45) NULL DEFAULT NULL,
  `Price` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `little_lemon_capstone_project`.`Bookings` 
ADD CONSTRAINT `fk_Bookings_1`
  FOREIGN KEY (`CustomerID`)
  REFERENCES `little_lemon_capstone_project`.`Customers` (`CustomerID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Bookings_2`
  FOREIGN KEY (`EmployeeID`)
  REFERENCES `little_lemon_capstone_project`.`Staff` (`EmployeeID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `little_lemon_capstone_project`.`Orders` 
ADD CONSTRAINT `fk_Orders_1`
  FOREIGN KEY (`BookingID`)
  REFERENCES `little_lemon_capstone_project`.`Bookings` (`BookingID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `little_lemon_capstone_project`.`DeliveryStatus` 
ADD CONSTRAINT `fk_DeliveryStatus_1`
  FOREIGN KEY (`BookingID`)
  REFERENCES `little_lemon_capstone_project`.`Bookings` (`BookingID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `little_lemon_capstone_project`.`Menus` 
ADD CONSTRAINT `fk_Menus_1`
  FOREIGN KEY (`MenuItemID`)
  REFERENCES `little_lemon_capstone_project`.`MenuItems` (`MenuItemID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `little_lemon_capstone_project`.`MenuOrder` 
ADD CONSTRAINT `fk_MenuOrder_1`
  FOREIGN KEY (`OrderID`)
  REFERENCES `little_lemon_capstone_project`.`Orders` (`OrderID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_MenuOrder_2`
  FOREIGN KEY (`MenuID`)
  REFERENCES `little_lemon_capstone_project`.`Menus` (`MenuID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
