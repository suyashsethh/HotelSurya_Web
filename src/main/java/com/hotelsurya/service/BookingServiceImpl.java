package com.hotelsurya.service;

import com.hotelsurya.dao.BookingDAO;
import com.hotelsurya.model.Booking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingServiceImpl implements BookingService {

    @Autowired
    private BookingDAO bookingDAO;
    
    private boolean initialized = false;

    // Room prices per night
    private static final double DELUXE_SUITE_PRICE = 299.99;
    private static final double EXECUTIVE_ROOM_PRICE = 199.99;
    private static final double PRESIDENTIAL_SUITE_PRICE = 599.99;

    @Override
    public void createBooking(Booking booking) {
        // Calculate total amount if not set
        if (booking.getTotalAmount() == 0) {
            booking.setTotalAmount(calculateTotalAmount(
                booking.getRoomType(), 
                booking.getNumberOfRooms(), 
                calculateNumberOfNights(booking.getCheckInDate(), booking.getCheckOutDate())
            ));
        }
        
        bookingDAO.saveBooking(booking);
    }

    @Override
    public List<Booking> getAllBookings() {
        ensureInitialized();
        return bookingDAO.getAllBookings();
    }
    
    private void ensureInitialized() {
        if (!initialized) {
            // Force DAO initialization by accessing it
            try {
                bookingDAO.getTotalBookings();
            } catch (Exception e) {
                // Table might not exist, let the DAO handle it
                System.out.println("Database initialization triggered");
            }
            initialized = true;
        }
    }

    @Override
    public Booking getBookingById(Long id) {
        return bookingDAO.getBookingById(id);
    }

    @Override
    public void updateBookingStatus(Long id, String status) {
        bookingDAO.updateBookingStatus(id, status);
    }

    @Override
    public void deleteBooking(Long id) {
        bookingDAO.deleteBooking(id);
    }

    @Override
    public List<Booking> getBookingsByStatus(String status) {
        return bookingDAO.getBookingsByStatus(status);
    }

    @Override
    public List<Booking> getRoomBookings() {
        return bookingDAO.getBookingsByEventType("ROOM_BOOKING");
    }

    @Override
    public List<Booking> getEventBookings() {
        return bookingDAO.getBookingsByEventType("EVENT_BOOKING");
    }

    @Override
    public BookingStatistics getBookingStatistics() {
        int totalBookings = bookingDAO.getTotalBookings();
        int totalRoomBookings = bookingDAO.getTotalRoomBookings();
        int totalEventBookings = bookingDAO.getTotalEventBookings();
        double totalRevenue = bookingDAO.getTotalRevenue();
        
        List<Booking> pendingBookings = getBookingsByStatus("PENDING");
        List<Booking> confirmedBookings = getBookingsByStatus("CONFIRMED");
        List<Booking> cancelledBookings = getBookingsByStatus("CANCELLED");
        
        double averageBookingValue = totalBookings > 0 ? totalRevenue / totalBookings : 0;
        
        return new BookingStatistics(
            totalBookings,
            totalRoomBookings,
            totalEventBookings,
            pendingBookings.size(),
            confirmedBookings.size(),
            cancelledBookings.size(),
            totalRevenue,
            averageBookingValue
        );
    }

    @Override
    public double calculateTotalAmount(String roomType, int numberOfRooms, int numberOfNights) {
        double pricePerNight = getPricePerNight(roomType);
        return pricePerNight * numberOfRooms * numberOfNights;
    }

    private double getPricePerNight(String roomType) {
        return switch (roomType != null ? roomType.toUpperCase() : "") {
            case "DELUXE SUITE" -> DELUXE_SUITE_PRICE;
            case "EXECUTIVE ROOM" -> EXECUTIVE_ROOM_PRICE;
            case "PRESIDENTIAL SUITE" -> PRESIDENTIAL_SUITE_PRICE;
            default -> EXECUTIVE_ROOM_PRICE; // Default price
        };
    }

    private int calculateNumberOfNights(java.util.Date checkIn, java.util.Date checkOut) {
        if (checkIn == null || checkOut == null) {
            return 1; // Default to 1 night
        }
        
        long diffInMillies = checkOut.getTime() - checkIn.getTime();
        long diffInDays = diffInMillies / (24 * 60 * 60 * 1000);
        return Math.max(1, (int) diffInDays); // Minimum 1 night
    }
} 