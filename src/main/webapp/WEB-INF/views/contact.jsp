<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hero Section -->
<section class="hero-section" style="min-height: 50vh;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4">Contact Us</h1>
                <p class="lead mb-4">Get in touch with us for reservations, inquiries, or any assistance you need.</p>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <!-- Contact Form -->
            <div class="col-lg-8 mb-5">
                <h2 class="section-title mb-4">Send us a Message</h2>
                
                <c:if test="${contactSuccess}">
                    <div class="alert alert-success" role="alert">
                        <i class="fas fa-check-circle me-2"></i>
                        Thank you, ${name}! Your message has been sent successfully. We'll get back to you soon.
                    </div>
                </c:if>
                
                <form action="<c:url value='/booking/contact'/>" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="name" class="form-label">Full Name *</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email Address *</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="subject" class="form-label">Subject *</label>
                        <input type="text" class="form-control" id="subject" name="subject" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message *</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-2"></i>Send Message
                    </button>
                </form>
            </div>
            
            <!-- Contact Information -->
            <div class="col-lg-4">
                <h2 class="section-title mb-4">Contact Information</h2>
                
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <i class="fas fa-map-marker-alt text-primary fa-2x"></i>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5>Address</h5>
                                <p class="mb-0">123 Luxury Street<br>City Center, CC 12345<br>United States</p>
                            </div>
                        </div>
                        
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <i class="fas fa-phone text-primary fa-2x"></i>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5>Phone</h5>
                                <p class="mb-0">+1 (555) 123-4567<br>+1 (555) 123-4568</p>
                            </div>
                        </div>
                        
                        <div class="d-flex mb-4">
                            <div class="flex-shrink-0">
                                <i class="fas fa-envelope text-primary fa-2x"></i>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5>Email</h5>
                                <p class="mb-0">info@hotelsurya.com<br>reservations@hotelsurya.com</p>
                            </div>
                        </div>
                        
                        <div class="d-flex">
                            <div class="flex-shrink-0">
                                <i class="fas fa-clock text-primary fa-2x"></i>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h5>Hours</h5>
                                <p class="mb-0">24/7 Front Desk<br>Check-in: 3:00 PM<br>Check-out: 11:00 AM</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Map Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title text-center mb-5">Find Us</h2>
        <div class="row">
            <div class="col-12">
                <div class="ratio ratio-21x9">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387193.30591910525!2d-74.25986532962854!3d40.69714941680757!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c24fa5d33f083b%3A0xc80b8f06e177fe62!2sNew%20York%2C%20NY%2C%20USA!5e0!3m2!1sen!2s!4v1640995200000!5m2!1sen!2s" 
                            style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>
</section> 