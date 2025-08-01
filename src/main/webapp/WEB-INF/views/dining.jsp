<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Hero Section -->
<section class="hero-section" style="min-height: 50vh;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4">Dining at Hotel Surya</h1>
                <p class="lead mb-4">Experience culinary excellence with our world-class restaurants and dining options.</p>
            </div>
        </div>
    </div>
</section>

<!-- Restaurants Section -->
<section class="py-5">
    <div class="container">
        <h2 class="section-title text-center mb-5">Our Restaurants</h2>
        
        <!-- Main Restaurant -->
        <div class="row mb-5 align-items-center">
            <div class="col-lg-6">
                <img src="https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-4.0.3" 
                     alt="Surya Restaurant" class="img-fluid rounded">
            </div>
            <div class="col-lg-6">
                <h3 class="mb-3">Surya Restaurant</h3>
                <p class="lead text-primary fw-bold mb-3">Fine Dining Experience</p>
                <p>Our signature restaurant offers an elegant dining experience with a menu that combines traditional flavors with modern culinary techniques. Perfect for romantic dinners and special occasions.</p>
                <ul class="list-unstyled mb-4">
                    <li><i class="fas fa-clock text-primary me-2"></i>Breakfast: 6:30 AM - 10:30 AM</li>
                    <li><i class="fas fa-clock text-primary me-2"></i>Lunch: 12:00 PM - 2:30 PM</li>
                    <li><i class="fas fa-clock text-primary me-2"></i>Dinner: 6:00 PM - 10:30 PM</li>
                    <li><i class="fas fa-star text-warning me-2"></i>International & Local Cuisine</li>
                </ul>
                <a href="#menu" class="btn btn-primary">View Menu</a>
            </div>
        </div>

        <!-- Rooftop Bar -->
        <div class="row mb-5 align-items-center">
            <div class="col-lg-6 order-lg-2">
                <img src="https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixlib=rb-4.0.3" 
                     alt="Sky Lounge" class="img-fluid rounded">
            </div>
            <div class="col-lg-6 order-lg-1">
                <h3 class="mb-3">Sky Lounge</h3>
                <p class="lead text-primary fw-bold mb-3">Rooftop Bar & Grill</p>
                <p>Enjoy breathtaking city views while sipping on handcrafted cocktails and savoring grilled specialties. The perfect spot for sunset drinks and casual dining.</p>
                <ul class="list-unstyled mb-4">
                    <li><i class="fas fa-clock text-primary me-2"></i>Open: 4:00 PM - 12:00 AM</li>
                    <li><i class="fas fa-cocktail text-primary me-2"></i>Craft Cocktails & Premium Spirits</li>
                    <li><i class="fas fa-fire text-primary me-2"></i>Grilled Specialties</li>
                    <li><i class="fas fa-music text-primary me-2"></i>Live Music on Weekends</li>
                </ul>
                <a href="#menu" class="btn btn-primary">View Menu</a>
            </div>
        </div>

        <!-- Coffee Shop -->
        <div class="row mb-5 align-items-center">
            <div class="col-lg-6">
                <img src="https://images.unsplash.com/photo-1501339847302-ac426a4a7cbb?ixlib=rb-4.0.3" 
                     alt="Café Surya" class="img-fluid rounded">
            </div>
            <div class="col-lg-6">
                <h3 class="mb-3">Café Surya</h3>
                <p class="lead text-primary fw-bold mb-3">Casual Coffee & Light Meals</p>
                <p>A cozy café perfect for morning coffee, afternoon tea, or light meals throughout the day. Features artisanal coffee, fresh pastries, and healthy options.</p>
                <ul class="list-unstyled mb-4">
                    <li><i class="fas fa-clock text-primary me-2"></i>Open: 6:00 AM - 8:00 PM</li>
                    <li><i class="fas fa-coffee text-primary me-2"></i>Artisanal Coffee & Tea</li>
                    <li><i class="fas fa-bread-slice text-primary me-2"></i>Fresh Pastries & Sandwiches</li>
                    <li><i class="fas fa-wifi text-primary me-2"></i>Free WiFi for Guests</li>
                </ul>
                <a href="#menu" class="btn btn-primary">View Menu</a>
            </div>
        </div>
    </div>
</section>

<!-- Menu Highlights -->
<section class="py-5 bg-light" id="menu">
    <div class="container">
        <h2 class="section-title text-center mb-5">Menu Highlights</h2>
        <div class="row">
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Signature Dish">
                    <div class="card-body">
                        <h5 class="card-title">Grilled Salmon</h5>
                        <p class="card-text">Fresh Atlantic salmon with herbs and lemon butter sauce, served with seasonal vegetables.</p>
                        <p class="text-primary fw-bold">$28</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img src="https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Signature Dish">
                    <div class="card-body">
                        <h5 class="card-title">Wagyu Beef Steak</h5>
                        <p class="card-text">Premium grade Wagyu beef with truffle mashed potatoes and red wine reduction.</p>
                        <p class="text-primary fw-bold">$45</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img src="https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3" 
                         class="card-img-top" alt="Signature Dish">
                    <div class="card-body">
                        <h5 class="card-title">Truffle Pasta</h5>
                        <p class="card-text">Homemade fettuccine with black truffle, parmesan, and fresh herbs.</p>
                        <p class="text-primary fw-bold">$22</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Private Dining -->
<section class="py-5">
    <div class="container">
        <h2 class="section-title text-center mb-5">Private Dining</h2>
        <div class="row">
            <div class="col-lg-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-users me-2"></i>Private Events</h5>
                        <p class="card-text">Host your special events in our elegant private dining rooms. Perfect for business meetings, family celebrations, and intimate gatherings.</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>Customized menus</li>
                            <li><i class="fas fa-check text-success me-2"></i>Professional service</li>
                            <li><i class="fas fa-check text-success me-2"></i>Audio-visual equipment</li>
                        </ul>
                        <a href="<c:url value='/contact'/>" class="btn btn-primary">Inquire Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 mb-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-utensils me-2"></i>Room Service</h5>
                        <p class="card-text">Enjoy our delicious cuisine in the comfort of your room. Available 24/7 with a wide selection of dishes from our restaurants.</p>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i>24/7 availability</li>
                            <li><i class="fas fa-check text-success me-2"></i>Quick delivery</li>
                            <li><i class="fas fa-check text-success me-2"></i>Full restaurant menu</li>
                        </ul>
                        <a href="<c:url value='/contact'/>" class="btn btn-primary">Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> 