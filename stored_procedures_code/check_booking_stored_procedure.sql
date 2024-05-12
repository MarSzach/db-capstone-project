CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `CheckBooking`(IN asked_time DATETIME, IN table_id INT)
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
END