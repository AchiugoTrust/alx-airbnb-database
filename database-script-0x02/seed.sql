-- Insert sample users first
-- -------------------------
INSERT INTO `users` (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
-- Hosts
('11111111-1111', 'John', 'Smith', 'john.smith@gmail.com', 
 '$2a$12$1tKL5N4U5NYZP9uV9yKGZ.4rvL0FBB3BD6PSrJwMOjLsVcQ7y4PMW', '555-123-4567', 'host', 
 '2024-01-01 10:00:00'),
('22222222-2222', 'Emily', 'Johnson', 'emily.johnson@gmail.com', 
 '$2a$12$nP3yhQf7KFBAx3M82zcMZeZfpPLpVIGe1MExkETUhKy1dCaYUxoZi', '555-234-5678', 'guest', 
 '2024-01-05 11:30:00'),
('33333333-3333', 'Admin', 'User', 'admin@airbnb.com', 
 '$2a$12$hq0yt5sYK7wXyPQsGvb25ODBrCx4C1LRx7F7Zn5L5ELopUa.YcYmi', '555-345-6789', 'admin', 
 '2024-01-10 09:15:00');
