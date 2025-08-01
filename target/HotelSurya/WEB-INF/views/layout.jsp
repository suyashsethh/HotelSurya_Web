<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    
    <style>
        :root {
            --primary-color: #d4af37;
            --secondary-color: #2c3e50;
            --accent-color: #e74c3c;
            --text-dark: #2c3e50;
            --text-light: #7f8c8d;
            --bg-light: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: var(--text-dark);
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--secondary-color), #34495e);
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--primary-color) !important;
        }
        
        .nav-link {
            color: white !important;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 0 10px;
        }
        
        .nav-link:hover {
            color: var(--primary-color) !important;
            transform: translateY(-2px);
        }
        
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                        url('https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-4.0.3');
            background-size: cover;
            background-position: center;
            min-height: 80vh;
            display: flex;
            align-items: center;
            color: white;
        }
        
        .btn-primary {
            background: var(--primary-color);
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background: #b8941f;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
        }
        
        .section-title {
            color: var(--secondary-color);
            font-weight: 700;
            margin-bottom: 30px;
            position: relative;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 3px;
            background: var(--primary-color);
        }
        
        .footer {
            background: var(--secondary-color);
            color: white;
            padding: 50px 0 20px;
        }
        
        .footer h5 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }
        
        .social-links a {
            color: white;
            margin-right: 15px;
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }
        
        .social-links a:hover {
            color: var(--primary-color);
        }
        
        .room-card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        
        .room-card:hover {
            transform: translateY(-5px);
        }
        
        .amenity-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand" href="<c:url value='/'/>">
                <i class="fas fa-hotel me-2"></i>Hotel Surya
            </a>
            
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link ${page == 'home' ? 'active' : ''}" href="<c:url value='/'/>">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'rooms' ? 'active' : ''}" href="<c:url value='/rooms'/>">Rooms</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'dining' ? 'active' : ''}" href="<c:url value='/dining'/>">Dining</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'amenities' ? 'active' : ''}" href="<c:url value='/amenities'/>">Amenities</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'gallery' ? 'active' : ''}" href="<c:url value='/gallery'/>">Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'about' ? 'active' : ''}" href="<c:url value='/about'/>">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link ${page == 'contact' ? 'active' : ''}" href="<c:url value='/contact'/>">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ms-2" href="<c:url value='/booking'/>">Book Now</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <main style="margin-top: 80px;">
        <jsp:include page="${page}.jsp"/>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5><i class="fas fa-hotel me-2"></i>Hotel Surya</h5>
                    <p>Experience luxury and comfort in the heart of the city. Your perfect stay awaits at Hotel Surya.</p>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="<c:url value='/rooms'/>" class="text-white">Rooms & Suites</a></li>
                        <li><a href="<c:url value='/dining'/>" class="text-white">Dining</a></li>
                        <li><a href="<c:url value='/amenities'/>" class="text-white">Amenities</a></li>
                        <li><a href="<c:url value='/gallery'/>" class="text-white">Gallery</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contact Info</h5>
                    <p><i class="fas fa-map-marker-alt me-2"></i>123 Luxury Street, City Center</p>
                    <p><i class="fas fa-phone me-2"></i>+1 (555) 123-4567</p>
                    <p><i class="fas fa-envelope me-2"></i>info@hotelsurya.com</p>
                </div>
            </div>
            <hr class="mt-4">
            <div class="text-center">
                <p>&copy; 2024 Hotel Surya. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="<c:url value='/js/main.js'/>"></script>
</body>
</html> 