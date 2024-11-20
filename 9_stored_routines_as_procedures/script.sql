-- Write your SQL code here

-- 1. Stored Procedure to Add a Reservation
DELIMITER $$

CREATE PROCEDURE AddReservation (
    IN p_FlightID INT,
    IN p_PassengerID INT,
    IN p_ReservationDate TIMESTAMP,
    IN p_TotalCost DECIMAL(10, 2)
)
BEGIN
    INSERT INTO Reservation (FlightID, PassengerID, ReservationDate, TotalCost)
    VALUES (p_FlightID, p_PassengerID, p_ReservationDate, p_TotalCost);
END $$

DELIMITER ;


-- 2. Stored Procedure to Add a Booking
DELIMITER $$

CREATE PROCEDURE AddBooking (
    IN p_ReservationID INT,
    IN p_SeatID INT,
    IN p_BaggageAllowance INT,
    IN p_MealPreference VARCHAR(50)
)
BEGIN
    INSERT INTO Booking (ReservationID, SeatID, BaggageAllowance, MealPreference)
    VALUES (p_ReservationID, p_SeatID, p_BaggageAllowance, p_MealPreference);
END $$

DELIMITER ;

-- 3. Stored Procedure to Get Flight Information by Flight ID
DELIMITER $$

CREATE PROCEDURE GetFlightInfo (
    IN p_FlightID INT
)
BEGIN
    SELECT FlightNumber, DepartureTime, ArrivalTime, Origin, Destination
    FROM Flight
    WHERE FlightID = p_FlightID;
END $$

DELIMITER ;


-- 4. Stored Procedure to Update Passenger Information
DELIMITER $$

CREATE PROCEDURE UpdatePassengerInfo (
    IN p_PassengerID INT,
    IN p_ContactInfo VARCHAR(100),
    IN p_Nationality VARCHAR(50)
)
BEGIN
    UPDATE Passenger
    SET ContactInfo = p_ContactInfo, Nationality = p_Nationality
    WHERE PassengerID = p_PassengerID;
END $$

DELIMITER ;

-- 5. Stored Procedure to Delete a Reservation
DELIMITER $$

CREATE PROCEDURE DeleteReservation (
    IN p_ReservationID INT
)
BEGIN
    DELETE FROM Booking WHERE ReservationID = p_ReservationID;
    DELETE FROM Reservation WHERE ReservationID = p_ReservationID;
END $$

DELIMITER ;

-- 6. Stored Procedure to Get All Reservations for a Passenger

DELIMITER $$

CREATE PROCEDURE GetReservationsForPassenger (
    IN p_PassengerID INT
)
BEGIN
    SELECT ReservationID, FlightID, ReservationDate, TotalCost
    FROM Reservation
    WHERE PassengerID = p_PassengerID;
END $$

DELIMITER ;

-- 7. Stored Procedure to Get All Seats Available for a Flight
DELIMITER $$

CREATE PROCEDURE GetAvailableSeats (
    IN p_FlightID INT
)
BEGIN
    SELECT SeatID, SeatNumber, Class
    FROM Seat
    WHERE FlightID = p_FlightID
    AND SeatID NOT IN (SELECT SeatID FROM Booking WHERE ReservationID IN (SELECT ReservationID FROM Reservation WHERE FlightID = p_FlightID));
END $$

DELIMITER ;

-- 8. Stored Procedure to Add a Flight
DELIMITER $$

CREATE PROCEDURE AddFlight (
    IN p_FlightNumber VARCHAR(20),
    IN p_DepartureTime TIMESTAMP,
    IN p_ArrivalTime TIMESTAMP,
    IN p_Origin VARCHAR(50),
    IN p_Destination VARCHAR(50)
)
BEGIN
    INSERT INTO Flight (FlightNumber, DepartureTime, ArrivalTime, Origin, Destination)
    VALUES (p_FlightNumber, p_DepartureTime, p_ArrivalTime, p_Origin, p_Destination);
END $$

DELIMITER ;
