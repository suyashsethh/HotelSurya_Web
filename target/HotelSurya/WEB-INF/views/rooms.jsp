<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Hero Section -->
<section class="hero-section" style="background-image: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80');">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4 text-white">Rooms & Suites</h1>
                <p class="lead mb-4 text-white">Choose from our luxurious accommodations designed for your comfort and relaxation.</p>
                
                <!-- Dynamic Room Statistics -->
                <div class="row text-white">
                    <div class="col-md-4">
                        <div class="text-center">
                            <h3 class="fw-bold">${totalRooms}</h3>
                            <p>Total Rooms</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="text-center">
                            <h3 class="fw-bold">${availableRooms}</h3>
                            <p>Available Now</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="text-center">
                            <h3 class="fw-bold">24/7</h3>
                            <p>Service</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Rooms Section -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">Available Rooms</h2>
        <div class="row">
            <c:forEach items="${rooms}" var="room">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 shadow">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <h5 class="card-title">${room.name}</h5>
                                <span class="badge ${room.available ? 'bg-success' : 'bg-danger'}">
                                    ${room.available ? 'Available' : 'Booked'}
                                </span>
                            </div>
                            <p class="card-text">${room.description}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="h5 text-primary mb-0">
                                    $<fmt:formatNumber value="${room.price}" pattern="#,##0.00"/>
                                </span>
                                <c:if test="${room.available}">
                                    <a href="<c:url value='/booking/reserve'/>" class="btn btn-primary">
                                        <i class="fas fa-calendar-check me-2"></i>Book Now
                                    </a>
                                </c:if>
                                <c:if test="${!room.available}">
                                    <button class="btn btn-secondary" disabled>
                                        <i class="fas fa-times me-2"></i>Not Available
                                    </button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- Amenities Section -->
<section class="py-5 bg-light">
    <div class="container">
        <h2 class="section-title text-center mb-5">Room Amenities</h2>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-4 text-center">
                <div class="amenity-icon">
                    <i class="fas fa-wifi"></i>
                </div>
                <h5>Free WiFi</h5>
                <p>High-speed internet throughout</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 text-center">
                <div class="amenity-icon">
                    <i class="fas fa-tv"></i>
                </div>
                <h5>Smart TV</h5>
                <p>Premium channels and streaming</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 text-center">
                <div class="amenity-icon">
                    <i class="fas fa-coffee"></i>
                </div>
                <h5>Coffee Station</h5>
                <p>In-room coffee and tea</p>
            </div>
            <div class="col-lg-3 col-md-6 mb-4 text-center">
                <div class="amenity-icon">
                    <i class="fas fa-snowflake"></i>
                </div>
                <h5>Climate Control</h5>
                <p>Individual temperature control</p>
            </div>
        </div>
    </div>
</section> 