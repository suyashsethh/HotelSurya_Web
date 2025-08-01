package com.hotelsurya.dao;

import com.hotelsurya.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import jakarta.annotation.PostConstruct;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class BookingDAOImpl implements BookingDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PostConstruct
    public void init() {
        createTableIfNotExists();
        System.out.println("BookingDAO initialized successfully!");
    }

    private boolean tableExists = false;
    
    private void ensureTableExists() {
        if (!tableExists) {
            createTableIfNotExists();
            tableExists = true;
        }
    }
    
    private void createTableIfNotExists() {
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
        System.out.println("Bookings table created/verified successfully!");
    }

    private final RowMapper<Booking> bookingRowMapper = new RowMapper<Booking>() {
        @Override
        public Booking mapRow(ResultSet rs, int rowNum) throws SQLException {
            Booking booking = new Booking();
            booking.setId(rs.getLong("id"));
            booking.setGuestName(rs.getString("guest_name"));
            booking.setEmail(rs.getString("email"));
            booking.setPhone(rs.getString("phone"));
            booking.setRoomType(rs.getString("room_type"));
            booking.setNumberOfRooms(rs.getInt("number_of_rooms"));
            booking.setNumberOfGuests(rs.getInt("number_of_guests"));
            booking.setCheckInDate(rs.getDate("check_in_date"));
            booking.setCheckOutDate(rs.getDate("check_out_date"));
            booking.setTotalAmount(rs.getDouble("total_amount"));
            booking.setBookingStatus(rs.getString("booking_status"));
            booking.setBookingDate(rs.getTimestamp("booking_date"));
            booking.setSpecialRequests(rs.getString("special_requests"));
            booking.setEventType(rs.getString("event_type"));
            booking.setEventDetails(rs.getString("event_details"));
            return booking;
        }
    };

    @Override
    public void saveBooking(Booking booking) {
        ensureTableExists();
        String sql = """
            INSERT INTO bookings (guest_name, email, phone, room_type, number_of_rooms, 
                                 number_of_guests, check_in_date, check_out_date, total_amount, 
                                 special_requests, event_type, event_details)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
            """;
        System.out.println("Inserted Successfully!");
        
        jdbcTemplate.update(sql,
            booking.getGuestName(),
            booking.getEmail(),
            booking.getPhone(),
            booking.getRoomType(),
            booking.getNumberOfRooms(),
            booking.getNumberOfGuests(),
            booking.getCheckInDate(),
            booking.getCheckOutDate(),
            booking.getTotalAmount(),
            booking.getSpecialRequests(),
            booking.getEventType(),
            booking.getEventDetails()
        );
    }

    @Override
    public List<Booking> getAllBookings() {
        ensureTableExists();
        String sql = "SELECT * FROM bookings ORDER BY booking_date DESC";
        return jdbcTemplate.query(sql, bookingRowMapper);
    }

    @Override
    public Booking getBookingById(Long id) {
        try {
            String sql = "SELECT * FROM bookings WHERE id = ?";
            return jdbcTemplate.queryForObject(sql, bookingRowMapper, id);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public void updateBookingStatus(Long id, String status) {
        String sql = "UPDATE bookings SET booking_status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }

    @Override
    public void deleteBooking(Long id) {
        String sql = "DELETE FROM bookings WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public List<Booking> getBookingsByStatus(String status) {
        String sql = "SELECT * FROM bookings WHERE booking_status = ? ORDER BY booking_date DESC";
        return jdbcTemplate.query(sql, bookingRowMapper, status);
    }

    @Override
    public List<Booking> getBookingsByEventType(String eventType) {
        String sql = "SELECT * FROM bookings WHERE event_type = ? ORDER BY booking_date DESC";
        return jdbcTemplate.query(sql, bookingRowMapper, eventType);
    }

    @Override
    public int getTotalBookings() {
        ensureTableExists();
        String sql = "SELECT COUNT(*) FROM bookings";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int getTotalRoomBookings() {
        String sql = "SELECT COUNT(*) FROM bookings WHERE event_type = 'ROOM_BOOKING'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public int getTotalEventBookings() {
        String sql = "SELECT COUNT(*) FROM bookings WHERE event_type = 'EVENT_BOOKING'";
        return jdbcTemplate.queryForObject(sql, Integer.class);
    }

    @Override
    public double getTotalRevenue() {
        String sql = "SELECT COALESCE(SUM(total_amount), 0) FROM bookings WHERE booking_status = 'CONFIRMED'";
        return jdbcTemplate.queryForObject(sql, Double.class);
    }
} 