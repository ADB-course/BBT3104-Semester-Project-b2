-- Write your SQL code here

-- 1. History Table for the Reservation Table
CREATE TABLE ReservationHistory (
    ReservationHistoryID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT,
    FlightID INT,
    PassengerID INT,
    ReservationDate TIMESTAMP,
    TotalCost DECIMAL(10, 2),
    ChangeType VARCHAR(20), 
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;


-- 2. Temporal Trigger for INSERT on the Reservation Table
DELIMITER $$

CREATE TRIGGER insert_reservation_history
AFTER INSERT ON Reservation
FOR EACH ROW
BEGIN
    INSERT INTO ReservationHistory (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost, ChangeType)
    VALUES (NEW.ReservationID, NEW.FlightID, NEW.PassengerID, NEW.ReservationDate, NEW.TotalCost, 'INSERT');
END $$

DELIMITER ;


-- 3. Temporal Trigger for UPDATE on the Reservation Table
DELIMITER $$

CREATE TRIGGER update_reservation_history
BEFORE UPDATE ON Reservation
FOR EACH ROW
BEGIN
    INSERT INTO ReservationHistory (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost, ChangeType)
    VALUES (OLD.ReservationID, OLD.FlightID, OLD.PassengerID, OLD.ReservationDate, OLD.TotalCost, 'UPDATE');
END $$

DELIMITER ;


-- 4. Temporal Trigger for DELETE on the Reservation Table
DELIMITER $$

CREATE TRIGGER delete_reservation_history
AFTER DELETE ON Reservation
FOR EACH ROW
BEGIN
    INSERT INTO ReservationHistory (ReservationID, FlightID, PassengerID, ReservationDate, TotalCost, ChangeType)
    VALUES (OLD.ReservationID, OLD.FlightID, OLD.PassengerID, OLD.ReservationDate, OLD.TotalCost, 'DELETE');
END $$

DELIMITER ;

 