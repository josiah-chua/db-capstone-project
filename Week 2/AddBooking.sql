-- Use the database
USE LittleLemonDM;

-- Create a stored procedure named AddBooking
DELIMITER //
CREATE PROCEDURE AddBooking(
    IN input_booking_id INT,
    IN input_customer_id INT,
    IN input_booking_date DATETIME,
    IN input_table_number INT
)
BEGIN
    -- Add a new booking record using the input parameters
    INSERT INTO Bookings (booking_id, customer_id, date, table_number)
    VALUES (input_booking_id, input_customer_id, input_booking_date, input_table_number);

    SELECT 'Booking added successfully.' AS Result;
END //
DELIMITER ;