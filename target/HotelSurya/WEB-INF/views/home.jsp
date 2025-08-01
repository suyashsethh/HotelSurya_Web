<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4">Welcome to Hotel Surya</h1>
                <p class="lead mb-4">Experience luxury, comfort, and exceptional service in the heart of the city. Your perfect stay awaits.</p>
                
                <!-- Dynamic Date Display -->
                <p class="text-light mb-4">
                    <i class="fas fa-calendar me-2"></i>
                    Today: <fmt:formatDate value="${currentDate}" pattern="EEEE, MMMM dd, yyyy"/>
                </p>
                
                <div class="d-flex gap-3">
                    <a href="<c:url value='/booking'/>" class="btn btn-primary btn-lg"><i class="fas fa-calendar-check me-2"></i>Book Now</a>
                    <a href="<c:url value='/rooms'/>" class="btn btn-outline-light btn-lg"><i class="fas fa-bed me-2"></i>View Rooms</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Special Offers Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="text-center mb-5">Special Offers</h2>
        <div class="row">
            <c:forEach items="${specialOffers}" var="offer" varStatus="status">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm">
                        <div class="card-body text-center">
                            <i class="fas fa-gift text-primary mb-3" style="font-size: 2rem;"></i>
                            <h5 class="card-title">Special Offer ${status.index + 1}</h5>
                            <p class="card-text">${offer}</p>
                            <a href="<c:url value='/booking'/>" class="btn btn-outline-primary">Book Now</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Featured Rooms Section -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">Featured Rooms</h2>
        <div class="row">
            <c:forEach items="${featuredRooms}" var="room" varStatus="status">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">${room}</h5>
                            <p class="card-text">Experience luxury and comfort in our premium ${room}.</p>
                            <a href="<c:url value='/rooms'/>" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row text-center">
            <div class="col-lg-4 mb-4">
                <div class="amenity-icon">
                    <i class="fas fa-concierge-bell"></i>
                </div>
                <h4>24/7 Service</h4>
                <p>Round-the-clock concierge service to cater to all your needs during your stay.</p>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="amenity-icon">
                    <i class="fas fa-wifi"></i>
                </div>
                <h4>Free WiFi</h4>
                <p>High-speed internet access throughout the hotel for your convenience.</p>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="amenity-icon">
                    <i class="fas fa-parking"></i>
                </div>
                <h4>Free Parking</h4>
                <p>Complimentary parking available for all guests during their stay.</p>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section class="py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h2 class="section-title">About Hotel Surya</h2>
                <p class="lead">Located in the heart of the city, Hotel Surya offers a perfect blend of luxury, comfort, and modern amenities.</p>
                <p>Our hotel features elegantly designed rooms, world-class dining options, and exceptional service that ensures every guest feels special. Whether you're here for business or leisure, we provide everything you need for a memorable stay.</p>
                <a href="<c:url value='/about'/>" class="btn btn-primary">Learn More</a>
            </div>
            <div class="col-lg-6">
                <img src="https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?ixlib=rb-4.0.3" 
                     alt="Hotel Surya" class="img-fluid rounded">
            </div>
        </div>
    </div>
</section>

<!-- Rooms Preview -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title text-center">Our Rooms</h2>
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card room-card">
                    <img src="https://images.unsplash.com/photo-1631049307264-da0ec9d70304?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Deluxe Room">
                    <div class="card-body">
                        <h5 class="card-title">Deluxe Room</h5>
                        <p class="card-text">Spacious and comfortable rooms with modern amenities and city views.</p>
                        <p class="text-primary fw-bold">From $150/night</p>
                        <a href="<c:url value='/rooms'/>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card room-card">
                    <img src="https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Suite">
                    <div class="card-body">
                        <h5 class="card-title">Executive Suite</h5>
                        <p class="card-text">Luxurious suites with separate living areas and premium amenities.</p>
                        <p class="text-primary fw-bold">From $250/night</p>
                        <a href="<c:url value='/rooms'/>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card room-card">
                    <img src="https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Presidential Suite">
                    <div class="card-body">
                        <h5 class="card-title">Presidential Suite</h5>
                        <p class="card-text">Ultimate luxury with panoramic views and exclusive services.</p>
                        <p class="text-primary fw-bold">From $500/night</p>
                        <a href="<c:url value='/rooms'/>" class="btn btn-primary">View Details</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials -->
<section class="py-5">
    <div class="container">
        <h2 class="section-title text-center">What Our Guests Say</h2>
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-star text-warning mb-3"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <p class="card-text">"Exceptional service and beautiful rooms. The staff went above and beyond to make our stay memorable."</p>
                        <h6 class="card-title">- Sarah Johnson</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-star text-warning mb-3"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <p class="card-text">"Perfect location, amazing amenities, and the food was outstanding. Highly recommended!"</p>
                        <h6 class="card-title">- Michael Chen</h6>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-star text-warning mb-3"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <i class="fas fa-star text-warning"></i>
                        <p class="card-text">"The best hotel experience I've ever had. Everything was perfect from check-in to check-out."</p>
                        <h6 class="card-title">- Emily Rodriguez</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-5 bg-primary text-white">
    <div class="container text-center">
        <h2 class="mb-4">Ready to Experience Luxury?</h2>
        <p class="lead mb-4">Book your stay today and enjoy our special rates and exclusive amenities.</p>
        <a href="<c:url value='/booking'/>" class="btn btn-light btn-lg">
            <i class="fas fa-calendar-check me-2"></i>Book Your Stay
        </a>
    </div>
</section> 