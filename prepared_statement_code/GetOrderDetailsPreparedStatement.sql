PREPARE GetOrderDetails FROM "SELECT OrderID, Quantity, TotalCost FROM Orders WHERE OrderID = ?";

SET @id = 2;
EXECUTE GetOrderDetails USING @id;
