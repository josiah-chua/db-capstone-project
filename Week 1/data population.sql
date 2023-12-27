-- Insert dummy data into Customer_Details table
INSERT INTO LittleLemonDM.Customer_Details (`customer_id`, `customer_names`, `phone_number`, `email`)
VALUES (100001, 'John Doe', 123456789, 'john@example.com'),
       (100002, 'Jane Doe', 987654321, 'jane@example.com'),
       (100003, 'Bob Smith', 555123456, 'bob@example.com');

-- Insert dummy data into Bookings table
INSERT INTO LittleLemonDM.Bookings (`booking_id`, `date`, `table_number`, `customer_id`)
VALUES (100001, '2023-01-15 12:00:00', 1, 100001),
       (100002, '2023-01-20 18:30:00', 2, 100002),
       (100003, '2023-02-05 14:45:00', 3, 100003);

-- Insert dummy data into MenuItems table
INSERT INTO LittleLemonDM.MenuItems (`menu_items_id`, `menu_name`, `cusine`, `starters`, `courses`, `drinks`, `desserts`, `cost`)
VALUES (100001, 'Italian Feast', 'Italian', 'Bruschetta', 'Pasta Carbonara', 'Wine', 'Tiramisu', 50.00),
       (100002, 'Asian Delight', 'Asian', 'Spring Rolls', 'Teriyaki Chicken', 'Green Tea', 'Mochi Ice Cream', 45.00),
       (100003, 'American Classic', 'American', 'Buffalo Wings', 'Burger', 'Cola', 'Cheesecake', 40.00);

-- Insert dummy data into Orders table
INSERT INTO LittleLemonDM.Orders (`order_id`, `order_date`, `quantity`, `total_cost`, `menu_id`, `customer_id`)
VALUES (100001, '2023-01-15 12:30:00', 2, 100.00, 100001, 100001),
       (100002, '2023-01-20 19:00:00', 1, 45.00, 100002, 100002),
       (100003, '2023-02-05 15:00:00', 3, 120.00, 100003, 100003);

-- Insert dummy data into Order_Delivery_Status table
INSERT INTO LittleLemonDM.Order_Delivery_Status (`delivery_id`, `delivery_date`, `delivery_status`, `order_id`)
VALUES (100001, '2023-01-15 13:00:00', 'Delivered', 100001),
       (100002, '2023-01-21 10:00:00', 'In Transit', 100002),
       (100003, '2023-02-06 16:30:00', 'Pending', 100003);

-- Insert dummy data into Staff_Info table
INSERT INTO LittleLemonDM.Staff_Info (`staff_id`, `name`, `role`, `salary`)
VALUES (100001, 'Chef Michael', 'Chef', '60000'),
       (100002, 'Server Emily', 'Server', '30000'),
       (100003, 'Manager David', 'Manager', '70000');
