-- ===========================
-- 👤 USERS
-- ===========================
INSERT INTO users (name, email, password, phone_number, role)
VALUES 
('Alice Johnson', 'alice@example.com', 'hashed_pwd_1', '1234567890', 'guest'),
('Bob Smith', 'bob@example.com', 'hashed_pwd_2', '0987654321', 'host'),
('Carol Danvers', 'carol@example.com', 'hashed_pwd_3', '1112223333', 'guest'),
('Daniel West', 'daniel@example.com', 'hashed_pwd_4', '2223334444', 'host');

-- ===========================
-- 🏠 PROPERTIES
-- ===========================
INSERT INTO properties (user_id, title, description, address, city, price_per_night, max_guests)
VALUES
(2, 'Cozy Cottage', 'A small, cozy cottage near the lake.', '123 Lake St', 'Cape Town', 1200.00, 4),
(4, 'Modern Apartment', 'A stylish apartment in the city center.', '456 City Rd', 'Johannesburg', 1800.00, 2),
(2, 'Beach House', 'A beautiful beachfront home with ocean views.', '789 Ocean Blvd', 'Durban', 2500.00, 6);

-- ===========================
-- 📅 BOOKINGS
-- ===========================
INSERT INTO bookings (user_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
(1, 1, '2025-07-05', '2025-07-10', 6000.00, 'confirmed'),
(3, 2, '2025-07-12', '2025-07-15', 5400.00, 'confirmed'),
(1, 3, '2025-08-01', '2025-08-05', 10000.00, 'pending');

-- ===========================
-- 💳 PAYMENTS
-- ===========================
INSERT INTO payments (booking_id, amount, payment_date, payment_method)
VALUES
(1, 6000.00, '2025-07-01 12:00:00', 'card'),
(2, 5400.00, '2025-07-10 09:30:00', 'paypal');

-- ===========================
-- 💬 REVIEWS
-- ===========================
INSERT INTO reviews (user_id, property_id, rating, comment, created_at)
VALUES
(1, 1, 5, 'Amazing place! Very cozy and peaceful.', '2025-07-11 08:00:00'),
(3, 2, 4, 'Great apartment, very clean and central.', '2025-07-16 10:30:00'),
(1, 3, 5, 'Best beach holiday ever!', '2025-08-06 11:00:00');
