package com.hotelsurya.dao;

import com.hotelsurya.model.Booking;
import java.util.List;

public interface BookingDAO {
    
    /**
     * Save a new booking to the database
     */
    void saveBooking(Booking booking);
    
    /**
     * Get all bookings
     */
    List<Booking> getAllBookings();
    
    /**
     * Get booking by ID
     */
    Booking getBookingById(Long id);
    
    /**
     * Update booking status
     */
    void updateBookingStatus(Long id, String status);
    
    /**
     * Delete booking
     */
    void deleteBooking(Long id);
    
    /**
     * Get bookings by status
     */
    List<Booking> getBookingsByStatus(String status);
    
    /**
     * Get bookings by event type (ROOM_BOOKING or EVENT_BOOKING)
     */
    List<Booking> getBookingsByEventType(String eventType);
    
    /**
     * Get total number of bookings
     */
    int getTotalBookings();
    
    /**
     * Get total number of room bookings
     */
    int getTotalRoomBookings();
    
    /**
     * Get total number of event bookings
     */
    int getTotalEventBookings();
    
    /**
     * Get total revenue from confirmed bookings
     */
    double getTotalRevenue();
} 