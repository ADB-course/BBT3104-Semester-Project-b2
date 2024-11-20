-- Write your SQL code here

-- 1. View to Get Flight Information and Total Reservation Count
DELIMITER $$

CREATE VIEW FlightReservationSummary AS
SELECT 
    f.FlightID,
    f.FlightNumber,
    f.DepartureTime,
    f.ArrivalTime,
    f.Origin,
    f.Destination,
    COUNT(r.ReservationID) AS TotalReservations
FROM 
    Flight f
LEFT JOIN 
    Reservation r ON f.FlightID = r.FlightID
GROUP BY 
    f.FlightID;

DELIMITER ;

-- 2. View to Get Passenger Reservation Details
DELIMITER $$

CREATE VIEW PassengerReservationDetails AS
SELECT 
    p.FullName AS PassengerName,
    f.FlightNumber,
    r.ReservationDate,
    r.TotalCost
FROM 
    Passenger p
JOIN 
    Reservation r ON p.PassengerID = r.PassengerID
JOIN 
    Flight f ON r.FlightID = f.FlightID;

DELIMITER ;

-- 3. View to Get Available Seats for Each Flight
DELIMITER $$

CREATE VIEW AvailableSeats AS
SELECT 
    s.SeatID,
    s.SeatNumber,
    s.Class,
    f.FlightNumber,
    f.Origin,
    f.Destination
FROM 
    Seat s
JOIN 
    Flight f ON s.FlightID = f.FlightID
LEFT JOIN 
    Booking b ON s.SeatID = b.SeatID
WHERE 
    b.SeatID IS NULL;

DELIMITER ;

-- 4. View to Get Booking Details
DELIMITER $$

CREATE VIEW BookingDetails AS
SELECT 
    b.BookingID,
    r.ReservationDate,
    s.SeatNumber,
    s.Class AS SeatClass,
    b.MealPreference,
    b.BaggageAllowance
FROM 
    Booking b
JOIN 
    Reservation r ON b.ReservationID = r.ReservationID
JOIN 
    Seat s ON b.SeatID = s.SeatID;

DELIMITER ;

-- 5. View to Get Financial Summary (Total Revenue by Flight)
DELIMITER $$

CREATE VIEW FlightRevenueSummary AS
SELECT 
    f.FlightID,
    f.FlightNumber,
    f.Origin,
    f.Destination,
    SUM(r.TotalCost) AS TotalRevenue
FROM 
    Flight f
JOIN 
    Reservation r ON f.FlightID = r.FlightID
GROUP BY 
    f.FlightID;

DELIMITER ;

