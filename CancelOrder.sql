 -- Procedure that displays the maximum ordered quantity from the Orders table
DELIMITER $$

CREATE PROCEDURE `CancelOrder` (IN OID INT)
sp: BEGIN
	DECLARE confirm INT DEFAULT 1;
    DECLARE ocheck INT DEFAULT 0;
    
    -- Check if the OrderID provided exists
    SELECT EXISTS(SELECT 1 from orders WHERE orderid = OID LIMIT 1) into ocheck;
    -- If the Order ID doesn't exist, exit the procedure with an appropriate message
    IF ocheck = 0 THEN
		SELECT CONCAT('Order ', OID, ' does NOT exist') AS 'Check';
        LEAVE sp;
    END IF;
    
    -- Deletes the Order
	DELETE FROM Orders WHERE OrderID = OID; 
    
    -- Check if the Order exists after deletion
    SELECT EXISTS(SELECT 1 from orders WHERE orderid = OID LIMIT 1) into confirm;
    
    -- Provide an appropriate message 
    IF confirm = 0 THEN
        SELECT CONCAT('Order ', OID, ' is cancelled') AS 'Confirmation';
	ELSE
        SELECT CONCAT('Order ', OID, ' was NOT cancelled successfully') AS 'Confirmation';
    END IF;
    
END $$

DELIMITER ;