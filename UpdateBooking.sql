CREATE DEFINER=`meta`@`%` PROCEDURE `UpdateBooking`(
    IN B_ID INT, 
    IN B_Date DATE
)
BEGIN

DECLARE check_booking INT DEFAULT 0;

-- Check if the booking exists
    SELECT 
		EXISTS( SELECT 
					1
				FROM
					littlelemondb.bookings
				WHERE
					BookingID = B_ID
				LIMIT 1)
	INTO check_booking;
	
	-- Update the booking if it exists
    IF check_booking = 1 THEN -- If the table is already booked, then do NOT create the booking.
 		UPDATE littlelemondb.bookings 
		SET BookingDate = B_Date
        WHERE (BookingID = B_ID);
        SELECT CONCAT('Booking ', B_ID, ' updated') AS 'Confirmation';
	ELSE	-- If the booking doesn't exist, inform the user
        SELECT CONCAT('Booking ', B_ID, ' not found') AS 'Confirmation';
    END IF;  
END