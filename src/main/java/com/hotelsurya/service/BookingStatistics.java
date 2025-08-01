package com.hotelsurya.service;

public class BookingStatistics {
    private int totalBookings;
    private int totalRoomBookings;
    private int totalEventBookings;
    private int pendingBookings;
    private int confirmedBookings;
    private int cancelledBookings;
    private double totalRevenue;
    private double averageBookingValue;

    public BookingStatistics() {}

    public BookingStatistics(int totalBookings, int totalRoomBookings, int totalEventBookings,
                           int pendingBookings, int confirmedBookings, int cancelledBookings,
                           double totalRevenue, double averageBookingValue) {
        this.totalBookings = totalBookings;
        this.totalRoomBookings = totalRoomBookings;
        this.totalEventBookings = totalEventBookings;
        this.pendingBookings = pendingBookings;
        this.confirmedBookings = confirmedBookings;
        this.cancelledBookings = cancelledBookings;
        this.totalRevenue = totalRevenue;
        this.averageBookingValue = averageBookingValue;
    }

    // Getters and Setters
    public int getTotalBookings() {
        return totalBookings;
    }

    public void setTotalBookings(int totalBookings) {
        this.totalBookings = totalBookings;
    }

    public int getTotalRoomBookings() {
        return totalRoomBookings;
    }

    public void setTotalRoomBookings(int totalRoomBookings) {
        this.totalRoomBookings = totalRoomBookings;
    }

    public int getTotalEventBookings() {
        return totalEventBookings;
    }

    public void setTotalEventBookings(int totalEventBookings) {
        this.totalEventBookings = totalEventBookings;
    }

    public int getPendingBookings() {
        return pendingBookings;
    }

    public void setPendingBookings(int pendingBookings) {
        this.pendingBookings = pendingBookings;
    }

    public int getConfirmedBookings() {
        return confirmedBookings;
    }

    public void setConfirmedBookings(int confirmedBookings) {
        this.confirmedBookings = confirmedBookings;
    }

    public int getCancelledBookings() {
        return cancelledBookings;
    }

    public void setCancelledBookings(int cancelledBookings) {
        this.cancelledBookings = cancelledBookings;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public double getAverageBookingValue() {
        return averageBookingValue;
    }

    public void setAverageBookingValue(double averageBookingValue) {
        this.averageBookingValue = averageBookingValue;
    }

    @Override
    public String toString() {
        return "BookingStatistics{" +
                "totalBookings=" + totalBookings +
                ", totalRoomBookings=" + totalRoomBookings +
                ", totalEventBookings=" + totalEventBookings +
                ", pendingBookings=" + pendingBookings +
                ", confirmedBookings=" + confirmedBookings +
                ", cancelledBookings=" + cancelledBookings +
                ", totalRevenue=" + totalRevenue +
                ", averageBookingValue=" + averageBookingValue +
                '}';
    }
} 