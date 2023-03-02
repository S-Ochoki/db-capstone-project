-- Week 2 Task 3 
-- All menu items for which more than 2 orders have been placed

SELECT 
    ItemName
FROM
    littlelemondb.menuitems
WHERE
    MenuItemID = ANY (
		SELECT 
            MenuItemID
        FROM
            orderitems
        GROUP BY MenuItemID
        HAVING COUNT(orderid) > 2);