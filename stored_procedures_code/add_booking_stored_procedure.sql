CREATE DEFINER=`db_capstone_user`@`%` 
PROCEDURE `AddBooking`(IN customer_id INT, IN booking_date DATETIME, IN table_number INT, IN employee_id INT)
BEGIN
INSERT INTO Bookings (TableNumber, BookingDate, CustomerID, EmployeeID)
VALUES (table_number, booking_date, customer_id, employee_id);
END