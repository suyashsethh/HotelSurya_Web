package com.hotelsurya.controller;

import com.hotelsurya.dao.BookingDAO;
import com.hotelsurya.model.Booking;
import com.hotelsurya.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    private BookingService bookingService;
    
    @Autowired
    private BookingDAO bookingDAO;
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/db")
    @ResponseBody
    public String testDatabase() {
        try {
            // Test basic database operations
            List<Booking> bookings = bookingService.getAllBookings();
            return "Database connection successful! Found " + bookings.size() + " bookings.";
        } catch (Exception e) {
            return "Database connection failed: " + e.getMessage();
        }
    }

    @GetMapping("/init-db")
    @ResponseBody
    public String initializeDatabase() {
        try {
            // Create the table manually
            String createTableSQL = """
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
                )
                """;
            
            jdbcTemplate.execute(createTableSQL);
            return "Database table created successfully!";
        } catch (Exception e) {
            return "Failed to create table: " + e.getMessage();
        }
    }

    @GetMapping("/create-sample")
    @ResponseBody
    public String createSampleBooking() {
        try {
            // Create a sample booking
            Booking booking = new Booking();
            booking.setGuestName("Test User");
            booking.setEmail("test@example.com");
            booking.setPhone("+1-555-0100");
            booking.setRoomType("Test Room");
            booking.setNumberOfRooms(1);
            booking.setNumberOfGuests(2);
            booking.setEventType("ROOM_BOOKING");
            booking.setTotalAmount(199.99);
            
            bookingService.createBooking(booking);
            
            return "Sample booking created successfully!";
        } catch (Exception e) {
            return "Failed to create sample booking: " + e.getMessage();
        }
    }
}