USE LittleLemonDM;

-- Create a stored procedure named CheckBooking
DELIMITER //
CREATE PROCEDURE CheckBooking(IN input_booking_date DATETIME, IN input_table_number INT)
BEGIN
    DECLARE table_status VARCHAR(20);
    DECLARE booking_datetime DATETIME;

    -- Check if the table is already booked for the specified date
    SELECT IFNULL('Booked', 'Not Booked'), date INTO table_status, booking_datetime
    FROM Bookings
    WHERE DATE(date) = input_booking_date AND table_number = input_table_number;

    -- Display the result
    SELECT CONCAT('Table ', input_table_number, ' on ', booking_datetime, ' is ', table_status, '.') AS Result;
END //
DELIMITER ;
