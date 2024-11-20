-- Write your SQL code here

-- 1. InnoDB
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    FlightID INT NOT NULL,
    PassengerID INT NOT NULL,
    ReservationDate TIMESTAMP NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL
) ENGINE = InnoDB;


-- 2. MyISAM
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(20) NOT NULL,
    DepartureTime TIMESTAMP NOT NULL,
    ArrivalTime TIMESTAMP NOT NULL,
    Origin VARCHAR(50) NOT NULL,
    Destination VARCHAR(50) NOT NULL
) ENGINE = MyISAM;

-- 3. MEMORY (HEAP)
CREATE TABLE TempTable (
    TempID INT PRIMARY KEY,
    TempData VARCHAR(100)
) ENGINE = MEMORY;

-- 4. CSV
CREATE TABLE CsvData (
    ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
) ENGINE = CSV;

-- 5. ARCHIVE
CREATE TABLE ArchiveData (
    ID INT PRIMARY KEY,
    Data TEXT
) ENGINE = ARCHIVE;


