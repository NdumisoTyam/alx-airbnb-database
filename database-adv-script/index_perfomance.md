-- For User table
CREATE INDEX idx_user_email ON users(email);

-- For Booking table
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);
CREATE INDEX idx_booking_booking_date ON bookings(booking_date);

-- For Property table
CREATE INDEX idx_property_location ON properties(location);
CREATE INDEX idx_property_owner_id ON properties(owner_id);

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 123
ORDER BY booking_date DESC;
