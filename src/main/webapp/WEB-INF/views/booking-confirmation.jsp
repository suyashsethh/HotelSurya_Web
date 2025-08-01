<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Booking Confirmation Section -->
<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card border-0 shadow-lg">
                    <div class="card-header bg-success text-white text-center">
                        <i class="fas fa-check-circle fa-3x mb-3"></i>
                        <h2 class="mb-0">Booking Confirmed!</h2>
                    </div>
                    <div class="card-body p-5">
                        <div class="text-center mb-4">
                            <h4 class="text-success">Thank you for choosing Hotel Surya!</h4>
                            <p class="lead">Your booking has been successfully confirmed.</p>
                        </div>

                        <!-- Booking Details -->
                        <div class="row">
                            <div class="col-md-6">
                                <h5 class="border-bottom pb-2 mb-3">Booking Information</h5>
                                <div class="mb-3">
                                    <strong>Booking ID:</strong><br>
                                    <span class="text-primary fw-bold">#${bookingId}</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Guest Name:</strong><br>
                                    <span>${guestName}</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Email:</strong><br>
                                    <span>${email}</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Room Type:</strong><br>
                                    <span class="text-primary">${roomType}</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h5 class="border-bottom pb-2 mb-3">Stay Details</h5>
                                <div class="mb-3">
                                    <strong>Check-in Date:</strong><br>
                                    <span class="text-success">${checkIn}</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Check-out Date:</strong><br>
                                    <span class="text-success">${checkOut}</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Number of Guests:</strong><br>
                                    <span>${guests} guest(s)</span>
                                </div>
                                <div class="mb-3">
                                    <strong>Total Amount:</strong><br>
                                    <span class="text-primary fw-bold h5">$<fmt:formatNumber value="${totalAmount}" pattern="#,##0.00"/></span>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="text-center mt-5">
                            <a href="<c:url value='/'/>" class="btn btn-primary me-3">
                                <i class="fas fa-home me-2"></i>Back to Home
                            </a>
                            <a href="<c:url value='/rooms'/>" class="btn btn-outline-primary me-3">
                                <i class="fas fa-bed me-2"></i>View More Rooms
                            </a>
                            <a href="<c:url value='/contact'/>" class="btn btn-outline-secondary">
                                <i class="fas fa-envelope me-2"></i>Contact Us
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- What's Next Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h3 class="mb-4">What's Next?</h3>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body text-center">
                                <i class="fas fa-envelope-open-text text-primary mb-3" style="font-size: 2rem;"></i>
                                <h5>Confirmation Email</h5>
                                <p>You'll receive a detailed confirmation email shortly with all your booking information.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body text-center">
                                <i class="fas fa-map-marked-alt text-success mb-3" style="font-size: 2rem;"></i>
                                <h5>Hotel Location</h5>
                                <p>Find us at 123 Luxury Street, City Center. We're easily accessible from the airport and downtown.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body text-center">
                                <i class="fas fa-concierge-bell text-warning mb-3" style="font-size: 2rem;"></i>
                                <h5>24/7 Support</h5>
                                <p>Our concierge team is available 24/7 to assist you with any questions or special requests.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> 