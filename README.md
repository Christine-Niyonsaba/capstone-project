# Tourism Management System
**- Name:** Niyonsaba christine

**- ID:** 27796

## 📇 Introduction
 
This system will be used to manage tourism services,  including tour packages,  bookings, customer details  and payment transactions.
It helps travel agencies and tourists by improving service delivery and ensuring a smooth travel experience.

---

## 🔍 Problem Definition:

The tourism industry face challenges in managing tour packages, bookings, customer data, leading to booking errors, payment errors.
This system will be used in:
- Tour planning and management
- Tourist attraction listings and bookings
---
### 🎯 Target users: 
- Tourists, 
- Travel agencies, 
-  Tour operators and transport providers.
  ---
### 🗞️ Outcomes expected:
- Enhances tourist experience and satisfaction
- Centralized Information Management for tourism services
- Enhance communication
  
  ---
### 📎Objectives:

- Security and Data Privacy
- Sustainable Tourism Development
  
  ---
## 🧩 Main entities:
- Tourists(ID, Name, Phone, Email, Nationality)
- Tour packages(ID, Name, price, Duration)
- Payments(ID, Booking ID, Amount, Payment status)
- Bookings (ID, Tourist ID, Package ID, Date, Payment status)

---
## 🖇️ Relationships:
- Tourist can book multiple tour
- Tour package can have multiple bookings
- Bookings are linked to a single tourist
- Payments are made for booking
- Benefits solution:
- Improved Security and Fraud Prevention 
- Time saving and efficiency
  
---

## 🗃️ Business Process Model (Phase 2)
# Description: Tourism Booking and Management Workflow
The process begins when a tourist submits a booking request for a tour package. The system then validates the request and checks the package availability. If the selected package is available, the booking is processed, and the system assigns the booking details. An invoice and confirmation are sent to the tourist. Upon receipt, the tourist proceeds with payment, and the booking is marked as confirmed. The MIS updates all records and notifies the tour operator for final review and coordination.

---

## 🎯 MIS Alignment

This business process supports the following MIS objectives:

- Real time Data : Instantly captures and processes bookings, payments, and customer info.

- Smart Decisions: Offers insights for better planning and service delivery.

- Fewer Errors: Automates tasks to reduce mistakes and boost reliability.

---

 ## 📌  Objectives

- Automate and simplify tour booking for tourists and agencies.

- Boost communication and customer satisfaction.

- Ensure secure and traceable payments.

---

## ✅ Expected Outcomes

- Quick, clear tourist-provider communication.

- Ensure secure and traceable payments.

- Enable real-time reports and feedback for planning.

## 🔄 Interaction Summary

- Tourist sends booking request.

- System alerts and updates status.

- Operator confirms with Transport Provider.

- System logs and notifies Agency.

## 💡 Logical Flow Highlights:

- Clear start and end points.

- Decision gateway: "Is Tour Package Selected?"

- System updates bookings and triggers payment processing.

- Notifications are sent to both tourists and tour operators.

- Tour operators review bookings and update availability.

 
🖼  **BPMN Diagram**

 ![bpmn diagram drawio](https://github.com/user-attachments/assets/05be22a5-d3ec-4565-9dd7-1e4ce8d389fc)

---

## 📊 LOGICAL MODEL DESIGN (Phase 3 )

 ## ⬇️ Entities & Attributes  
 
**1.	Tourist:**

-	`Tourist_ID` (INT PK, NOT NULL)

-	`Name` (VARCHAR(100), NOT NULL)

-	`Phone` (Varchar(20), NOT NULL)

-	`Email` (Varchar(100), NOT NULL)

-	`Nationality` (Varchar(50), NOT NULL)

**2.	Tour Package:**

-	`Package_ID`	(INT	PK, NOT NULL)

- `Name`	(VARCHAR(100),	NOT NULL)

- `Price`	(DECIMAL(10,2);	NOT NULL)

- `Duration`	(INT,	NOT NULL)

 **3.  BookingS**

- `Booking_ID`	(INT	PK, NOT NULL)
  
- `Tourist_ID`	(INT	FK → Tourist.Tourist_ID)
  
- `Package_ID`	(INT	FK → TourPackage.Package_ID)
  
- `Booking_Date` (DATE	NOT NULL)
  
- `Payment_Status` (VARCHAR(20)	CHECK `(IN 'Pending', 'Paid', 'Failed')`, DEFAULT `Pending`)
  

 **4. Payment**

- `Payment_ID`	(INT	PK, NOT NULL)
  
- `Booking_ID`	(INT	FK → Booking.Booking_ID)
  
-  `Amount` 	(DECIMAL(10,2)	NOT NULL)
  
- `Payment_Status`	(VARCHAR(20)	CHECK `(IN 'Success', 'Failure', 'Pending')`, DEFAULT `Pending`)
  
- `Payment_Date`	(DATE,	NOT NULL)

---

 ## 🔁  Relationships & Constraints

 ## 🔗 Relationships

- **Tourist → Booking**:	One-to-Many	A tourist can make many bookings
  
- **Package → Booking**:	One-to-Many	A package can be booked multiple times
  
- **Booking → Payment** 	One-to-One	One booking = One payment

## ⚖️ Constraints

- NOT NULL: All primary keys, and required fields like `Name`, `Email`, `Amount`, etc.

- UNIQUE: Email in `Tourist`

- CHECK: For enumerated fields like `Payment_Status`

- DEFAULT: Status fields can default to `'Pending'`

## 🧠 Normalization Checks

- 1NF: Atomic values, no repeating groups
  
- 2NF: All non-PK fields fully dependent on entire PK

- 3NF: No transitive dependencies

## 🌍  Real-World Data Handling Scenarios

- **Multiple Bookings**: A tourist can make multiple bookings, tracked via the Tourist-Booking relationship.

- **Payment Failures**: Payment_Status tracks payment issues and retries.

- **Tour Availability**: The Booking table tracks tourists for each package to avoid overbooking.

 ## 📘 SUmmary

The model helps track tourist activities, manage bookings and payments accurately, and streamline operations between all parties involved. It sets the groundwork for a reliable, future-ready system that improves efficiency and enhances the visitor experience.

##  📸 logic model
![Screenshot 2025-05-07 182524](https://github.com/user-attachments/assets/5cb39a16-ef5c-44cb-bd31-afb805bdcf2c)

## ER DIAGRAM

![Database ER diagram (crow's foot)](https://github.com/user-attachments/assets/888af900-4185-4e1b-8887-0131dae23613)


---

 ## 🔯 Pluggable Database Creation and OEM Monitoring ( phase 4)
 
 📸 **Pluggable Database**

![Screenshot 2025-04-29 223818](https://github.com/user-attachments/assets/3650b06d-b829-4cde-896e-2e721cec6778)

 📸 **OEM**

 ![Screenshot 2025-05-23 123908](https://github.com/user-attachments/assets/060752b5-1929-433f-ae22-0586f352946d)

 ![Screenshot 2025-05-23 123949](https://github.com/user-attachments/assets/25260761-fe4b-477b-9661-6c52ef1caf75)

---

## 🎨 Table Creation and Data insertion ( phase 5) 

## 📸 Table Creation

<img width="559" alt="image" src="https://github.com/user-attachments/assets/fa37995f-a9a7-44e3-84e9-28bf37dc4f67" />

<img width="428" alt="image" src="https://github.com/user-attachments/assets/1da8f159-fc57-470e-93c9-788990c4f50b" />

![Screenshot 2025-04-29 225827](https://github.com/user-attachments/assets/8e93f061-4e58-44b1-8082-c41bfe0691f9)

## Data insertion

Data inserted in tourist

![Screenshot 2025-04-29 233043](https://github.com/user-attachments/assets/752b56ca-f5fa-4bf7-9768-876fff068e72)


Data inserted in tour package

![Screenshot 2025-04-29 233043](https://github.com/user-attachments/assets/3fb32ae0-3953-45ae-8c4a-af8aa35b79da)

 Data inserted in bookings

![Screenshot 2025-05-22 210420](https://github.com/user-attachments/assets/915dcf11-9669-478b-808d-f348058eba2b)

Data inserted in payment

![Screenshot 2025-04-29 231830](https://github.com/user-attachments/assets/ded0bd4c-244e-44b7-8237-f120164fdff8)
![Screenshot 2025-05-22 210555](https://github.com/user-attachments/assets/2160c81b-7b54-4749-96f1-e81e5a1f4566)


## ⚓ Database Interaction and Transactions (phase 6)  

**1. DDL and DML**
**DDL:**
All main tables (Tourist, Tour Package, Booking, Payment) were successfully created using SQL CREATE TABLE statements. Each table includes the necessary primary and foreign keys to maintain relational integrity and enforce constraints.

**DML:**
Sample INSERT, UPDATE, and DELETE operations were performed and tested on all major tables. These operations were used to simulate real-world data interactions such as booking a tour, updating payment statuses, and removing test records.

📸 **screenshots**:

![Screenshot 2025-05-05 165642](https://github.com/user-attachments/assets/1e11c7b2-a85f-4b41-837c-75cd09e878ca)

![Screenshot 2025-05-05 171201](https://github.com/user-attachments/assets/486feb8c-2592-439d-bacb-e0f98b09a555)

![Screenshot 2025-05-05 171612](https://github.com/user-attachments/assets/af5e231d-e83a-45d6-86a3-b250871c0a58)

![Screenshot 2025-05-05 171612](https://github.com/user-attachments/assets/bc2c93c8-65ba-4dbc-a9de-dd5931e59638)

![Screenshot 2025-05-05 172239](https://github.com/user-attachments/assets/efc6ff71-7749-483d-92c6-7af2610eabc6)

---

## SQL Procedure Bookings

```sql
CREATE OR REPLACE PROCEDURE Get_Bookings_By_Tourist (
    p_Tourist_ID IN NUMBER
)
IS
    v_total_bookings NUMBER := 0;
BEGIN
    -- First, count total bookings
    SELECT COUNT(*)
    INTO v_total_bookings
    FROM Bookings
    WHERE Tourist_ID = p_Tourist_ID;

    DBMS_OUTPUT.PUT_LINE('Total Bookings: ' || v_total_bookings);

    -- Then, display booking details
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
```
📷

<img width="503" alt="image" src="https://github.com/user-attachments/assets/477c8113-64b8-4e24-8bb3-646d537fa2f9" />

## SQL Function:

```sql

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
```
📷 

![Screenshot 2025-05-05 174416](https://github.com/user-attachments/assets/706325d6-b343-48dd-b3d1-1929c0b54b78)


## SQL Package

```sql
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

```
📷

![Screenshot 2025-05-05 175227](https://github.com/user-attachments/assets/4a738807-3bb2-432f-ad29-0c8b448cff51)

---
**Phase 7: Triggers, Auditing, and Security Controls**

## 📌 Problem Statement

In the tourism management system, staff making changes to data during restricted times (like weekends and public holidays) can put data accuracy, security, and rules at risk. This might lead to fake bookings, wrong information, and policy violations.

**1. Holiday Reference Table**

```sql

CREATE TABLE Public_Holidays (
    Holiday_Date DATE PRIMARY KEY,
    Description VARCHAR2(100)
);

```
![Screenshot 2025-05-05 214525](https://github.com/user-attachments/assets/64c1f78b-234f-49ba-9515-b73885758439)

**insertion of public holidays**

![Screenshot 2025-05-05 215233](https://github.com/user-attachments/assets/a1b5d709-caa5-4fc3-96a3-9869f627e7a2)

## TRIGGER CREATION

![Screenshot 2025-05-07 174244](https://github.com/user-attachments/assets/ef676d6a-1c59-4ab7-87ba-30f94fcebd74)

## Auditing Table

```sql
CREATE TABLE Audit_Log (
    Audit_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    User_ID VARCHAR2(50),
    Action_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Table_Name VARCHAR2(50),
    Operation VARCHAR2(20),
    Status VARCHAR2(20),
    Error_Message VARCHAR2(200)
);

```

![Screenshot 2025-05-07 174758](https://github.com/user-attachments/assets/399dd591-cfe5-4e42-9b28-f93f5cc22798)

## 📦 Create a Logging Package

![Screenshot 2025-05-07 174932](https://github.com/user-attachments/assets/c7fbaddd-f472-43fa-8e0b-14c8369e6cc5)


## ⚠️ Compound Trigger with Auditing

![image](https://github.com/user-attachments/assets/eb413866-7908-402b-ac1c-827036dce44d)























