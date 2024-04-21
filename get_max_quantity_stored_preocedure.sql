CREATE DEFINER=`db_capstone_user`@`%` PROCEDURE `GetMaxQuantity`()
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
END