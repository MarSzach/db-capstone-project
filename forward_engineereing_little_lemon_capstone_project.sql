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
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
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
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Role` VARCHAR(45) NOT NULL,
  `AnnualSalary` DECIMAL(10,2) NOT NULL,
  `EmployeeName` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Tables`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Tables` (
  `TableID` INT NOT NULL AUTO_INCREMENT,
  `NumberOfPersons` INT NOT NULL,
  `Location` VARCHAR(45) NULL,
  PRIMARY KEY (`TableID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNumber` INT NOT NULL,
  `BookingReceivedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `BookingDate` DATETIME NOT NULL,
  `CustomerID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  UNIQUE INDEX `BookingID_UNIQUE` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Bookings_1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_2_idx` (`EmployeeID` ASC) VISIBLE,
  INDEX `fk_Bookings_3_idx` (`TableNumber` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_capstone_project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_2`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_capstone_project`.`Staff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_3`
    FOREIGN KEY (`TableNumber`)
    REFERENCES `little_lemon_capstone_project`.`Tables` (`TableID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`OrderType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`OrderType` (
  `OrderTypeID` INT NOT NULL AUTO_INCREMENT,
  `OrderType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`OrderTypeID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,2) NULL,
  `BookingID` INT NULL,
  `OrderTypeID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `TableNumber` INT NULL,
  `IsDeleted` TINYINT NOT NULL DEFAULT 0,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `fk_Orders_3_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_4_idx` (`TableNumber` ASC) VISIBLE,
  INDEX `fk_Orders_1_idx` (`OrderTypeID` ASC) VISIBLE,
  INDEX `fk_Orders_2_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_5_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_3`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `little_lemon_capstone_project`.`Customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_4`
    FOREIGN KEY (`TableNumber`)
    REFERENCES `little_lemon_capstone_project`.`Tables` (`TableID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_1`
    FOREIGN KEY (`OrderTypeID`)
    REFERENCES `little_lemon_capstone_project`.`OrderType` (`OrderTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_2`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_capstone_project`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_5`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `little_lemon_capstone_project`.`Staff` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Cuisine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Cuisine` (
  `CuisineID` INT NOT NULL AUTO_INCREMENT,
  `Cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CuisineID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Menus` (
  `MenuID` INT NOT NULL AUTO_INCREMENT,
  `MenuName` VARCHAR(45) NOT NULL,
  `CuisineID` INT NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `fk_Menus_1_idx` (`CuisineID` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_1`
    FOREIGN KEY (`CuisineID`)
    REFERENCES `little_lemon_capstone_project`.`Cuisine` (`CuisineID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`PositionCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`PositionCategory` (
  `PositionCategoryID` INT NOT NULL AUTO_INCREMENT,
  `Category` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PositionCategoryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`Positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`Positions` (
  `PositionID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL,
  `Price` DECIMAL(10,2) NULL,
  `CategoryID` INT NOT NULL,
  `Cost` DECIMAL(10,2) NULL,
  PRIMARY KEY (`PositionID`),
  INDEX `fk_Positions_1_idx` (`CategoryID` ASC) VISIBLE,
  CONSTRAINT `fk_Positions_1`
    FOREIGN KEY (`CategoryID`)
    REFERENCES `little_lemon_capstone_project`.`PositionCategory` (`PositionCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`MenuPosition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`MenuPosition` (
  `PositionID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  INDEX `fk_MenuPosition_1_idx` (`PositionID` ASC) VISIBLE,
  INDEX `fk_MenuPosition_2_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_MenuPosition_1`
    FOREIGN KEY (`PositionID`)
    REFERENCES `little_lemon_capstone_project`.`Positions` (`PositionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MenuPosition_2`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon_capstone_project`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`OrderStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`OrderStatus` (
  `StatusID` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(45) NOT NULL,
  `StatusDescription` VARCHAR(255) NULL,
  PRIMARY KEY (`StatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_capstone_project`.`OrderStatusLog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`OrderStatusLog` (
  `OrderStatusLogID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NOT NULL,
  `StatusID` INT NULL,
  `StatusChangeDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`OrderStatusLogID`),
  INDEX `fk_OrderStatusLog_1_idx` (`StatusID` ASC) VISIBLE,
  INDEX `fk_OrderStatusLog_2_idx` (`OrderID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderStatusLog_1`
    FOREIGN KEY (`StatusID`)
    REFERENCES `little_lemon_capstone_project`.`OrderStatus` (`StatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderStatusLog_2`
    FOREIGN KEY (`OrderID`)
    REFERENCES `little_lemon_capstone_project`.`Orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `little_lemon_capstone_project` ;

-- -----------------------------------------------------
-- Placeholder table for view `little_lemon_capstone_project`.`OrdersView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`OrdersView` (`OrderID` INT, `Quantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- Placeholder table for view `little_lemon_capstone_project`.`MoreThan150View`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`MoreThan150View` (`CustomerID` INT, `FullName` INT, `orderID` INT, `TotalCost` INT, `OrderedMenus` INT, `OrderedPositions` INT);

-- -----------------------------------------------------
-- Placeholder table for view `little_lemon_capstone_project`.`ItemsOrderedMoreThan2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_capstone_project`.`ItemsOrderedMoreThan2` (`Name` INT);

-- -----------------------------------------------------
-- procedure AddValidBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `AddValidBooking` (IN table_id INT, IN booking_received_at DATETIME, IN asked_time DATETIME, IN customer_id INT, IN employee_id INT)
BEGIN
DECLARE check_if_booked INT;
START TRANSACTION;
INSERT INTO Bookings (TableNumber, BookingReceivedAt, BookingDate, CustomerID, EmployeeID)
VALUES (table_id, booking_received_at, asked_time, customer_id, employee_id);
SELECT COUNT(*) INTO check_if_booked 
FROM Bookings 
WHERE TableNumber = table_id
AND (BookingDate BETWEEN SUBDATE(asked_time, INTERVAL 90 MINUTE) AND ADDDATE(asked_time, INTERVAL 90 MINUTE));
SELECT check_if_booked;
IF check_if_booked > 1
THEN SELECT "The table is already booked" AS Message;
ROLLBACK;
ELSE 
SELECT "The booking was succesful";
COMMIT;
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `CancelBooking` (IN booking_id INT)
BEGIN
DELETE FROM Bookings 
WHERE BookingID = booking_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `CancelOrder` (IN order_id INT)
BEGIN
UPDATE Orders
SET IsDeleted = TRUE
WHERE OrderID = order_id;
INSERT INTO OrderStatusLog (OrderID, StatusID)
VALUES (order_id, 7);
SELECT CONCAT("Order ", order_id, " is cancelled") AS Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `CheckBooking` (IN asked_time DATETIME, IN table_id INT)
BEGIN
SELECT 
CASE
	WHEN 
    EXISTS (SELECT 1 
    FROM Bookings 
    WHERE TableNumber = table_id 
    AND BookingDate BETWEEN subdate(asked_time, INTERVAL 30 MINUTE) AND adddate(asked_time, INTERVAL 90 MINUTE))
    THEN CONCAT("Table ", table_id, " is already booked")
    ELSE "Free"
END AS Booking;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `GetMaxQuantity` ()
BEGIN
SELECT o.OrderID, COUNT(p.Name) AS PositionsQuantity
FROM Orders AS o
JOIN MenuOrder AS mo
ON o.OrderID = mo.OrderID
JOIN Menus AS m
ON mo.MenuID = m.MenuID
JOIN MenuPosition AS mp
ON m.MenuID = mp.MenuID
JOIN Positions AS p
ON mp.PositionID = p.PositionID
GROUP BY o.OrderID
ORDER BY PositionsQuantity DESC
LIMIT 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PlaceAnOrder
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `PlaceAnOrder` (IN asked_time TIMESTAMP, IN quantity INT, IN order_type INT, IN customer_id INT, IN table_id INT, IN is_deleted TINYINT)
BEGIN
DECLARE check_if_booked INT;
DECLARE check_if_free INT;
START TRANSACTION;
INSERT INTO Orders (OrderDate, Quantity, OrderTypeID, CustomerID, TableNumber, IsDeleted)
VALUES (asked_time, quantity, order_type, customer_id, table_id, is_deleted);
SELECT COUNT(*) INTO check_if_booked 
FROM Bookings 
WHERE TableNumber = table_id
AND (BookingDate BETWEEN SUBDATE(asked_time, INTERVAL 90 MINUTE) AND ADDDATE(asked_time, INTERVAL 90 MINUTE));
SELECT check_if_booked;
SELECT COUNT(*) INTO check_if_free
FROM Orders
WHERE TableNumber = table_id
AND (OrderDate BETWEEN SUBDATE(asked_time, INTERVAL 90 MINUTE) AND ADDDATE(asked_time, INTERVAL 90 MINUTE)); 
SELECT check_if_free;
IF check_if_booked > 1 OR check_if_free > 1
THEN SELECT "The table is already booked" AS Message;
ROLLBACK;
ELSE 
SELECT "The booking was succesful";
COMMIT;
END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_capstone_project`$$
CREATE PROCEDURE `UpdateBooking` (IN booking_id INT, IN booking_date DATETIME)
BEGIN
UPDATE Bookings
SET BookingDate = booking_date
WHERE BookingID = booking_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `little_lemon_capstone_project`.`OrdersView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `little_lemon_capstone_project`.`OrdersView`;
USE `little_lemon_capstone_project`;
CREATE  OR REPLACE VIEW `OrdersView` 
AS SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

-- -----------------------------------------------------
-- View `little_lemon_capstone_project`.`MoreThan150View`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `little_lemon_capstone_project`.`MoreThan150View`;
USE `little_lemon_capstone_project`;
CREATE  OR REPLACE VIEW `MoreThan150View` 
AS SELECT c.CustomerID, 
CONCAT(CustomerFirstName, " ", CustomerLastName) AS FullName,   
o.orderID, MAX(o.TotalCost) AS TotalCost, 
GROUP_CONCAT(DISTINCT m.MenuName SEPARATOR ', ') AS OrderedMenus, 
GROUP_CONCAT(DISTINCT p.Name SEPARATOR ', ') AS OrderedPositions 
FROM  Customers as c 
JOIN Orders AS o 
ON c.CustomerID = o.CustomerID 
JOIN MenuOrder AS mo
ON o.OrderID = mo.OrderID 
JOIN Menus AS m 
ON mo.MenuID = m.MenuID 
JOIN MenuPosition AS mp 
ON m.MenuID = mp.MenuID 
JOIN Positions AS p 
ON p.PositionID = mp.PositionID 
JOIN PositionCategory AS pc 
ON p.CategoryID = pc.PositionCategoryID 
WHERE TotalCost > 150 AND (pc.Category = "Starter" OR pc.Category = "Main") GROUP BY c.CustomerID, FullName, o.OrderID
ORDER BY TotalCost;

-- -----------------------------------------------------
-- View `little_lemon_capstone_project`.`ItemsOrderedMoreThan2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `little_lemon_capstone_project`.`ItemsOrderedMoreThan2`;
USE `little_lemon_capstone_project`;
CREATE  OR REPLACE VIEW `ItemsOrderedMoreThan2` 
AS SELECT p.Name
 FROM Positions AS p
 WHERE
(SELECT COUNT(*)
FROM Orders AS o
JOIN MenuOrder AS mo
ON o.OrderID = mo.OrderID
JOIN Menus AS m
ON mo.MenuID = m.MenuID
JOIN MenuPosition AS mp
ON m.MenuID = mp.MenuID
WHERE mp.PositionID = p.PositionID) > 2
GROUP BY p.Name
ORDER BY Name;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
