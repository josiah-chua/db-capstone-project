USE LittleLemonDM;

-- Create a stored procedure named AddValidBooking
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN input_customer_id INT, IN input_booking_date DATETIME, IN input_table_number INT)
BEGIN
    DECLARE table_status VARCHAR(20);

    -- Start a transaction
    START TRANSACTION;

    -- Add a new booking record using the input parameters
    INSERT INTO Bookings (customer_id, date, table_number) VALUES (input_customer_id, input_booking_date, input_table_number);

    -- Check if the table is already booked for the specified date
    SELECT IFNULL('Booked', 'Not Booked') INTO table_status
    FROM Bookings
    WHERE DATE(date) = input_booking_date AND table_number = input_table_number AND customer_id <> input_customer_id;

    -- If the table is already booked, rollback the transaction
    IF table_status = 'Booked' THEN
        -- Rollback the transaction
        ROLLBACK;
        SELECT 'Booking declined. Table is already booked by another customer.' AS Result;
    ELSE
        -- If the table is available, commit the transaction
        COMMIT;
        SELECT 'Booking successful. Table is now reserved.' AS Result;
    END IF;
END //
DELIMITER ;