package com.hotelsurya.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Arrays;
import java.util.List;
import java.util.Date;

@Controller
@RequestMapping("/")
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("title", "Hotel Surya - Welcome");
        model.addAttribute("page", "home");
        
        // Example: Dynamic data for homepage
        model.addAttribute("currentDate", new Date());
        model.addAttribute("specialOffers", Arrays.asList(
            "20% off on weekend stays",
            "Free breakfast for family bookings",
            "Complimentary spa access"
        ));
        model.addAttribute("featuredRooms", Arrays.asList(
            "Deluxe Suite", "Executive Room", "Presidential Suite"
        ));
        
        return "template";
    }

    @GetMapping("/rooms")
    public String rooms(Model model) {
        model.addAttribute("title", "Hotel Surya - Rooms & Suites");
        model.addAttribute("page", "rooms");
        
        // Example: Dynamic room data (in real app, this would come from database)
        List<Room> availableRooms = Arrays.asList(
            new Room("Deluxe Suite", 299.99, "Luxury suite with city view", true),
            new Room("Executive Room", 199.99, "Comfortable business room", true),
            new Room("Presidential Suite", 599.99, "Ultimate luxury experience", false)
        );
        
        model.addAttribute("rooms", availableRooms);
        model.addAttribute("totalRooms", availableRooms.size());
        model.addAttribute("availableRooms", availableRooms.stream().filter(r -> r.isAvailable()).count());
        
        return "template";
    }

    @GetMapping("/dining")
    public String dining(Model model) {
        model.addAttribute("title", "Hotel Surya - Dining");
        model.addAttribute("page", "dining");
        return "template";
    }

    @GetMapping("/amenities")
    public String amenities(Model model) {
        model.addAttribute("title", "Hotel Surya - Amenities");
        model.addAttribute("page", "amenities");
        return "template";
    }

    @GetMapping("/gallery")
    public String gallery(Model model) {
        model.addAttribute("title", "Hotel Surya - Gallery");
        model.addAttribute("page", "gallery");
        return "template";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("title", "Hotel Surya - Contact Us");
        model.addAttribute("page", "contact");
        return "template";
    }

    @GetMapping("/booking")
    public String booking(Model model) {
        model.addAttribute("title", "Hotel Surya - Book Now");
        model.addAttribute("page", "booking");
        return "template";
    }

    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("title", "Hotel Surya - About Us");
        model.addAttribute("page", "about");
        return "template";
    }

    // Helper class for demonstration
    public static class Room {
        private String name;
        private double price;
        private String description;
        private boolean available;
        
        public Room(String name, double price, String description, boolean available) {
            this.name = name;
            this.price = price;
            this.description = description;
            this.available = available;
        }
        
        // Getters
        public String getName() { return name; }
        public double getPrice() { return price; }
        public String getDescription() { return description; }
        public boolean isAvailable() { return available; }
    }
} 