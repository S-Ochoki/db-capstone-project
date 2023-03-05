select * from bookings;

SET @B_Date = '2022-12-17';
SET @Table_No = 6;

CALL AddValidBooking(@B_Date, @Table_No);

CALL `CheckBooking`(@B_Date, @Table_No);
    