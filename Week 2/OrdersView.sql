CREATE VIEW LittleLemonDM.OrdersView AS
SELECT `order_id`, `quantity`, `total_cost`
FROM `LittleLemonDM`.`Orders`
WHERE `quantity` > 2;