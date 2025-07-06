-- ===== database_index.sql =====

-- Create indexes on high-usage columns

-- User table indexes
CREATE INDEX idx_user_email ON users(email);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_booking_date ON bookings(booking_date);

-- Property table indexes
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_owner_id ON properties(owner_id);


-- ============================
-- Example queries for performance measurement
-- Run these BEFORE creating indexes to get baseline stats:

-- Example 1: Query bookings by a specific user ordered by date
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123
ORDER BY booking_date DESC;

-- Example 2: Join bookings with properties by property_id
EXPLAIN ANALYZE
SELECT b.*, p.*
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE p.location = 'Cape Town';

-- ============================
-- After running above, run CREATE INDEX statements, then rerun EXPLAIN ANALYZE on same queries.
