## Using the EXPLAIN function, the initial query wasn't very efficient for the following reasons;
- b (booking table): Had an access type of 'ALL' (full table scan), indicating poor efficiency. Also, no key is being used (empty value), suggesting that the index is not properly utilized.

- The full table scan on bookings (b) indicates no efficient index is being used, despite having possible keys:
- idx_booking_property, idx_booking_user

- pm (paymens): Had an access type of 'ref', which is better than ALL, but not optimal.

## Refactored Query
- bookings (b) had a full table scan (ALL), but now it uses eq_ref, which is the most efficient type for a join, meaning that the database can directly match a single row using the PRIMARY key, rather than scanning the entire table.