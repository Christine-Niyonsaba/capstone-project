CREATE PLUGGABLE DATABASE thu_27796_christine_tourismManagementSystem_db
ADMIN USER thu_27796 IDENTIFIED BY christine
FILE_NAME_CONVERT = ('C:\ORACLE19C\ORADATA\ORCL\PDBSEED\','C:\ORACLE19C\ORADATA\ORCL\thu_27796_christine_tourismManagementSystem_db\'); 


-- Table: TOURISTS
CREATE TABLE Tourists (
    Tourist_ID INT PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(20) NOT NULL,
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Nationality VARCHAR2(50) NOT NULL
);

-- Table: TOUR_PACKAGES
CREATE TABLE Tour_Packages (
    Package_ID INT PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    Duration INT NOT NULL CHECK (Duration > 0) -- Duration in days
);

-- Table: BOOKINGS
CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY,
    Tourist_ID INT NOT NULL,
    Package_ID INT NOT NULL,
    Booking_Date DATE NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL CHECK (Payment_Status IN ('Pending', 'Paid', 'Failed')),
    CONSTRAINT fk_booking_tourist FOREIGN KEY (Tourist_ID) REFERENCES Tourists(Tourist_ID),
    CONSTRAINT fk_booking_package FOREIGN KEY (Package_ID) REFERENCES Tour_Packages(Package_ID)
);

-- Table: PAYMENTS
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount >= 0),
    Payment_Status VARCHAR2(20) NOT NULL CHECK (Payment_Status IN ('Pending', 'Paid', 'Failed')),
    Payment_Date DATE NOT NULL,
    CONSTRAINT fk_payment_booking FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID)
);


-- Insert Tourists
INSERT INTO Tourists VALUES (1, 'Ali', '1234567890', 'ali@example.com', 'Pakistan');
INSERT INTO Tourists VALUES (2, 'joe', '2345678901', 'joe@example.com', 'UAE');
INSERT INTO Tourists VALUES (3, 'John', '3456789012', 'john@example.com', 'USA');

-- Insert Tour Packages
INSERT INTO Tour_Packages VALUES (1, 'Dubai Desert Safari', 250.00, 1);
INSERT INTO Tour_Packages VALUES (2, 'Islamabad City Tour', 100.00, 1);
INSERT INTO Tour_Packages VALUES (3, 'Hunza Valley Adventure', 500.00, 3);

-- Insert Bookings
INSERT INTO Bookings VALUES (101, 1, 1, TO_DATE('2025-05-01', 'YYYY-MM-DD'), 'Paid');
INSERT INTO Bookings VALUES (102, 2, 2, TO_DATE('2025-05-03', 'YYYY-MM-DD'), 'Pending');
INSERT INTO Bookings VALUES (103, 3, 3, TO_DATE('2025-05-04', 'YYYY-MM-DD'), 'Paid');
INSERT INTO Bookings VALUES (104, 1, 2, TO_DATE('2025-05-05', 'YYYY-MM-DD'), 'Failed');

-- Insert Payments
INSERT INTO Payments VALUES (201, 101, 250.00, 'Paid', TO_DATE('2025-05-01', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (202, 103, 500.00, 'Paid', TO_DATE('2025-05-04', 'YYYY-MM-DD'));

COMMIT;


SELECT * FROM Tourists;

SELECT * FROM Tour_Packages;

SELECT 
    B.Booking_ID,
    T.Name AS Tourist_Name,
    P.Name AS Package_Name,
    B.Booking_Date,
    B.Payment_Status
FROM Bookings B
JOIN Tourists T ON B.Tourist_ID = T.Tourist_ID
JOIN Tour_Packages P ON B.Package_ID = P.Package_ID;


SELECT 
    Pay.Payment_ID,
    T.Name AS Tourist_Name,
    Pkg.Name AS Package_Name,
    Pay.Amount,
    Pay.Payment_Status,
    Pay.Payment_Date
FROM Payments Pay
JOIN Bookings B ON Pay.Booking_ID = B.Booking_ID
JOIN Tourists T ON B.Tourist_ID = T.Tourist_ID
JOIN Tour_Packages Pkg ON B.Package_ID = Pkg.Package_ID;

SELECT * FROM Bookings
WHERE Booking_ID NOT IN (SELECT Booking_ID FROM Payments);

SELECT T.Name, COUNT(B.Booking_ID) AS Total_Bookings
FROM Tourists T
LEFT JOIN Bookings B ON T.Tourist_ID = B.Tourist_ID
GROUP BY T.Name;

-- Insert a new tourist
INSERT INTO Tourists (Tourist_ID, Name, Phone, Email, Nationality)
VALUES (8, 'Carlos Mendoza', '555-123-9876', 'carlos.mendoza@example.com', 'Mexico');


 
 
 
 
 
 
 
 
 
 
 
-- Update payment status
UPDATE Payments
SET Payment_Status = 'Failed', 
    Payment_Date = TO_DATE('2025-05-05', 'YYYY-MM-DD')  -- New payment date
WHERE Payment_ID = 202;


-- Delete a booking (and cascading payment if ON DELETE CASCADE is used)
DELETE FROM Bookings
WHERE Booking_ID = 104;


-- Alter table to add a new column for remarks
ALTER TABLE Bookings ADD Remarks VARCHAR2(200);

-- Drop column from table
ALTER TABLE Booking DROP COLUMN Remarks;

-- Drop unused test table
DROP TABLE Temp_Test;


--procedure

CREATE OR REPLACE PROCEDURE Get_Bookings_By_Tourist (
    p_Tourist_ID IN NUMBER
)
IS
BEGIN
    FOR rec IN (
        SELECT B.Booking_ID, P.Name AS Package_Name, B.Booking_Date, PMT.Payment_Status
        FROM Bookings B
        JOIN Tour_Package P ON B.Package_ID = P.Package_ID
        LEFT JOIN Payments PMT ON B.Booking_ID = PMT.Booking_ID
        WHERE B.Tourist_ID = p_Tourist_ID
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Booking: ' || rec.Booking_ID || ', Package: ' || rec.Package_Name || 
                             ', Date: ' || TO_CHAR(rec.Booking_Date, 'YYYY-MM-DD') || 
                             ', Status: ' || rec.Payment_Status);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

--funtion

CREATE OR REPLACE FUNCTION Get_Total_Payment (
    p_Booking_ID IN NUMBER
) RETURN NUMBER
IS
    v_total NUMBER;
BEGIN
    SELECT Amount INTO v_total
    FROM Payment
    WHERE Booking_ID = p_Booking_ID;
    
    RETURN v_total;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1;
END;

DECLARE
    CURSOR cur_Tourists IS
        SELECT Name, Nationality FROM Tourist;
BEGIN
    FOR rec IN cur_Tourists LOOP
        DBMS_OUTPUT.PUT_LINE('Tourist: ' || rec.Name || ', Nationality: ' || rec.Nationality);
    END LOOP;
END;
/

--package

CREATE OR REPLACE PACKAGE BODY Booking_Pkg AS

    PROCEDURE Get_Bookings_By_Tourist(p_Tourist_ID IN NUMBER) IS
    BEGIN
        FOR rec IN (
            SELECT B.Booking_ID, P.Name AS Package_Name, B.Booking_Date, B.Payment_Status
            FROM Booking B
            JOIN Tour_Package P ON B.Package_ID = P.Package_ID
            WHERE B.Tourist_ID = p_Tourist_ID
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Booking: ' || rec.Booking_ID || ', Package: ' || rec.Package_Name);
        END LOOP;
    END;
    
    
    CREATE TABLE Public_Holidays (
    Holiday_Date DATE PRIMARY KEY,
    Description VARCHAR2(100)
);

INSERT INTO Public_Holidays VALUES (TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Independence Day');
-- Adjusted second date
INSERT INTO Public_Holidays VALUES (TO_DATE('2025-07-04', 'YYYY-MM-DD'), 'Liberation Day');


-- TRIGGER

CREATE OR REPLACE TRIGGER trg_prevent_booking_on_holiday
BEFORE INSERT ON Bookings
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Public_Holidays
    WHERE Holiday_Date = :NEW.Booking_Date;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Booking not allowed on public holidays.');
    END IF;
END;

--TABLE AUDIT

CREATE TABLE Audit_Log (
    Audit_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    User_ID VARCHAR2(50),
    Action_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Table_Name VARCHAR2(50),
    Operation VARCHAR2(20),
    Status VARCHAR2(20),
    Error_Message VARCHAR2(200)
);


CREATE OR REPLACE PACKAGE Audit_Pkg AS
    PROCEDURE Log_Audit(p_user_id VARCHAR2, p_table_name VARCHAR2, p_operation VARCHAR2, p_status VARCHAR2, p_error VARCHAR2);
END Audit_Pkg;
/


--compound trigger

CREATE OR REPLACE TRIGGER Audit_Payment_Changes
FOR INSERT OR UPDATE OR DELETE ON Payment
COMPOUND TRIGGER

    v_status VARCHAR2(20);
    v_error VARCHAR2(200);

AFTER EACH ROW IS
BEGIN
    BEGIN
        -- Log successful operation
        v_status := 'Allowed';
        v_error := NULL;

        Audit_Pkg.Log_Audit(
            p_user_id => SYS_CONTEXT('USERENV', 'SESSION_USER'),
            p_table_name => 'Payment',
            p_operation => CASE
                            WHEN INSERTING THEN 'INSERT'
                            WHEN UPDATING THEN 'UPDATE'
                            WHEN DELETING THEN 'DELETE'
                          END,
            p_status => v_status,
            p_error => v_error
        );

    EXCEPTION
        WHEN OTHERS THEN
            -- Log failed operation
            v_status := 'Denied';
            v_error := SQLERRM;

            Audit_Pkg.Log_Audit(
                p_user_id => SYS_CONTEXT('USERENV', 'SESSION_USER'),
                p_table_name => 'Payment',
                p_operation => CASE
                                WHEN INSERTING THEN 'INSERT'
                                WHEN UPDATING THEN 'UPDATE'
                                WHEN DELETING THEN 'DELETE'
                              END,
                p_status => v_status,
                p_error => v_error
            );
    END;
END AFTER EACH ROW;

END Audit_Payment_Changes;
/


