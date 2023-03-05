CREATE DEFINER=`meta`@`%` PROCEDURE `AddBooking`(
    -- My booking table uses auto-increment,
    -- therefore using the input is unnecessary. 
    -- My program defaults to the next available ID.
    IN B_ID INT, 
    IN Cust_ID INT,
    IN B_Date DATE,
    IN Table_No INT
)
BEGIN

	-- Flags for whether the Customer exists or the table has already been booked
    DECLARE check_cust INT DEFAULT 1;
    DECLARE check_table INT DEFAULT 0;
    
	-- Check if the Customer exists
    SELECT 
		EXISTS( SELECT 
					1
				FROM
					littlelemondb.customers
				WHERE
					CustomerID = Cust_ID
				LIMIT 1)
	INTO check_cust;
    
    -- If the customer doesnt exist, create the customer with filler details
    IF check_cust = 0 THEN
        INSERT INTO `littlelemondb`.`customers` 
			(`CustomerID`, `CustomerFirstName`, `CustomerLastName`) 
        VALUES 
			(Cust_ID, CONCAT('Fname_', Cust_ID), CONCAT('Lname_', Cust_ID));
        COMMIT;
    END IF; 
    
    -- Check if a table has been booked
    SELECT 
		EXISTS( SELECT 
					1
				FROM
					littlelemondb.bookings
				WHERE
					BookingDate = B_Date AND
                    TableNo = Table_No
				LIMIT 1)
	INTO check_table;
        
	
	-- Add the booking depending on table availability
    IF check_table = 1 THEN -- If the table is already booked, then do NOT create the booking.
        SELECT CONCAT('Table ', Table_No, ' is already booked - booking cancelled') AS 'Booking Status';
	ELSE	-- If the table is available, then add the booking
		INSERT INTO littlelemondb.bookings 
			(BookingID, GuestID, BookingDate, BookingTimeSlot, TableNo, StaffID) 
		VALUES 
			(default, Cust_ID, B_Date, '18:00:00', Table_No, 5);
        COMMIT;
        SELECT 'New booking added' AS 'Confirmation';
    END IF;  	

END