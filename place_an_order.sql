CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `PlaceAnOrder`(IN asked_time TIMESTAMP, IN quantity INT, IN order_type INT, IN customer_id INT, IN table_id INT, IN is_deleted TINYINT)
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
END