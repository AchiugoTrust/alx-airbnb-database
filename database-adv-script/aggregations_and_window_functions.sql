/* query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause*/

SELECT user_id, COUNT(booking_id) AS total_bookings
FROM booking
GROUP BY user_id;

/*window function to rank properties based on the total number of bookings they have received.*/
SELECT property_id, 
       COUNT(booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(booking_id) DESC) AS ranking
FROM booking
GROUP BY property_id;
