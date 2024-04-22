CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `CancelBooking`(IN booking_id INT)
BEGIN
DELETE FROM Bookings 
WHERE BookingID = booking_id;
END