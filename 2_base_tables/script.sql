-- Write your SQL code here

CREATE DATABASE AirlineReservationSystem;

USE AirlineReservationSystem;

CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    FlightID INT NOT NULL,
    PassengerID INT NOT NULL,
    ReservationDate TIMESTAMP NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(20) NOT NULL,
    DepartureTime TIMESTAMP NOT NULL,
    ArrivalTime TIMESTAMP NOT NULL,
    Origin VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL
) ENGINE = MyISAM;

CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    Role VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100),
    DateOfBirth DATE,
    Nationality VARCHAR(50)
) ENGINE = InnoDB;

CREATE TABLE Staff (
    UserID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY,
    AirlineName VARCHAR(50) NOT NULL,
    IATA_Code VARCHAR(10) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Seat (
    SeatID INT PRIMARY KEY,
    SeatNumber VARCHAR(10) NOT NULL,
    Class VARCHAR(20) NOT NULL,
    FlightID INT NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    ReservationID INT NOT NULL,
    SeatID INT NOT NULL,
    BaggageAllowance INT,
    MealPreference VARCHAR(50)
) ENGINE = InnoDB;
