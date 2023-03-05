CREATE DEFINER=`meta`@`%` PROCEDURE `CheckBooking`(
	IN B_Date DATE,
    IN Table_No INT
)
BEGIN
	DECLARE status INT DEFAULT 0;
    
    -- Check if the booking exists and feed the result to the 'status' variable
    SELECT 
		EXISTS( SELECT 
					1
				FROM
					littlelemondb.bookings
				WHERE
					BookingDate = B_Date AND
                    TableNo = Table_No
				LIMIT 1)
	INTO status;
    -- Provide an appropriate message depending on whether the booking exists or not
    IF status = 1 THEN
        SELECT CONCAT('Table ', Table_No, ' is already booked') AS 'Booking Status';
	ELSE
        SELECT CONCAT('Table ', Table_No, ' is NOT booked') AS 'Booking Status';
    END IF;    
END