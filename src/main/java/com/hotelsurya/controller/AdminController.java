package com.hotelsurya.controller;

import com.hotelsurya.model.Booking;
import com.hotelsurya.service.BookingService;
import com.hotelsurya.service.BookingStatistics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        BookingStatistics stats = bookingService.getBookingStatistics();
        List<Booking> recentBookings = bookingService.getAllBookings();
        
        // Limit to 10 most recent bookings
        if (recentBookings.size() > 10) {
            recentBookings = recentBookings.subList(0, 10);
        }
        
        model.addAttribute("title", "Hotel Surya - Admin Dashboard");
        model.addAttribute("page", "admin-dashboard");
        model.addAttribute("stats", stats);
        model.addAttribute("recentBookings", recentBookings);
        
        return "template";
    }

    @GetMapping("/bookings")
    public String allBookings(Model model) {
        List<Booking> bookings = bookingService.getAllBookings();
        
        model.addAttribute("title", "Hotel Surya - All Bookings");
        model.addAttribute("page", "admin-bookings");
        model.addAttribute("bookings", bookings);
        
        return "template";
    }

    @GetMapping("/room-bookings")
    public String roomBookings(Model model) {
        List<Booking> roomBookings = bookingService.getRoomBookings();
        
        model.addAttribute("title", "Hotel Surya - Room Bookings");
        model.addAttribute("page", "admin-room-bookings");
        model.addAttribute("bookings", roomBookings);
        
        return "template";
    }

    @GetMapping("/event-bookings")
    public String eventBookings(Model model) {
        List<Booking> eventBookings = bookingService.getEventBookings();
        
        model.addAttribute("title", "Hotel Surya - Event Bookings");
        model.addAttribute("page", "admin-event-bookings");
        model.addAttribute("bookings", eventBookings);
        
        return "template";
    }

    @GetMapping("/pending-bookings")
    public String pendingBookings(Model model) {
        List<Booking> pendingBookings = bookingService.getBookingsByStatus("PENDING");
        
        model.addAttribute("title", "Hotel Surya - Pending Bookings");
        model.addAttribute("page", "admin-pending-bookings");
        model.addAttribute("bookings", pendingBookings);
        
        return "template";
    }

    @GetMapping("/booking/{id}")
    public String viewBooking(@PathVariable Long id, Model model) {
        Booking booking = bookingService.getBookingById(id);
        
        if (booking == null) {
            model.addAttribute("error", "Booking not found");
            return "redirect:/admin/bookings";
        }
        
        model.addAttribute("title", "Hotel Surya - Booking Details");
        model.addAttribute("page", "admin-booking-details");
        model.addAttribute("booking", booking);
        
        return "template";
    }

    @PostMapping("/booking/{id}/status")
    @ResponseBody
    public String updateBookingStatus(@PathVariable Long id, @RequestParam String status) {
        try {
            bookingService.updateBookingStatus(id, status);
            return "success";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @PostMapping("/booking/{id}/delete")
    @ResponseBody
    public String deleteBooking(@PathVariable Long id) {
        try {
            bookingService.deleteBooking(id);
            return "success";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/statistics")
    public String statistics(Model model) {
        BookingStatistics stats = bookingService.getBookingStatistics();
        
        model.addAttribute("title", "Hotel Surya - Booking Statistics");
        model.addAttribute("page", "admin-statistics");
        model.addAttribute("stats", stats);
        
        return "template";
    }
} 