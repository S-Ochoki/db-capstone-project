-- My table structure is not the same as the one proposed in the exercise.
-- I therefore had to go about the task differently - I use a CTE to list all Order Items for Orders with a Total Bill above $150
-- List of customers with orders over $150 
WITH 
CTE as (
	SELECT 
		c.CustomerID,
		CONCAT(c.CustomerFirstName,
				' ',
				c.CustomerLastName) AS FullName,
		o.OrderID,
		o.TotalCost,
		m.MenuName,
		mi.ItemName,
		mi.CourseType,
		oi.Quantity
	FROM
		littlelemondb.customers c
			INNER JOIN
		bookings b ON c.CustomerID = b.`GuestID`
			INNER JOIN
		orders o USING (bookingid)
			INNER JOIN
		orderitems oi USING (orderid)
			INNER JOIN
		menuitems mi USING (menuitemid)
			INNER JOIN
		menus m USING (menuid)
	WHERE
		TotalCost > 150
        ) -- End of CTE

-- Lists the first Main Course and Starter
SELECT 
	CustomerID, 
	FullName, 
	OrderID, 
	TotalCost,
	(SELECT MenuName FROM CTE WHERE CourseType = "Main Courses" limit 1) AS MenuName,
	(SELECT ItemName FROM CTE WHERE CourseType = "Main Courses" limit 1) AS CourseName,
	(SELECT ItemName FROM CTE WHERE CourseType = "Starters" limit 1) AS StarterName
FROM CTE
GROUP BY OrderID
ORDER BY TotalCost ASC;