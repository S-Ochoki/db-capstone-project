CREATE DEFINER=`meta`@`%` PROCEDURE `AddValidBooking`(
	-- The procedure should include two input parameters in the form of booking date and table number.
    IN B_Date DATE,
    IN Table_No INT
)
BEGIN
	-- It also requires at least one variable and should begin with a START TRANSACTION statement.
    DECLARE check_table INT DEFAULT 0;
	
    START TRANSACTION;

    -- Check if a booking exists and feed the result to the 'check_table' variable
    SELECT 
		EXISTS( SELECT 
					*
				FROM
					littlelemondb.bookings
				WHERE
					BookingDate = B_Date AND
                    TableNo = Table_No
				LIMIT 1)
	INTO check_table;
	
	INSERT INTO littlelemondb.bookings 
		(BookingID, GuestID, BookingDate, BookingTimeSlot, TableNo, StaffID) 
	VALUES 
		(default, 1 , B_Date, '18:00:00', Table_No, 5);

    -- Use an IF ELSE statement to check if a table is already booked on the given date. 
    IF check_table = 1 THEN -- If the table is already booked, then rollback the transaction.
        ROLLBACK;
        SELECT CONCAT('Table ', Table_No, ' is already booked - booking cancelled') AS 'Booking Status';
	ELSE	-- If the table is available, then commit the transaction.
        COMMIT;
        SELECT CONCAT('Table ', Table_No, ' is successfully booked on ', B_Date) AS 'Booking Status';
    END IF;  	

END