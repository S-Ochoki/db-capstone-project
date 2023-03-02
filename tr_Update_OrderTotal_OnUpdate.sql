-- This trigger updates the Order Totals every time a record is updates in the OrderItems table.

DROP TRIGGER IF EXISTS `tr_Update_OrderTotal_OnUpdate`;

DELIMITER $$
CREATE TRIGGER `tr_Update_OrderTotal_OnUpdate`
AFTER UPDATE ON `orderitems` FOR EACH ROW 
BEGIN
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
WHERE orders.OrderId = OLD.OrderId;

END $$

Show Triggers;