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

## Logical Flow Highlights:

- Clear start and end points.

- Decision gateway: "Is Tour Package Selected?"

- System updates bookings and triggers payment processing.

- Notifications are sent to both tourists and tour operators.

- Tour operators review bookings and update availability.

  ## Key Interactions
  
- Tourist sends booking request.

- System alerts and updates status.

- Operator confirms with Transport Provider.

- System logs and notifies Agency.

🖼  **BPMN Diagram**

 ![bpmn diagram drawio](https://github.com/user-attachments/assets/05be22a5-d3ec-4565-9dd7-1e4ce8d389fc)

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

-DEFAULT: Status fields can default to `'Pending'`

## 🧠 Normalization Checks

- 1NF: Atomic values, no repeating groups
  
- 2NF: All non-PK fields fully dependent on entire PK

- 3NF: No transitive dependencies





## 📸 Screenshots

**Pluggable Database**

![Screenshot 2025-04-29 223818](https://github.com/user-attachments/assets/3650b06d-b829-4cde-896e-2e721cec6778)






