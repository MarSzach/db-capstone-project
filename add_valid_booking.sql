CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `AddValidBooking`(IN asked_time DATETIME, IN table_id INT)
BEGIN
DECLARE check_if_booked INT;
START TRANSACTION;
INSERT INTO Bookings (TableNumber, BookingDate, CustomerID, EmployeeID)
VALUES (table_id, asked_time, 28, 7);
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
END