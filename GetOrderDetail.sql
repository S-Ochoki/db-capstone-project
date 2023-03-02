-- Uses CustomerID to return the order id, the quantity and the order cost from the Orders table

PREPARE GetOrderDetail FROM 
	'SELECT 
		OrderID, Quantity, TotalCost
	FROM
		orders
			INNER JOIN
		bookings b USING (BookingID)
	WHERE
		b.GuestID = ?'; 
        

