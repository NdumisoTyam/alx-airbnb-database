SELECT 
    users.user_id,
    users.name,
    COUNT(bookings.booking_id) AS total_bookings
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id
GROUP BY users.user_id, users.name
ORDER BY total_bookings DESC;

SELECT 
    property_id,
    COUNT(booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS booking_rank
FROM bookings
GROUP BY property_id
ORDER BY booking_rank;
