<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hero Section -->
<section class="hero-section" style="min-height: 50vh;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4">Book Your Stay</h1>
                <p class="lead mb-4">Reserve your perfect room and experience luxury at its finest.</p>
            </div>
        </div>
    </div>
</section>

<!-- Booking Form Section -->
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow">
                    <div class="card-body p-5">
                        <h2 class="section-title text-center mb-4">Reservation Form</h2>
                        
                        <form action="<c:url value='/booking/submit'/>" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="guestName" class="form-label">Guest Name *</label>
                                    <input type="text" class="form-control" id="guestName" name="guestName" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email Address *</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Phone Number *</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="guests" class="form-label">Number of Guests *</label>
                                    <select class="form-select" id="guests" name="guests" required>
                                        <option value="">Select guests</option>
                                        <option value="1">1 Guest</option>
                                        <option value="2">2 Guests</option>
                                        <option value="3">3 Guests</option>
                                        <option value="4">4 Guests</option>
                                        <option value="5">5+ Guests</option>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="checkIn" class="form-label">Check-in Date *</label>
                                    <input type="date" class="form-control" id="checkIn" name="checkIn" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="checkOut" class="form-label">Check-out Date *</label>
                                    <input type="date" class="form-control" id="checkOut" name="checkOut" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="roomType" class="form-label">Room Type *</label>
                                <select class="form-select" id="roomType" name="roomType" required>
                                    <option value="">Select room type</option>
                                    <option value="deluxe">Deluxe Room - $150/night</option>
                                    <option value="executive">Executive Suite - $250/night</option>
                                    <option value="presidential">Presidential Suite - $500/night</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="specialRequests" class="form-label">Special Requests</label>
                                <textarea class="form-control" id="specialRequests" name="specialRequests" rows="3" 
                                          placeholder="Any special requests or preferences..."></textarea>
                            </div>
                            
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="fas fa-calendar-check me-2"></i>Confirm Booking
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Room Types Preview -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title text-center mb-5">Available Room Types</h2>
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card room-card h-100">
                    <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Deluxe Room">
                    <div class="card-body">
                        <h5 class="card-title">Deluxe Room</h5>
                        <p class="card-text">Spacious and comfortable rooms with modern amenities and city views.</p>
                        <p class="text-primary fw-bold">$150/night</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>King-size bed</li>
                            <li><i class="fas fa-check text-success me-2"></i>City view</li>
                            <li><i class="fas fa-check text-success me-2"></i>Free WiFi</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card room-card h-100">
                    <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Executive Suite">
                    <div class="card-body">
                        <h5 class="card-title">Executive Suite</h5>
                        <p class="card-text">Luxurious suites with separate living areas and premium amenities.</p>
                        <p class="text-primary fw-bold">$250/night</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>Separate living room</li>
                            <li><i class="fas fa-check text-success me-2"></i>Panoramic views</li>
                            <li><i class="fas fa-check text-success me-2"></i>Executive lounge access</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card room-card h-100">
                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Presidential Suite">
                    <div class="card-body">
                        <h5 class="card-title">Presidential Suite</h5>
                        <p class="card-text">Ultimate luxury with panoramic views and exclusive services.</p>
                        <p class="text-primary fw-bold">$500/night</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>Multiple bedrooms</li>
                            <li><i class="fas fa-check text-success me-2"></i>Private terrace</li>
                            <li><i class="fas fa-check text-success me-2"></i>Butler service</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> 