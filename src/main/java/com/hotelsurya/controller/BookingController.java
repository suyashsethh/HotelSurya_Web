package com.hotelsurya.controller;

import com.hotelsurya.model.Booking;
import com.hotelsurya.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/booking")
public class BookingController {

    @Autowired
    private BookingService bookingService;

    @GetMapping("/reserve")
    public String reserveRoom(Model model) {
        model.addAttribute("title", "Hotel Surya - Reserve Room");
        model.addAttribute("page", "booking");
        return "template";
    }

    @PostMapping("/submit")
    public String submitBooking(@RequestParam String guestName,
                               @RequestParam String email,
                               @RequestParam String phone,
                               @RequestParam String checkIn,
                               @RequestParam String checkOut,
                               @RequestParam String roomType,
                               @RequestParam int guests,
                               @RequestParam(required = false) String specialRequests,
                               Model model) {
        
        try {
            // Parse dates
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date checkInDate = dateFormat.parse(checkIn);
            Date checkOutDate = dateFormat.parse(checkOut);
            
            // Create booking object
            Booking booking = new Booking();
            booking.setGuestName(guestName);
            booking.setEmail(email);
            booking.setPhone(phone);
            booking.setRoomType(roomType);
            booking.setNumberOfRooms(1); // Default to 1 room
            booking.setNumberOfGuests(guests);
            booking.setCheckInDate(checkInDate);
            booking.setCheckOutDate(checkOutDate);
            booking.setSpecialRequests(specialRequests);
            booking.setEventType("ROOM_BOOKING");
            
            // Save to database
            bookingService.createBooking(booking);
            
            // Add success message and booking details to model
            model.addAttribute("bookingSuccess", true);
            model.addAttribute("guestName", guestName);
            model.addAttribute("email", email);
            model.addAttribute("checkIn", checkIn);
            model.addAttribute("checkOut", checkOut);
            model.addAttribute("roomType", roomType);
            model.addAttribute("guests", guests);
            model.addAttribute("totalAmount", booking.getTotalAmount());
            model.addAttribute("bookingId", booking.getId());
            model.addAttribute("page", "booking-confirmation");
            
        } catch (ParseException e) {
            model.addAttribute("bookingError", "Invalid date format");
            model.addAttribute("page", "booking");
        } catch (Exception e) {
            model.addAttribute("bookingError", "An error occurred while processing your booking");
            model.addAttribute("page", "booking");
        }
        
        return "template";
    }

    @PostMapping("/contact")
    public String submitContact(@RequestParam String name,
                               @RequestParam String email,
                               @RequestParam String subject,
                               @RequestParam String message,
                               Model model) {
        
        try {
            // Create event booking for contact form
            Booking contactBooking = new Booking();
            contactBooking.setGuestName(name);
            contactBooking.setEmail(email);
            contactBooking.setPhone("N/A");
            contactBooking.setRoomType("N/A");
            contactBooking.setNumberOfRooms(0);
            contactBooking.setNumberOfGuests(0);
            contactBooking.setEventType("EVENT_BOOKING");
            contactBooking.setEventDetails("Contact Form: " + subject + " - " + message);
            contactBooking.setTotalAmount(0.0);
            
            // Save to database
            bookingService.createBooking(contactBooking);
            
            model.addAttribute("contactSuccess", true);
            model.addAttribute("name", name);
            model.addAttribute("page", "contact");
            
        } catch (Exception e) {
            model.addAttribute("contactError", "An error occurred while sending your message");
            model.addAttribute("page", "contact");
        }
        
        return "template";
    }
} 