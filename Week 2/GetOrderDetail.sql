SET @sql_query = 'SELECT `order_id`, `quantity`, `total_cost` FROM `LittleLemonDM`.`Orders` WHERE `customer_id` = ?';
PREPARE GetOrderDetail FROM @sql_query;