# Tourism management system

This system will be used to manage tourism services,  including tour packages,  bookings, customer details  and payment transactions.

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
-- Description-- : Tourism Booking and Management Workflow
The process begins when a tourist submits a booking request for a tour package. The system then validates the request and checks the package availability. If the selected package is available, the booking is processed, and the system assigns the booking details. An invoice and confirmation are sent to the tourist. Upon receipt, the tourist proceeds with payment, and the booking is marked as confirmed. The MIS updates all records and notifies the tour operator for final review and coordination.

