-- Hotel Surya MySQL Database Setup Script
-- Run this script to set up MySQL database for the Hotel Surya application

-- Create database
CREATE DATABASE IF NOT EXISTS hotel_surya;
USE hotel_surya;

-- Create bookings table
CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    room_type VARCHAR(50),
    number_of_rooms INT DEFAULT 1,
    number_of_guests INT DEFAULT 1,
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    booking_status VARCHAR(20) DEFAULT 'PENDING',
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    special_requests TEXT,
    event_type VARCHAR(20) DEFAULT 'ROOM_BOOKING',
    event_details TEXT
);

-- Insert sample data for testing
INSERT INTO bookings (guest_name, email, phone, room_type, number_of_rooms, number_of_guests, 
                     check_in_date, check_out_date, total_amount, booking_status, event_type) VALUES
('John Doe', 'john.doe@email.com', '+1-555-0123', 'Deluxe Suite', 1, 2, '2024-02-15', '2024-02-18', 899.97, 'CONFIRMED', 'ROOM_BOOKING'),
('Jane Smith', 'jane.smith@email.com', '+1-555-0124', 'Executive Room', 1, 1, '2024-02-20', '2024-02-22', 399.98, 'PENDING', 'ROOM_BOOKING'),
('Mike Johnson', 'mike.johnson@email.com', '+1-555-0125', 'Presidential Suite', 1, 4, '2024-02-25', '2024-02-28', 1799.97, 'CONFIRMED', 'ROOM_BOOKING'),
('Sarah Wilson', 'sarah.wilson@email.com', '+1-555-0126', 'N/A', 0, 0, NULL, NULL, 0.00, 'PENDING', 'EVENT_BOOKING');

-- Update event details for the contact inquiry
UPDATE bookings SET event_details = 'Contact Form: Wedding Inquiry - I would like to inquire about hosting a wedding reception at your hotel. Please provide details about packages and availability.' 
WHERE guest_name = 'Sarah Wilson' AND event_type = 'EVENT_BOOKING';

-- Show created table structure
DESCRIBE bookings;

-- Show sample data
SELECT * FROM bookings;

-- Create user for the application (optional)
-- CREATE USER 'hotelapp'@'localhost' IDENTIFIED BY 'hotelpass123';
-- GRANT ALL PRIVILEGES ON hotel_surya.* TO 'hotelapp'@'localhost';
-- FLUSH PRIVILEGES;