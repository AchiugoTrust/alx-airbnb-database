CREATE INDEX idx_user_email ON users(user_id, email);

CREATE INDEX idx_booking_property ON booking(booking_id, property_id);

CREATE INDEX idx_property_host_price ON property(property_id, host_id, price_per_night);




