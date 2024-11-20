-- Write your SQL code here

-- 1. Check constraint for the TotalCost column in the Reservation table
ALTER TABLE Reservation
ADD CONSTRAINT chk_total_cost CHECK (TotalCost >= 0);


-- 2. Check constraint for the Class column in the Seat table
ALTER TABLE Seat
ADD CONSTRAINT chk_seat_class CHECK (Class IN ('Economy', 'Business', 'First Class'));


-- 3. Check constraint for the DateOfBirth column in the Passenger table
ALTER TABLE Passenger
ADD CONSTRAINT chk_date_of_birth CHECK (DateOfBirth <= CURDATE());

-- 4. Check constraint for the PhoneNumber column in the User table
ALTER TABLE User
ADD CONSTRAINT chk_phone_number CHECK (PhoneNumber REGEXP '^[0-9]{10}$');

-- 5. Check constraint for the FlightNumber column in the Flight table
ALTER TABLE Flight
ADD CONSTRAINT chk_flight_number CHECK (FlightNumber REGEXP '^[A-Za-z]{2}[0-9]+$');
