<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Admin Dashboard Header -->
<section class="py-4 bg-primary text-white">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 fw-bold">
                    <i class="fas fa-tachometer-alt me-3"></i>Admin Dashboard
                </h1>
                <p class="lead">Manage bookings, view statistics, and monitor hotel operations</p>
            </div>
        </div>
    </div>
</section>

<!-- Statistics Cards -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <!-- Total Bookings -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center">
                        <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fas fa-calendar-check text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h3 class="fw-bold text-primary">${stats.totalBookings}</h3>
                        <p class="text-muted mb-0">Total Bookings</p>
                    </div>
                </div>
            </div>

            <!-- Room Bookings -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center">
                        <div class="bg-success bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fas fa-bed text-success" style="font-size: 1.5rem;"></i>
                        </div>
                        <h3 class="fw-bold text-success">${stats.totalRoomBookings}</h3>
                        <p class="text-muted mb-0">Room Bookings</p>
                    </div>
                </div>
            </div>

            <!-- Event Bookings -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center">
                        <div class="bg-warning bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fas fa-calendar-alt text-warning" style="font-size: 1.5rem;"></i>
                        </div>
                        <h3 class="fw-bold text-warning">${stats.totalEventBookings}</h3>
                        <p class="text-muted mb-0">Event Bookings</p>
                    </div>
                </div>
            </div>

            <!-- Total Revenue -->
            <div class="col-lg-3 col-md-6 mb-4">
                <div class="card border-0 shadow-sm h-100">
                    <div class="card-body text-center">
                        <div class="bg-info bg-opacity-10 rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fas fa-dollar-sign text-info" style="font-size: 1.5rem;"></i>
                        </div>
                        <h3 class="fw-bold text-info">$<fmt:formatNumber value="${stats.totalRevenue}" pattern="#,##0.00"/></h3>
                        <p class="text-muted mb-0">Total Revenue</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Status Breakdown -->
        <div class="row mt-4">
            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0"><i class="fas fa-clock text-warning me-2"></i>Pending Bookings</h5>
                    </div>
                    <div class="card-body text-center">
                        <h2 class="text-warning">${stats.pendingBookings}</h2>
                        <a href="<c:url value='/admin/pending-bookings'/>" class="btn btn-outline-warning btn-sm">View All</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0"><i class="fas fa-check-circle text-success me-2"></i>Confirmed Bookings</h5>
                    </div>
                    <div class="card-body text-center">
                        <h2 class="text-success">${stats.confirmedBookings}</h2>
                        <a href="<c:url value='/admin/bookings'/>" class="btn btn-outline-success btn-sm">View All</a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mb-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0"><i class="fas fa-times-circle text-danger me-2"></i>Cancelled Bookings</h5>
                    </div>
                    <div class="card-body text-center">
                        <h2 class="text-danger">${stats.cancelledBookings}</h2>
                        <a href="<c:url value='/admin/bookings'/>" class="btn btn-outline-danger btn-sm">View All</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Recent Bookings -->
<section class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="fas fa-list me-2"></i>Recent Bookings</h2>
                    <a href="<c:url value='/admin/bookings'/>" class="btn btn-primary">View All Bookings</a>
                </div>

                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Guest Name</th>
                                        <th>Type</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${recentBookings}" var="booking">
                                        <tr>
                                            <td>#${booking.id}</td>
                                            <td>
                                                <strong>${booking.guestName}</strong><br>
                                                <small class="text-muted">${booking.email}</small>
                                            </td>
                                            <td>
                                                <span class="badge ${booking.eventType == 'ROOM_BOOKING' ? 'bg-primary' : 'bg-warning'}">
                                                    ${booking.eventType == 'ROOM_BOOKING' ? 'Room' : 'Event'}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge ${booking.bookingStatus == 'CONFIRMED' ? 'bg-success' : 
                                                                   booking.bookingStatus == 'PENDING' ? 'bg-warning' : 'bg-danger'}">
                                                    ${booking.bookingStatus}
                                                </span>
                                            </td>
                                            <td>
                                                <strong>$<fmt:formatNumber value="${booking.totalAmount}" pattern="#,##0.00"/></strong>
                                            </td>
                                            <td>
                                                <fmt:formatDate value="${booking.bookingDate}" pattern="MMM dd, yyyy"/>
                                            </td>
                                            <td>
                                                <a href="<c:url value='/admin/booking/${booking.id}'/>" class="btn btn-sm btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Quick Actions -->
<section class="py-5">
    <div class="container">
        <h2 class="mb-4"><i class="fas fa-cogs me-2"></i>Quick Actions</h2>
        <div class="row">
            <div class="col-lg-3 col-md-6 mb-3">
                <a href="<c:url value='/admin/room-bookings'/>" class="btn btn-outline-primary w-100 py-3">
                    <i class="fas fa-bed me-2"></i>Room Bookings
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <a href="<c:url value='/admin/event-bookings'/>" class="btn btn-outline-warning w-100 py-3">
                    <i class="fas fa-calendar-alt me-2"></i>Event Bookings
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <a href="<c:url value='/admin/pending-bookings'/>" class="btn btn-outline-warning w-100 py-3">
                    <i class="fas fa-clock me-2"></i>Pending Bookings
                </a>
            </div>
            <div class="col-lg-3 col-md-6 mb-3">
                <a href="<c:url value='/admin/statistics'/>" class="btn btn-outline-info w-100 py-3">
                    <i class="fas fa-chart-bar me-2"></i>Statistics
                </a>
            </div>
        </div>
    </div>
</section> 