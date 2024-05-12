CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `UpdateBooking`(IN booking_id INT, IN booking_date DATETIME)
BEGIN
UPDATE Bookings
SET BookingDate = booking_date
WHERE BookingID = booking_id;
END