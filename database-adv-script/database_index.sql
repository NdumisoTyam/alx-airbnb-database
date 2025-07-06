-- database-adv-script/database_index.sql

-- Indexes for users table
CREATE INDEX idx_users_email ON users(email);

-- Indexes for bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);

-- Indexes for properties table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_owner_id ON properties(owner_id);

-- Example 1: Filter bookings by user and order by date
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 101
ORDER BY booking_date DESC;

-- Example 2: Join bookings with properties filtered by location
EXPLAIN ANALYZE
SELECT b.*, p.*
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'Cape Town';

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 101
ORDER BY booking_date DESC;

EXPLAIN ANALYZE
SELECT b.*, p.*
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'Cape Town';
