-- Users Table
CREATE TABLE `users` (
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE INDEX idx_user_email (email)
);

-- Properties Table
CREATE TABLE `property` (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_property_host (host_id),
    CONSTRAINT fk_property_host FOREIGN KEY (host_id) REFERENCES `users` (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Bookings Table
CREATE TABLE `booking` (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_booking_property (property_id),
    INDEX idx_booking_user (user_id),
    INDEX idx_booking_dates (start_date, end_date),
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES `property` (property_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES `users` (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Payments Table
CREATE TABLE `payment` (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    INDEX idx_payment_booking (booking_id),
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES `booking` (booking_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Reviews Table
CREATE TABLE `review` (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_review_property (property_id),
    INDEX idx_review_user (user_id),
    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES `property` (property_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES `users` (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT check_rating CHECK (rating >= 1 AND rating <= 5)
);

-- Messages Table
CREATE TABLE `message` (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_message_sender (sender_id),
    INDEX idx_message_recipient (recipient_id),
    INDEX idx_message_conversation (sender_id, recipient_id),
    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES `users` (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES `users` (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);