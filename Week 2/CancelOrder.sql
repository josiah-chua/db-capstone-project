
The error you're encountering, which is related to safe update mode, occurs because you are using the DELETE statement without a WHERE clause that involves a key column in the Orders table. The safe update mode is designed to prevent unintended mass updates or deletes without proper conditions.

To resolve this issue, you can modify the DELETE statement for the Orders table to include a condition based on the primary key column. Assuming that order_id is the primary key, you can update the DELETE statement as follows:

sql
Copy code
-- Modify the DELETE statement for the Orders table
DELETE FROM LittleLemonDM.Orders WHERE order_id = input_order_id;
By adding the condition WHERE order_id = input_order_id, you are specifying that only the row with the specified order_id should be deleted. This satisfies the safe update mode requirements.

Here's the modified procedure:

sql
Copy code
-- Create a modified stored procedure named CancelOrder
DELIMITER //
CREATE PROCEDURE CancelOrder(IN input_order_id INT)
BEGIN
    DECLARE delivery_exists INT;
    
    -- Check if the order exists
    IF EXISTS (SELECT 1 FROM LittleLemonDM.Orders WHERE order_id = input_order_id) THEN
    
        -- Check if the order has related delivery records
        SELECT COUNT(*) INTO delivery_exists
        FROM `LittleLemonDM`.`Order_Delivery_Status`
        WHERE `order_id` = input_order_id;

        -- If related delivery records exist, delete them
        IF delivery_exists > 0 THEN
            DELETE FROM `LittleLemonDM`.`Order_Delivery_Status` WHERE `order_id` = input_order_id;
        END IF;
        
        -- Delete the order based on the order id
        DELETE FROM LittleLemonDM.Orders WHERE order_id = input_order_id;
        SELECT 'Order canceled successfully.' AS Result;
    ELSE
        SELECT 'Order not found. No action taken.' AS Result;
    END IF;
END //
DELIMITER ;
CALL CancelOrder(100001)