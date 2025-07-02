# 📘 Entity-Relationship Diagram (ERD)

This document outlines the Entity-Relationship Diagram (ERD) for the Property Booking System database.

---

## 📦 Entities and Attributes

### 1. **User**
- `user_id` (PK)
- `name`
- `email`
- `password`
- `phone_number`
- `role` (guest | host)

### 2. **Property**
- `property_id` (PK)
- `user_id` (FK) → references `User.user_id`
- `title`
- `description`
- `address`
- `city`
- `price_per_night`
- `max_guests`

### 3. **Booking**
- `booking_id` (PK)
- `user_id` (FK) → references `User.user_id`
- `property_id` (FK) → references `Property.property_id`
- `check_in_date`
- `check_out_date`
- `total_price`
- `status` (e.g., confirmed, canceled)

### 4. **Review**
- `review_id` (PK)
- `user_id` (FK) → references `User.user_id`
- `property_id` (FK) → references `Property.property_id`
- `rating` (1–5)
- `comment`
- `created_at`

### 5. **Payment**
- `payment_id` (PK)
- `booking_id` (FK) → references `Booking.booking_id`
- `amount`
- `payment_date`
- `payment_method` (e.g., card, PayPal)

---

## 🔗 Relationships

| Relationship        | Type              | Description                                   |
|---------------------|-------------------|-----------------------------------------------|
| User → Booking      | One-to-Many       | A user (guest) can make many bookings         |
| User → Property     | One-to-Many       | A user (host) can own many properties         |
| Property → Booking  | One-to-Many       | A property can have many bookings             |
| Booking → Payment   | One-to-One        | Each booking has one payment                  |
| User ↔ Review       | One-to-Many       | A user can leave multiple reviews             |
| Property ↔ Review   | One-to-Many       | A property can receive multiple reviews       |

---

## 🗺️ ER Diagram

Below is a visual representation of the database relationships:

![image](https://github.com/user-attachments/assets/1295ba43-8450-48aa-9ff1-d8cde0195fbf)


---

## 🛠️ Tools Used

- **Draw.io** for ERD creation
- **Markdown** for documentation
- **Relational DBMS** (e.g., PostgreSQL, MySQL) assumed

---

## ✅ Next Steps

- [ ] Generate SQL migration scripts
- [ ] Implement schema in chosen DBMS
- [ ] Seed sample data for testing
