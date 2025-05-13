/*Initial Query*/
SELECT b.booking_id, b.total_price, 
       u.user_id, u.first_name, u.email, 
       p.property_id, p.name, p.location, 
       pm.payment_id, pm.payment_date, pm.amount
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
LEFT JOIN payment pm ON b.booking_id = pm.booking_id;

/*Refactored Query*/
EXPLAIN ANALYZE

SELECT b.booking_id, b.total_price, 
       u.user_id, u.first_name, u.last_name, u.email, 
       p.property_id, p.name, p.location, 
       pm.payment_id, pm.payment_date, pm.amount
FROM booking b
JOIN users u ON b.user_id = u.user_id
JOIN property p ON b.property_id = p.property_id
JOIN payment pm ON b.booking_id = pm.booking_id;

