/*INNER JOIN to retrieve all bookings and the respective users who made those bookings.*/
SELECT u.first_name, u.last_name, b.booking_id
FROM users as u
INNER JOIN booking as b
ON u.user_id = b.booking_id

/*LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.*/
SELECT p.property_id, p.name, r.comment
FROM property as p
LEFT JOIN review as r
ON p.property_id = r.property_id
ORDER BY p.property_id

/*Full Outer Join simulated in MySQL using a left join, union, and a right join*/

SELECT u.first_name, u.last_name, b.booking_id, b.property_id, b.status
FROM users as u 
OUTER JOIN booking as b
ON u.user_id = b.user_id

