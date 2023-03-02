-- My table structure is not the same as the one proposed in the exercise.
-- I therefore had to go about the task differently
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

select 
	CustomerID, 
	FullName, 
	OrderID, 
	TotalCost,
	(select MenuName from CTE where CourseType = "Main Courses" limit 1) as MenuName,
	(select ItemName from CTE where CourseType = "Main Courses" limit 1) as CourseName,
	(select ItemName from CTE where CourseType = "Starters" limit 1) as StarterName
from CTE
group by OrderID
order by TotalCost asc;