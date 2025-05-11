SET FOREIGN_KEY_CHECKS=0;


-- Insert sample users first
-- -------------------------
INSERT INTO `users` (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
-- Host, Guest and Admin records
('11111111-1111', 'John', 'Smith', 'john.smith@gmail.com', 
 '$2a$12$1tKL5N4U5NYZP9uV9yKGZ.4rvL0FBB3BD6PSrJwMOjLsVcQ7y4PMW', '555-123-4567', 'host', 
 '2024-01-01 10:00:00'),
('22222222-2222', 'Emily', 'Johnson', 'emily.johnson@gmail.com', 
 '$2a$12$nP3yhQf7KFBAx3M82zcMZeZfpPLpVIGe1MExkETUhKy1dCaYUxoZi', '555-234-5678', 'guest', 
 '2024-01-05 11:30:00'),
('33333333-3333', 'Admin', 'User', 'admin@airbnb.com', 
 '$2a$12$hq0yt5sYK7wXyPQsGvb25ODBrCx4C1LRx7F7Zn5L5ELopUa.YcYmi', '555-345-6789', 'admin', 
 '2024-01-10 09:15:00');


INSERT INTO `property` (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
-- John's properties
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111', 
 'Beachfront Villa', 'Luxurious villa with stunning ocean views and private access to the beach.', 
 'Miami Beach, FL', 350.00, '2024-01-02 14:30:00', '2024-01-02 14:30:00'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111', 
 'Downtown Loft', 'Modern loft in the heart of downtown with panoramic city views.', 
 'New York, NY', 250.00, '2024-01-03 11:45:00', '2024-01-03 11:45:00'),

-- Emily's property
('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222', 
 'Mountain Cabin', 'Cozy cabin nestled in the mountains, perfect for a peaceful retreat.', 
 'Aspen, CO', 200.00, '2024-01-07 16:20:00', '2024-01-07 16:20:00');


 INSERT INTO `booking` (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
-- Bookings
('12121212-1212-1212-1212-121212121212', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 
 '44444444-4444', '2024-02-15', '2024-02-20', 1750.00, 'confirmed', 
 '2024-01-16 15:30:00'),
('23232323-2323-2323-2323-232323232323', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 
 '44444444-4444', '2024-03-10', '2024-03-15', 1000.00, 'pending', 
 '2024-01-17 12:45:00'),
 ('45454545-4545-4545-4545-454545454545', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 
 '55555555-5555', '2024-03-20', '2024-03-25', 1125.00, 'canceled', 
 '2024-01-22 17:15:00');


 INSERT INTO `payment` (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
-- Payments for confirmed bookings
('a1a1a1a1-a1a1-a1a1-a1a1-a1a1a1a1a1a1', '12121212-1212-1212-1212-121212121212', 
 1750.00, '2024-01-16 15:35:00', 'credit_card'),
('b2b2b2b2-b2b2-b2b2-b2b2-b2b2b2b2b2b2', '34343434-3434-3434-3434-343434343434', 
 1000.00, '2024-01-21 10:25:00', 'paypal'),
('c3c3c3c3-c3c3-c3c3-c3c3-c3c3c3c3c3c3', '56565656-5656-5656-5656-565656565656', 
 700.00, '2024-01-26 09:35:00', 'credit_card'),
('d4d4d4d4-d4d4-d4d4-d4d4-d4d4d4d4d4d4', '67676767-6767-6767-6767-676767676767', 
 600.00, '2024-02-02 14:15:00', 'stripe');


 INSERT INTO `review` (review_id, property_id, user_id, rating, comment, created_at)
VALUES
-- Reviews for Beachfront Villa
('abcd1234-abcd-1234-abcd-1234abcd1234', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 
 '44444444-4444', 5, 
 'Amazing property with breathtaking views! The private beach access was perfect. Will definitely return!', 
 '2024-02-21 18:30:00'),

-- Reviews for Downtown Loft
('bcde2345-bcde-2345-bcde-2345bcde2345', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 
 '55555555-5555', 4, 
 'Great location in the heart of the city. The loft was clean and stylish. Only wish parking was included.', 
 '2024-02-06 12:15:00'),

-- Reviews for Mountain Cabin
('cdef3456-cdef-3456-cdef-3456cdef3456', 'cccccccc-cccc-cccc-cccc-cccccccccccc', 
 '66666666-6666', 5, 
 'The cottage was absolutely perfect! So peaceful and the lake views were stunning at sunset. Host was very responsive.', 
 '2024-02-15 20:45:00');


 INSERT INTO `message` (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
-- Conversation between Sarah and John about Beachfront Villa
('msg11111-1111-1111-1111-111111111111', '44444444-4444', 
 '11111111-1111', 
 'Hi John, I\'m interested in your Beachfront Villa. Is early check-in available?', 
 '2024-01-15 14:30:00'),
('msg22222-2222-2222-2222-222222222222', '11111111-1111', 
 '44444444-4444', 
 'Hello Sarah! Yes, early check-in is available. What time were you thinking?', 
 '2024-01-15 15:20:00'),
('msg33333-3333-3333-3333-333333333333', '44444444-4444', 
 '11111111-1111', 
 'Great! Would 11 AM work?', 
 '2024-01-15 15:45:00'),
('msg44444-4444-4444-4444-444444444444', '11111111-1111', 
 '44444444-4444', 
 'That works perfectly. I\'ll make a note of it. Looking forward to hosting you!', 
 '2024-01-15 16:10:00');


SET FOREIGN_KEY_CHECKS=1;