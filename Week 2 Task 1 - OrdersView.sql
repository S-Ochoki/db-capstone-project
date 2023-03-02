CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `meta`@`%` 
    SQL SECURITY DEFINER
VIEW `ordersview` AS
    SELECT 
        `orders`.`OrderID` AS `OrderID`,
        SUM(`orderitems`.`Quantity`) AS `Quantity`,
        `orders`.`TotalCost` AS `TotalCost`
    FROM
        (`orders`
        JOIN `orderitems` ON ((`orders`.`OrderID` = `orderitems`.`OrderID`)))
    GROUP BY `orders`.`OrderID`
    HAVING (`Quantity` > 2)