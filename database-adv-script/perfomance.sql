SELECT 
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.name AS user_name,
  u.email AS user_email,
  p.property_id,
  p.title AS property_title,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.name AS user_name,
  u.email AS user_email,
  p.property_id,
  p.title AS property_title,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;

SELECT 
  b.booking_id,
  b.booking_date,
  u.user_id,
  u.name AS user_name,
  u.email AS user_email,
  p.property_id,
  p.title AS property_title,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id
WHERE b.booking_date >= CURRENT_DATE - INTERVAL '1 year'
  AND pay.amount > 0;


CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
