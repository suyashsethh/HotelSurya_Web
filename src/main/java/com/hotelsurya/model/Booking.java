package com.hotelsurya.model;

import java.util.Date;

public class Booking {
    private Long id;
    private String guestName;
    private String email;
    private String phone;
    private String roomType;
    private int numberOfRooms;
    private int numberOfGuests;
    private Date checkInDate;
    private Date checkOutDate;
    private double totalAmount;
    private String bookingStatus; // PENDING, CONFIRMED, CANCELLED
    private Date bookingDate;
    private String specialRequests;
    private String eventType; // ROOM_BOOKING, EVENT_BOOKING
    private String eventDetails; // For event bookings

    // Default constructor
    public Booking() {
        this.bookingDate = new Date();
        this.bookingStatus = "PENDING";
    }

    // Constructor with all fields
    public Booking(String guestName, String email, String phone, String roomType, 
                   int numberOfRooms, int numberOfGuests, Date checkInDate, 
                   Date checkOutDate, double totalAmount, String specialRequests) {
        this();
        this.guestName = guestName;
        this.email = email;
        this.phone = phone;
        this.roomType = roomType;
        this.numberOfRooms = numberOfRooms;
        this.numberOfGuests = numberOfGuests;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.totalAmount = totalAmount;
        this.specialRequests = specialRequests;
        this.eventType = "ROOM_BOOKING";
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getNumberOfRooms() {
        return numberOfRooms;
    }

    public void setNumberOfRooms(int numberOfRooms) {
        this.numberOfRooms = numberOfRooms;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }

    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getEventDetails() {
        return eventDetails;
    }

    public void setEventDetails(String eventDetails) {
        this.eventDetails = eventDetails;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", guestName='" + guestName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", roomType='" + roomType + '\'' +
                ", numberOfRooms=" + numberOfRooms +
                ", numberOfGuests=" + numberOfGuests +
                ", checkInDate=" + checkInDate +
                ", checkOutDate=" + checkOutDate +
                ", totalAmount=" + totalAmount +
                ", bookingStatus='" + bookingStatus + '\'' +
                ", bookingDate=" + bookingDate +
                ", eventType='" + eventType + '\'' +
                '}';
    }
} 