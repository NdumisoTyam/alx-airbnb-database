# Index Performance Improvement

## Objective
Identify and create indexes on high-usage columns in Users, Bookings, and Properties tables to improve query performance.

---

## High-Usage Columns Identified
- **Users**: `email`
- **Bookings**: `user_id`, `property_id`, `booking_date`
- **Properties**: `location`, `owner_id`

---

## Index Creation Commands

```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_owner_id ON properties(owner_id);
