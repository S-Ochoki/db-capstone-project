CREATE PROCEDURE `CancelBooking`(
	IN B_ID INT
)
BEGIN
	DECLARE check_status INT DEFAULT 1;
    
    -- Check if the booking exists
	SELECT 
		EXISTS( SELECT 
				1
			FROM
				bookings
			WHERE
				BookingID = B_ID
			LIMIT 1)
	INTO check_status;
    
    -- Delete the booking    
    IF check_status = 1 THEN
		DELETE FROM Bookings 
		WHERE BookingID = B_ID; 
        SELECT CONCAT('Booking ', B_ID, ' cancelled') AS 'Confirmation';
	ELSE
        SELECT CONCAT('Booking ', B_ID, ' does NOT exist') AS 'Confirmation';
    END IF;
END
