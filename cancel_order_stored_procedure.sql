CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
UPDATE Orders
SET IsDeleted = TRUE
WHERE OrderID = order_id;
INSERT INTO OrderStatusLog (OrderID, StatusID)
VALUES (order_id, 7);
SELECT CONCAT("Order ", order_id, " is cancelled") AS Confirmation;
END