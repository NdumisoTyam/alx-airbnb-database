SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.check_out_date,
    bookings.total_price,
    bookings.status,
    users.user_id,
    users.name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
ORDER BY bookings.booking_id;

SELECT 
    properties.property_id,
    properties.title,
    properties.city,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY properties.property_id;

-- Using FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user.
-- NOTE: MySQL does not support FULL OUTER JOIN directly,
-- so we simulate it using LEFT JOIN + UNION

-- Equivalent to:
-- SELECT * FROM users
-- FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;

(
  SELECT 
    users.user_id,
    users.name,
    users.email,
    bookings.booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.total_price
  FROM users
  LEFT JOIN bookings ON users.user_id = bookings.user_id
)
UNION
(
  SELECT 
    users.user_id,
    users.name,
    users.email,
    bookings.booking_id,
    bookings.property_id,
    bookings.check_in_date,
    bookings.total_price
  FROM bookings
  LEFT JOIN users ON users.user_id = bookings.user_id
)
ORDER BY user_id;


