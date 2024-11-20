-- Write your SQL code here

-- 1. Function to Calculate Total Cost for a Reservation
DELIMITER $$

CREATE FUNCTION CalculateTotalCost (
    p_FlightID INT,
    p_SeatClass VARCHAR(20)
) 
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE flightCost DECIMAL(10, 2);
    DECLARE seatClassCostMultiplier DECIMAL(3, 2);

    SELECT 1000 INTO flightCost
    WHERE FlightID = p_FlightID;

    IF p_SeatClass = 'First Class' THEN
        SET seatClassCostMultiplier = 1.5;
    ELSEIF p_SeatClass = 'Business Class' THEN
        SET seatClassCostMultiplier = 1.2;
    ELSE
        SET seatClassCostMultiplier = 1.0;
    END IF;

    RETURN flightCost * seatClassCostMultiplier;
END $$

DELIMITER ;

-- 2. Function to Get the Number of Reservations for a Passenger
DELIMITER $$

CREATE FUNCTION GetReservationCount (
    p_PassengerID INT
) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE reservationCount INT;

    SELECT COUNT(*) INTO reservationCount
    FROM Reservation
    WHERE PassengerID = p_PassengerID;

    RETURN reservationCount;
END $$

DELIMITER ;

-- 3. Function to Get Seat Availability
DELIMITER $$

CREATE FUNCTION IsSeatAvailable (
    p_FlightID INT,
    p_SeatNumber VARCHAR(10)
) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE seatAvailable BOOLEAN;

    IF EXISTS (SELECT 1 FROM Seat 
               WHERE FlightID = p_FlightID AND SeatNumber = p_SeatNumber
               AND SeatID NOT IN (SELECT SeatID FROM Booking WHERE ReservationID IN 
                                  (SELECT ReservationID FROM Reservation WHERE FlightID = p_FlightID))) THEN
        SET seatAvailable = TRUE;
    ELSE
        SET seatAvailable = FALSE;
    END IF;

    RETURN seatAvailable;
END $$

DELIMITER ;

-- 4.Function to Get Flight Duration
DELIMITER $$

CREATE FUNCTION GetFlightDuration (
    p_FlightID INT
) 
RETURNS TIME
DETERMINISTIC
BEGIN
    DECLARE flightDuration TIME;

    SELECT TIMEDIFF(ArrivalTime, DepartureTime) INTO flightDuration
    FROM Flight
    WHERE FlightID = p_FlightID;

    RETURN flightDuration;
END $$

DELIMITER ;

-- 5. Function to Check if a Flight Has Any Available Seats
DELIMITER $$

CREATE FUNCTION HasAvailableSeats (
    p_FlightID INT
) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE availableSeats BOOLEAN;

    IF EXISTS (SELECT 1 FROM Seat 
               WHERE FlightID = p_FlightID
               AND SeatID NOT IN (SELECT SeatID FROM Booking WHERE ReservationID IN 
                                  (SELECT ReservationID FROM Reservation WHERE FlightID = p_FlightID))) THEN
        SET availableSeats = TRUE;
    ELSE
        SET availableSeats = FALSE;
    END IF;

    RETURN availableSeats;
END $$

DELIMITER ;




