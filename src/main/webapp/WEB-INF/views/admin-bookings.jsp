<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Admin Bookings Header -->
<section class="py-4 bg-primary text-white">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="display-5 fw-bold">
                    <i class="fas fa-list me-3"></i>All Bookings
                </h1>
                <p class="lead">Manage and view all hotel bookings</p>
            </div>
        </div>
    </div>
</section>

<!-- Bookings Table -->
<section class="py-5">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <!-- Filter and Search -->
                <div class="card border-0 shadow-sm mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h5 class="mb-3">Filter Bookings</h5>
                                <div class="d-flex gap-2">
                                    <a href="<c:url value='/admin/bookings'/>" class="btn btn-outline-primary btn-sm">All</a>
                                    <a href="<c:url value='/admin/room-bookings'/>" class="btn btn-outline-primary btn-sm">Room Bookings</a>
                                    <a href="<c:url value='/admin/event-bookings'/>" class="btn btn-outline-warning btn-sm">Event Bookings</a>
                                    <a href="<c:url value='/admin/pending-bookings'/>" class="btn btn-outline-warning btn-sm">Pending</a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <h5 class="mb-3">Quick Actions</h5>
                                <a href="<c:url value='/admin/dashboard'/>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                                </a>
                                <a href="<c:url value='/admin/statistics'/>" class="btn btn-info btn-sm">
                                    <i class="fas fa-chart-bar me-1"></i>Statistics
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bookings Table -->
                <div class="card border-0 shadow-sm">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">
                            <i class="fas fa-table me-2"></i>Bookings List (${bookings.size()} total)
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>ID</th>
                                        <th>Guest Details</th>
                                        <th>Booking Type</th>
                                        <th>Room/Event Info</th>
                                        <th>Dates</th>
                                        <th>Status</th>
                                        <th>Amount</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${bookings}" var="booking">
                                        <tr>
                                            <td>
                                                <strong>#${booking.id}</strong><br>
                                                <small class="text-muted">
                                                    <fmt:formatDate value="${booking.bookingDate}" pattern="MMM dd, yyyy"/>
                                                </small>
                                            </td>
                                            <td>
                                                <strong>${booking.guestName}</strong><br>
                                                <small class="text-muted">${booking.email}</small><br>
                                                <small class="text-muted">${booking.phone}</small>
                                            </td>
                                            <td>
                                                <span class="badge ${booking.eventType == 'ROOM_BOOKING' ? 'bg-primary' : 'bg-warning'}">
                                                    ${booking.eventType == 'ROOM_BOOKING' ? 'Room' : 'Event'}
                                                </span>
                                            </td>
                                            <td>
                                                <c:if test="${booking.eventType == 'ROOM_BOOKING'}">
                                                    <strong>${booking.roomType}</strong><br>
                                                    <small class="text-muted">
                                                        ${booking.numberOfRooms} room(s), ${booking.numberOfGuests} guest(s)
                                                    </small>
                                                </c:if>
                                                <c:if test="${booking.eventType == 'EVENT_BOOKING'}">
                                                    <strong>Event</strong><br>
                                                    <small class="text-muted">${booking.eventDetails}</small>
                                                </c:if>
                                            </td>
                                            <td>
                                                <c:if test="${booking.eventType == 'ROOM_BOOKING'}">
                                                    <strong>Check-in:</strong><br>
                                                    <fmt:formatDate value="${booking.checkInDate}" pattern="MMM dd, yyyy"/><br>
                                                    <strong>Check-out:</strong><br>
                                                    <fmt:formatDate value="${booking.checkOutDate}" pattern="MMM dd, yyyy"/>
                                                </c:if>
                                                <c:if test="${booking.eventType == 'EVENT_BOOKING'}">
                                                    <span class="text-muted">N/A</span>
                                                </c:if>
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
                                                <div class="btn-group" role="group">
                                                    <a href="<c:url value='/admin/booking/${booking.id}'/>" 
                                                       class="btn btn-sm btn-outline-primary" title="View Details">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                    
                                                    <!-- Status Update Dropdown -->
                                                    <div class="btn-group" role="group">
                                                        <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle" 
                                                                data-bs-toggle="dropdown" aria-expanded="false">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                        <ul class="dropdown-menu">
                                                            <li><a class="dropdown-item status-update" href="#" 
                                                                   data-booking-id="${booking.id}" data-status="PENDING">
                                                                <i class="fas fa-clock text-warning me-2"></i>Mark Pending
                                                            </a></li>
                                                            <li><a class="dropdown-item status-update" href="#" 
                                                                   data-booking-id="${booking.id}" data-status="CONFIRMED">
                                                                <i class="fas fa-check text-success me-2"></i>Confirm
                                                            </a></li>
                                                            <li><a class="dropdown-item status-update" href="#" 
                                                                   data-booking-id="${booking.id}" data-status="CANCELLED">
                                                                <i class="fas fa-times text-danger me-2"></i>Cancel
                                                            </a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    <!-- Delete Button -->
                                                    <button type="button" class="btn btn-sm btn-outline-danger delete-booking" 
                                                            data-booking-id="${booking.id}" title="Delete Booking">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        
                        <!-- Empty State -->
                        <c:if test="${empty bookings}">
                            <div class="text-center py-5">
                                <i class="fas fa-inbox fa-3x text-muted mb-3"></i>
                                <h4 class="text-muted">No bookings found</h4>
                                <p class="text-muted">There are no bookings to display at the moment.</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- JavaScript for Admin Actions -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Status Update
    document.querySelectorAll('.status-update').forEach(function(link) {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const bookingId = this.getAttribute('data-booking-id');
            const status = this.getAttribute('data-status');
            
            if (confirm('Are you sure you want to update this booking status to ' + status + '?')) {
                fetch('/hotelsurya/admin/booking/' + bookingId + '/status', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'status=' + status
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        alert('Booking status updated successfully!');
                        location.reload();
                    } else {
                        alert('Error updating booking status: ' + result);
                    }
                })
                .catch(error => {
                    alert('Error updating booking status: ' + error);
                });
            }
        });
    });
    
    // Delete Booking
    document.querySelectorAll('.delete-booking').forEach(function(button) {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            
            const bookingId = this.getAttribute('data-booking-id');
            
            if (confirm('Are you sure you want to delete this booking? This action cannot be undone.')) {
                fetch('/hotelsurya/admin/booking/' + bookingId + '/delete', {
                    method: 'POST'
                })
                .then(response => response.text())
                .then(result => {
                    if (result === 'success') {
                        alert('Booking deleted successfully!');
                        location.reload();
                    } else {
                        alert('Error deleting booking: ' + result);
                    }
                })
                .catch(error => {
                    alert('Error deleting booking: ' + error);
                });
            }
        });
    });
});
</script> 