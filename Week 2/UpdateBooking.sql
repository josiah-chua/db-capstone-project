-- Use the database
USE LittleLemonDM;

-- Create a stored procedure named UpdateBooking
DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN input_booking_id INT,
    IN input_booking_date DATETIME
)
BEGIN
    -- Update the booking date for the specified booking id
    UPDATE Bookings
    SET date = input_booking_date
    WHERE booking_id = input_booking_id;

    SELECT 'Booking updated successfully.' AS Result;
END //
DELIMITER ;