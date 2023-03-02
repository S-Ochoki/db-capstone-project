 -- Procedure that displays the maximum ordered quantity in the Orders table
DELIMITER $$

CREATE PROCEDURE `CancelOrder` (IN OID INT)
sp: BEGIN
	DECLARE confirm INT DEFAULT 1;
    DECLARE ocheck INT DEFAULT 0;
    
    SELECT EXISTS(SELECT 1 from orders WHERE orderid = OID LIMIT 1) into ocheck;
    IF ocheck = 0 THEN
		SELECT CONCAT('Order ', OID, ' does NOT exist') AS 'Check';
        LEAVE sp;
    END IF;
    
	DELETE FROM Orders WHERE OrderID = OID; 
    
    SELECT EXISTS(SELECT 1 from orders WHERE orderid = OID LIMIT 1) into confirm;
    
    IF confirm = 0 THEN
        SELECT CONCAT('Order ', OID, ' is cancelled') AS 'Confirmation';
	ELSE
        SELECT CONCAT('Order ', OID, ' was NOT cancelled successfully') AS 'Confirmation';
    END IF;
    
END $$

DELIMITER ;