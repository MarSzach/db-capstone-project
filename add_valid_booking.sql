CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `AddValidBooking`(IN table_id INT, IN booking_received_at DATETIME, IN asked_time DATETIME, IN customer_id INT, IN employee_id INT)
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
END