-- Write your SQL code here

INSERT INTO Airline (AirlineID, AirlineName, IATA_Code) VALUES
(1, 'Kenya Airways', 'KQ101'),
(2, 'Jambojet', 'JM202'),
(3, 'Qatar', 'F540');

INSERT INTO Staff (UserID, FullName, Role) VALUES
(1, 'David Mwai', 'Pilot'),
(2, 'Joyce Wambui', 'Flight Attendant'),
(3, 'Peter Otieno', 'Ground Staff');

INSERT INTO Passenger (PassengerID, FullName, ContactInfo, DateOfBirth, Nationality) VALUES
(1, 'Wanjiru Njeri', 'wanjiru.njeri@example.com', '1990-05-15', 'Kenyan'),
(2, 'Kwame Adebayo', 'kwame.adebayo@example.com', '1985-03-22', 'Kenyan'),
(3, 'Nia Ndegwa', 'nia.ndegwa@example.com', '1992-07-30', 'Kenyan');

INSERT INTO Flight (FlightID, FlightNumber, DepartureTime, ArrivalTime, Origin, Destination) VALUES
(1, 'KQ101', '2024-12-01 08:00:00', '2024-12-01 10:00:00', 'Nairobi', 'Mombasa'),
(2, 'JM202', '2024-12-02 09:00:00', '2024-12-02 11:30:00', 'Nairobi', 'Kisumu'),
(3, 'Q540', '2024-12-03 07:30:00', '2024-12-03 09:00:00', 'Mombasa', 'Nairobi');

INSERT INTO Seat (SeatID, SeatNumber, Class, FlightID) VALUES
(1, '1A', 'First', 1),
(2, '2B', 'Business', 1),
(3, '3C', 'Economy', 1),
(4, '1A', 'First', 2),
(5, '2B', 'Business', 2),
(6, '3C', 'Economy', 2),
(7, '1A', 'First', 3),
(8, '2B', 'Business', 3),
(9, '3C', 'Economy', 3);

INSERT INTO Reservation (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost) VALUES
(1, 1, 1, '2024-11-01 10:00:00', 7000.00),
(2, 2, 2, '2024-11-02 11:00:00', 5000.00),
(3, 3, 3, '2024-11-03 09:30:00', 6500.00);

INSERT INTO Booking (BookingID, ReservationID, SeatID, BaggageAllowance, MealPreference) VALUES
(1, 1, 1, 2, 'Vegetarian'),
(2, 2, 4, 1, 'Non-Vegetarian'),
(3, 3, 7, 2, 'Vegan');

INSERT INTO User (UserID, Email, PhoneNumber, Role) VALUES
(1, 'admin@kenyaairways.com', '+254701234567', 'Admin'),
(2, 'customer1@jambojet.com', '+254712345678', 'Customer'),
(3, 'customer2@qatar.com', '+254798765432', 'Customer');
