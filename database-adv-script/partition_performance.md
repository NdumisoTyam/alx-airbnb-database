# Partitioning Performance Report

## Objective
Partition the bookings table by start_date to improve query performance on large datasets.

## Implementation
- Created a range partitioned table by year on the start_date column.
- Migrated existing data into year-based partitions.

## Testing
Tested queries fetching bookings by date range showed:
- Significant reduction in query execution time.
- Query planner used partition pruning to scan only relevant partitions.
- Reduced I/O and faster response for date-range queries.

## Conclusion
Partitioning by start_date optimized queries on large bookings datasets effectively, especially for queries filtering on date ranges.

