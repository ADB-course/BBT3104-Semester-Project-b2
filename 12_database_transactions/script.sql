-- Write your SQL code here

-- 1.  Reserve a Seat and Create a Booking
DELIMITER $$

START TRANSACTION;

INSERT INTO Reservation (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost)
VALUES (1001, 101, 2001, '2024-11-20 10:00:00', 15000);

UPDATE Seat
SET SeatID = SeatID
WHERE FlightID = 101 AND SeatID NOT IN (
    SELECT SeatID FROM Booking WHERE FlightID = 101
) LIMIT 1;

INSERT INTO Booking (BookingID, ReservationID, SeatID, BaggageAllowance, MealPreference)
VALUES (5001, 1001, LAST_INSERT_ID(), 20, 'Vegetarian');

COMMIT;

DELIMITER ;

-- 2. Cancel a Reservation and Refund Payment
DELIMITER $$

START TRANSACTION;

DELETE FROM Reservation
WHERE ReservationID = 1001 AND PassengerID = 2001;

UPDATE Seat
SET SeatID = SeatID
WHERE FlightID = 101 AND SeatID NOT IN (
    SELECT SeatID FROM Booking WHERE FlightID = 101
) LIMIT 1;

UPDATE BankAccount
SET Balance = Balance + 15000
WHERE AccountID = 2001;

COMMIT;

DELIMITER ;

-- 3. Flight Booking with Payment Processing
DELIMITER $$

START TRANSACTION;

INSERT INTO Reservation (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost)
VALUES (1002, 102, 2002, '2024-11-20 15:00:00', 12000);

UPDATE BankAccount
SET Balance = Balance - 12000
WHERE AccountID = 2002 AND Balance >= 12000;

INSERT INTO Booking (BookingID, ReservationID, SeatID, BaggageAllowance, MealPreference)
VALUES (5002, 1002, LAST_INSERT_ID(), 30, 'Non-Vegetarian');

COMMIT;

DELIMITER ;

-- 4. Handling Multiple Bookings for a Flight
DELIMITER $$

START TRANSACTION;

INSERT INTO Reservation (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost)
VALUES (1003, 103, 2003, '2024-11-21 09:00:00', 24000);

INSERT INTO Booking (BookingID, ReservationID, SeatID, BaggageAllowance, MealPreference)
VALUES
    (5003, 1003, 10, 30, 'Vegetarian'),
    (5004, 1003, 11, 30, 'Non-Vegetarian');

COMMIT;

DELIMITER ;





