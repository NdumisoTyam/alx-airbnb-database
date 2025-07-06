-- 1. Rename existing bookings table (backup)
ALTER TABLE bookings RENAME TO bookings_old;

-- 2. Create a new partitioned bookings table
CREATE TABLE bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  booking_date TIMESTAMP NOT NULL,
  -- other columns...
) PARTITION BY RANGE (start_date);

-- 3. Create partitions by year (example: 2023, 2024, 2025)
CREATE TABLE bookings_2023 PARTITION OF bookings
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Migrate data from old table to new partitioned table
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, booking_date)
SELECT booking_id, user_id, property_id, start_date, end_date, booking_date
FROM bookings_old;

-- 5. After verification, drop old table if needed
-- DROP TABLE bookings_old;

EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date >= '2024-01-01' AND start_date < '2024-07-01';
