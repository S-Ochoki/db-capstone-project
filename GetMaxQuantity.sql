 -- Procedure that displays the maximum ordered quantity in the Orders table
 
CREATE DEFINER=`meta`@`%` PROCEDURE `GetMaxQuantity`()
SELECT 
    MAX(orders.quantity) AS 'Max Quantity in Order'
FROM
    littlelemondb.orders;