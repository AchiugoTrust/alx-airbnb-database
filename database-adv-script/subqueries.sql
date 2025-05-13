/*correlated subquery to find users who have made more than 3 bookings.*/

SELECT * FROM property
WHERE property_id IN
(SELECT property_id FROM review
GROUP BY property_id
HAVING AVG(rating) > 4.0)

/*correlated subquery to find users who have made more than 3 bookings.*/
SELECT * from users
WHERE user_id in (SELECT user_id FROM booking
GROUP BY user_id
HAVING COUNT(booking_id) > 3);