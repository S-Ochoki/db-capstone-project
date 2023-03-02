-- This trigger updates the Order Totals every time a new record is created in the OrderItems table.

DROP TRIGGER IF EXISTS `tr_Update_OrderTotal`;

DELIMITER $$
CREATE TRIGGER `tr_Update_OrderTotal`
AFTER INSERT ON `orderitems` FOR EACH ROW 
BEGIN
DECLARE OrderTotal DOUBLE;
UPDATE orders 
SET TotalCost = (
	SELECT 
		SUM(orderitems.Quantity * menuitems.Price)
	FROM
		littlelemondb.orderitems
			INNER JOIN
		menuitems USING (menuitemid)
	WHERE
		orderitems.OrderID = orders.OrderId)
WHERE orders.OrderId = NEW.OrderId;

END $$

Show triggers;