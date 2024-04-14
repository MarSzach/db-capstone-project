-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_capstone_project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_capstone_project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_capstone_project` ;
USE `little_lemon_capstone_project` ;

-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Customers` (
  `CustomerID` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerLastName` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Staff` (
  `EmployeeID` INT NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(10,2) NOT NULL,
  `EmployeeName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Bookings` (
  `BookingID` INT NOT NULL,
  `TableNumber` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `CustomerID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Bookings_1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_2_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_capstone_project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_capstone_project`.`Staff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NOT NULL,
  `BookingID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_1_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_capstone_project`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`DeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`DeliveryStatus` (
  `DeliveryStatusID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(15) NOT NULL,
  `BookingID` INT NOT NULL,
  PRIMARY KEY (`DeliveryStatusID`),
  INDEX `fk_DeliveryStatus_1_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryStatus_1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_capstone_project`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuItem` VARCHAR(100) NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Price` DECIMAL(10,2) NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`MenuOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`MenuOrder` (
  `MenuID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  INDEX `fk_MenuOrder_1_idx` (`OrderID` ASC) VISIBLE,
  INDEX `fk_MenuOrder_2_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuOrder_1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `little_lemon_capstone_project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuOrder_2`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon_capstone_project`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
