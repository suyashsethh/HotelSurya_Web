package com.hotelsurya.service;

import com.hotelsurya.model.Booking;
import java.util.List;

public interface BookingService {
    
    /**
     * Create a new booking
     */
    void createBooking(Booking booking);
    
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
     * Get room bookings
     */
    List<Booking> getRoomBookings();
    
    /**
     * Get event bookings
     */
    List<Booking> getEventBookings();
    
    /**
     * Get booking statistics
     */
    BookingStatistics getBookingStatistics();
    
    /**
     * Calculate total amount for a booking
     */
    double calculateTotalAmount(String roomType, int numberOfRooms, int numberOfNights);
} 