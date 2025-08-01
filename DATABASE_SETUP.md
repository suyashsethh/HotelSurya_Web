# Hotel Surya - Database & Admin Panel Setup

## 🗄️ Database Integration

Your Hotel Surya website now includes a complete database system for managing bookings and an admin panel for monitoring operations.

### Features Added:

1. **Database Storage**: All bookings are now stored in a database
2. **Admin Panel**: Complete admin interface for managing bookings
3. **Statistics Dashboard**: Real-time booking analytics
4. **Booking Management**: View, update, and delete bookings
5. **Event Tracking**: Separate tracking for room bookings and event inquiries

## 🚀 Quick Start

### 1. Run the Application
```bash
cd HotelSurya-Web
mvnd clean package?
```

### 2. Access the Website
- **Main Website**: http://localhost:8080/HotelSurya-Web/
- **Admin Panel**: http://localhost:8080/HotelSurya-Web/admin/dashboard

### 3. Test the System
1. Go to the main website
2. Make a room booking or send a contact message
3. Check the admin panel to see the booking appear
4. Use admin features to manage bookings

## 📊 Admin Panel Features

### Dashboard (`/admin/dashboard`)
- **Statistics Overview**: Total bookings, room bookings, event bookings, revenue
- **Recent Bookings**: Latest 10 bookings with quick actions
- **Status Breakdown**: Pending, confirmed, and cancelled bookings
- **Quick Actions**: Direct links to different booking views

### All Bookings (`/admin/bookings`)
- **Complete List**: View all bookings in a table format
- **Filter Options**: Filter by booking type and status
- **Management Actions**: 
  - View booking details
  - Update booking status (Pending/Confirmed/Cancelled)
  - Delete bookings
- **Real-time Updates**: Status changes reflect immediately

### Room Bookings (`/admin/room-bookings`)
- **Room-specific**: View only room reservations
- **Detailed Information**: Room type, dates, guests, amount

### Event Bookings (`/admin/event-bookings`)
- **Event Inquiries**: Contact form submissions and event requests
- **Message Details**: View full contact messages

### Pending Bookings (`/admin/pending-bookings`)
- **Action Required**: Bookings that need admin attention
- **Quick Processing**: Easy status updates

### Statistics (`/admin/statistics`)
- **Analytics**: Detailed booking statistics
- **Revenue Tracking**: Total and average booking values
- **Performance Metrics**: Booking trends and patterns

## 🗃️ Database Schema

The system uses an H2 in-memory database for development with the following structure:

```sql
CREATE TABLE bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    guest_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    room_type VARCHAR(50),
    number_of_rooms INT DEFAULT 1,
    number_of_guests INT DEFAULT 1,
    check_in_date DATE,
    check_out_date DATE,
    total_amount DECIMAL(10,2) DEFAULT 0.00,
    booking_status VARCHAR(20) DEFAULT 'PENDING',
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    special_requests TEXT,
    event_type VARCHAR(20) DEFAULT 'ROOM_BOOKING',
    event_details TEXT
);
```

## 🔧 Database Configuration

### Current Setup (Development)
- **Database**: H2 In-Memory Database
- **URL**: `jdbc:h2:mem:hotelsurya`
- **Username**: `sa`
- **Password**: (empty)
- **Console**: http://localhost:8082 (if enabled)

### For Production (MySQL)
To switch to MySQL for production:

1. **Update `spring-servlet.xml`**:
```xml
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
    <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
    <property name="url" value="jdbc:mysql://localhost:3306/hotelsurya"/>
    <property name="username" value="root"/>
    <property name="password" value="root"/>
</bean>
```

2. **Create MySQL Database**:
```sql
CREATE DATABASE hotelsurya;
USE hotelsurya;
-- The table will be created automatically by the application
```

## 📱 How to Use

### For Hotel Staff (Admin Panel)

1. **Access Admin Panel**: Click the gear icon (⚙️) in the main navigation
2. **View Dashboard**: See overview of all bookings and statistics
3. **Manage Bookings**: 
   - Click "View All Bookings" to see complete list
   - Use action buttons to update status or delete bookings
   - Filter by booking type (Room/Event) or status
4. **Process Bookings**:
   - Review pending bookings
   - Confirm valid bookings
   - Cancel invalid or duplicate bookings
5. **Monitor Performance**: Check statistics for business insights

### For Guests (Main Website)

1. **Room Bookings**: 
   - Fill out the booking form
   - Receive confirmation with booking ID
   - Booking is automatically saved to database
2. **Contact Form**: 
   - Send inquiries through contact page
   - Messages are stored as event bookings
   - Admin can review and respond

## 🔒 Security Notes

- **Admin Access**: Currently no authentication required (for development)
- **Production**: Add Spring Security for admin panel protection
- **Data Backup**: Implement regular database backups for production

## 🚀 Deployment

### Local Development
```bash
mvnd clean package
# Deploy to Tomcat or run with embedded server
```

### Production Deployment
1. Configure MySQL database
2. Update database connection settings
3. Add admin authentication
4. Deploy WAR file to production server
5. Set up SSL certificate
6. Configure backup system

## 📈 Business Benefits

1. **Complete Booking Management**: Track all reservations in one place
2. **Real-time Analytics**: Monitor hotel performance
3. **Customer Service**: Quick access to guest information
4. **Revenue Tracking**: Monitor booking values and trends
5. **Operational Efficiency**: Streamlined booking process

## 🆘 Troubleshooting

### Common Issues:

1. **Database Connection Error**: Check if H2 dependencies are included
2. **Admin Panel Not Loading**: Verify component scanning includes all packages
3. **Bookings Not Saving**: Check database table creation
4. **Status Updates Not Working**: Verify JavaScript is enabled

### Debug Steps:
1. Check application logs for errors
2. Verify database table exists
3. Test booking creation manually
4. Check admin controller mappings

---

**Your Hotel Surya website now has a complete booking management system!** 🎉

The admin panel gives you full control over bookings, and the database ensures all data is properly stored and managed. 