-- 1. Trigger to automatically update the TotalCost in the Reservation table when a Booking is added

DELIMITER $$

CREATE TRIGGER update_total_cost_after_booking_insert
AFTER INSERT ON Booking
FOR EACH ROW
BEGIN
    DECLARE total_cost DECIMAL(10, 2);
    
    SELECT SUM(price) INTO total_cost
    FROM Seat
    WHERE SeatID = NEW.SeatID;
    
    UPDATE Reservation
    SET TotalCost = total_cost + IFNULL(NEW.BaggageAllowance, 0) * 10 
    WHERE ReservationID = NEW.ReservationID;
END $$

DELIMITER ;


-- 2. Trigger to automatically update the Flight details when a Seat is assigned
DELIMITER $$

CREATE TRIGGER update_seat_on_flight
AFTER INSERT ON Seat
FOR EACH ROW
BEGIN
    UPDATE Flight
    SET AvailableSeats = AvailableSeats - 1
    WHERE FlightID = NEW.FlightID;
END $$

DELIMITER ;


-- 3. Trigger to automatically update a Staff member's role when the User role changes
DELIMITER $$

CREATE TRIGGER update_staff_role_on_user_role_change
AFTER UPDATE ON User
FOR EACH ROW
BEGIN
    IF OLD.Role <> NEW.Role THEN
        UPDATE Staff
        SET Role = NEW.Role
        WHERE UserID = NEW.UserID;
    END IF;
END $$

DELIMITER ;


-- 4. Trigger to automatically delete associated Booking records when a Reservation is deleted
DELIMITER $$

CREATE TRIGGER delete_booking_after_reservation_delete
AFTER DELETE ON Reservation
FOR EACH ROW
BEGIN
    DELETE FROM Booking
    WHERE ReservationID = OLD.ReservationID;
END $$

DELIMITER ;


-- 5. Trigger to prevent deletion of a Reservation if there are associated Bookings
DELIMITER $$

CREATE TRIGGER prevent_reservation_delete
BEFORE DELETE ON Reservation
FOR EACH ROW
BEGIN
    DECLARE booking_count INT;

    SELECT COUNT(*) INTO booking_count
    FROM Booking
    WHERE ReservationID = OLD.ReservationID;

    IF booking_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete Reservation with associated Bookings';
    END IF;
END $$

DELIMITER ;

