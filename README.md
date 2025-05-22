# Tourism management system
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

## 🎯 MIS Alignment

This business process supports the following MIS objectives:

- Real time Data : Instantly captures and processes bookings, payments, and customer info.

- Smart Decisions: Offers insights for better planning and service delivery.

- Fewer Errors: Automates tasks to reduce mistakes and boost reliability.

 ## 📌  Objectives

- Automate and simplify tour booking for tourists and agencies.

- Boost communication and customer satisfaction.

- Ensure secure and traceable payments.

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

## 📊 LOGICAL MODEL DESIGN (Phase )

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


 ## Pluggable Database Creation and Naming ( phase 4)
 
 📸 **Pluggable Database**

![Screenshot 2025-04-29 223818](https://github.com/user-attachments/assets/3650b06d-b829-4cde-896e-2e721cec6778)


## Database Creation and OEM Monitoring ( phase 5)
 

## 📸 Table Creation

<img width="559" alt="image" src="https://github.com/user-attachments/assets/fa37995f-a9a7-44e3-84e9-28bf37dc4f67" />

<img width="428" alt="image" src="https://github.com/user-attachments/assets/1da8f159-fc57-470e-93c9-788990c4f50b" />

![Screenshot 2025-04-29 225827](https://github.com/user-attachments/assets/8e93f061-4e58-44b1-8082-c41bfe0691f9)

## Data insertion

**Data inserted in tourist**

![Screenshot 2025-04-29 233043](https://github.com/user-attachments/assets/752b56ca-f5fa-4bf7-9768-876fff068e72)


**Data inserted in tour package**

![Screenshot 2025-04-29 233043](https://github.com/user-attachments/assets/3fb32ae0-3953-45ae-8c4a-af8aa35b79da)

 

![Screenshot 2025-04-29 231332](https://github.com/user-attachments/assets/6991ade0-8440-4040-a042-26e3bb35c67c)

![Screenshot 2025-04-29 231532](https://github.com/user-attachments/assets/bbe7ae15-d39c-48be-b8a4-879cac87fd1d)

![Screenshot 2025-04-29 231830](https://github.com/user-attachments/assets/ded0bd4c-244e-44b7-8237-f120164fdff8)













