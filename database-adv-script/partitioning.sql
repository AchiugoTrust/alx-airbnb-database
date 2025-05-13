-- Create a partitioned Booking table based on start_date (yearly)
CREATE TABLE booking_partitioned (
    booking_id CHAR(36),
    property_id CHAR(36),
    user_id CHAR(36),
    start_date DATE,
    end_date DATE,
    total_price DECIMAL(10, 2),
    status ENUM('pending', 'confirmed', 'canceled'),
    created_at TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2022 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);
