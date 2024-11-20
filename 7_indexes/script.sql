-- Write your SQL code here

-- 1. Basic Index
CREATE INDEX idx_reservation_flight_id
ON Reservation (FlightID);

-- 2. Unique Index
CREATE UNIQUE INDEX idx_user_email
ON User (Email);

-- 3. Composite Index
CREATE INDEX idx_reservation_passenger_flight
ON Reservation (PassengerID, FlightID);

-- 4. Full-text Index
CREATE FULLTEXT INDEX idx_passenger_full_name
ON Passenger (FullName);

-- 5. Spatial Index
CREATE SPATIAL INDEX idx_seat_location
ON Seat (SeatLocation);

-- 6. Primary Key Index
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(20) NOT NULL
);

-- 7. Foreign Key Index
CREATE INDEX idx_reservation_passenger_id
ON Reservation (PassengerID);
