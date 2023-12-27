USE littlelemondm;
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE max_quantity INT;

    -- Find the maximum ordered quantity
    SELECT MAX(`quantity`) INTO max_quantity
    FROM LittleLemonDM.Orders;

    -- Display the result
    SELECT 'The maximum ordered quantity is: ' AS Result, max_quantity AS MaxQuantity;
END //
DELIMITER ;

