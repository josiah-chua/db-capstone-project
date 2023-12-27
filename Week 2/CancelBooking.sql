-- Use the database
USE LittleLemonDM;

-- Create a stored procedure named CancelBooking
DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN input_booking_id INT
)
BEGIN
    DECLARE booking_exists INT;

    -- Check if the booking exists
    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE booking_id = input_booking_id;

    IF booking_exists > 0 THEN
        -- Delete the booking for the specified booking id
        DELETE FROM Bookings WHERE booking_id = input_booking_id;
        SELECT 'Booking canceled successfully.' AS Result;
    ELSE
        SELECT 'Booking not found. No action taken.' AS Result;
    END IF;
END //
DELIMITER ;