INSERT INTO littlelemondb.bookings 
	(BookingID, GuestID, BookingDate, BookingTimeSlot, TableNo, StaffID) 
VALUES 
	(default, 1 , '2022-10-10', '18:00:00', 5, 7), 
	(default, 3 , '2022-11-12', '18:00:00', 3, 7), 
	(default, 2 , '2022-10-11', '18:00:00', 2, 7), 
	(default, 1 , '2022-10-13', '18:00:00', 2, 7);

SELECT * FROM littlelemondb.bookings;