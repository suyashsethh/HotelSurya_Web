# MySQL Setup Guide for Hotel Surya

## Current Configuration Status ✅

**The application is currently configured to use H2 file-based database** for development with **persistent data storage**. This allows you to run the application right away with data that survives server restarts.

## Quick Start (Current Setup)

1. **Build and Run:**
   ```bash
   mvn clean package
   mvn tomcat7:run
   ```

2. **Access Application:**
   - Main Website: http://localhost:8080/hotelsurya
   - Admin Panel: http://localhost:8080/hotelsurya/admin/dashboard
   - H2 Database Console: http://localhost:8082

3. **H2 Database Connection Details:**
   - URL: `jdbc:h2:file:./data/hotelsurya`
   - Username: `sa`
   - Password: (empty)
   - **Data Storage**: `./data/hotelsurya.mv.db` (persistent file)

## Switching to MySQL (Production Setup)

### Prerequisites

1. **Install MySQL Server:**
   ```bash
   # Ubuntu/Debian
   sudo apt update
   sudo apt install mysql-server mysql-client
   
   # CentOS/RHEL
   sudo yum install mysql-server mysql
   
   # macOS
   brew install mysql
   ```

2. **Start MySQL Service:**
   ```bash
   # Ubuntu/Debian
   sudo systemctl start mysql
   sudo systemctl enable mysql
   
   # CentOS/RHEL
   sudo systemctl start mysqld
   sudo systemctl enable mysqld
   
   # macOS
   brew services start mysql
   ```

### Database Setup

1. **Run MySQL Setup Script:**
   ```bash
   mysql -u root -p < mysql-setup.sql
   ```

2. **Verify Database Creation:**
   ```bash
   mysql -u root -p
   ```
   ```sql
   SHOW DATABASES;
   USE hotel_surya;
   SHOW TABLES;
   SELECT COUNT(*) FROM bookings;
   ```

### Application Configuration

1. **Update Spring Configuration:**
   
   Edit `src/main/webapp/WEB-INF/spring-servlet.xml`:
   
   **Comment out H2 configuration:**
   ```xml
   <!-- H2 Database DataSource for development -->
   <!--<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
       <property name="driverClassName" value="org.h2.Driver"/>
       <property name="url" value="jdbc:h2:mem:hotelsurya;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE"/>
       <property name="username" value="sa"/>
       <property name="password" value=""/>
   </bean>-->
   ```
   
   **Uncomment MySQL configuration:**
   ```xml
   <!-- MySQL Database DataSource for production -->
   <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
       <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
       <property name="url" value="jdbc:mysql://localhost:3306/hotel_surya?useSSL=false&amp;allowPublicKeyRetrieval=true&amp;serverTimezone=UTC"/>
       <property name="username" value="root"/>
       <property name="password" value="root"/>
   </bean>
   ```

2. **Update Database Credentials:**
   
   Replace `root/root` with your actual MySQL credentials:
   ```xml
   <property name="username" value="your_mysql_username"/>
   <property name="password" value="your_mysql_password"/>
   ```

3. **Comment out H2 Console:**
   ```xml
   <!-- H2 Console for database management (optional) -->
   <!--<bean id="h2Console" class="org.h2.tools.Server" factory-method="createWebServer" init-method="start"
         destroy-method="stop">
       <constructor-arg value="-web,-webAllowOthers,-webPort,8082"/>
   </bean>-->
   ```

### Testing MySQL Connection

1. **Rebuild and Deploy:**
   ```bash
   mvn clean package
   mvn tomcat7:run
   ```

2. **Test Application:**
   - Visit: http://localhost:8080/hotelsurya
   - Create a test booking
   - Check admin panel: http://localhost:8080/hotelsurya/admin/dashboard
   - Verify data in MySQL:
     ```sql
     SELECT * FROM bookings ORDER BY booking_date DESC LIMIT 5;
     ```

## Database Configuration Options

### Option 1: Default Root User
```xml
<property name="username" value="root"/>
<property name="password" value="your_root_password"/>
```

### Option 2: Dedicated Application User (Recommended)
```sql
CREATE USER 'hotelapp'@'localhost' IDENTIFIED BY 'secure_password_123';
GRANT ALL PRIVILEGES ON hotel_surya.* TO 'hotelapp'@'localhost';
FLUSH PRIVILEGES;
```

```xml
<property name="username" value="hotelapp"/>
<property name="password" value="secure_password_123"/>
```

### Option 3: Remote MySQL Server
```xml
<property name="url" value="jdbc:mysql://your-mysql-server.com:3306/hotel_surya?useSSL=true&amp;serverTimezone=UTC"/>
```

## Production Deployment Considerations

### Security
1. **Use SSL Connection:**
   ```xml
   <property name="url" value="jdbc:mysql://localhost:3306/hotel_surya?useSSL=true&amp;requireSSL=true&amp;serverTimezone=UTC"/>
   ```

2. **Create Dedicated Database User:**
   - Don't use root user in production
   - Use strong passwords
   - Limit privileges to necessary operations only

3. **Network Security:**
   - Configure MySQL to bind to specific interfaces
   - Use firewall rules to restrict access
   - Consider VPN for remote connections

### Performance
1. **Connection Pooling:**
   Consider using a connection pool like HikariCP:
   ```xml
   <bean id="dataSource" class="com.zaxxer.hikari.HikariDataSource">
       <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
       <property name="jdbcUrl" value="jdbc:mysql://localhost:3306/hotel_surya"/>
       <property name="username" value="hotelapp"/>
       <property name="password" value="secure_password"/>
       <property name="maximumPoolSize" value="10"/>
   </bean>
   ```

2. **Database Optimization:**
   - Add indexes for frequently queried columns
   - Regular database maintenance
   - Monitor query performance

### Backup
1. **Regular Backups:**
   ```bash
   mysqldump -u root -p hotel_surya > hotel_surya_backup_$(date +%Y%m%d).sql
   ```

2. **Automated Backup Script:**
   ```bash
   #!/bin/bash
   BACKUP_DIR="/path/to/backups"
   DATE=$(date +%Y%m%d_%H%M%S)
   mysqldump -u hotelapp -p hotel_surya > $BACKUP_DIR/hotel_surya_$DATE.sql
   ```

## Troubleshooting

### Common Issues

1. **Connection Refused:**
   - Check if MySQL service is running
   - Verify port 3306 is open
   - Check MySQL configuration

2. **Authentication Failed:**
   - Verify username/password
   - Check user privileges
   - Ensure user can connect from application host

3. **Database Not Found:**
   - Run the setup script: `mysql -u root -p < mysql-setup.sql`
   - Verify database exists: `SHOW DATABASES;`

4. **Table Creation Failed:**
   - Check user has CREATE privileges
   - Verify SQL syntax compatibility
   - Check MySQL version compatibility

### Logs
- Application logs: Check Tomcat logs for JDBC errors
- MySQL logs: Check `/var/log/mysql/error.log`

## Quick Switch Commands

### Switch to MySQL:
```bash
# 1. Update spring-servlet.xml (uncomment MySQL, comment H2)
# 2. Rebuild
mvn clean package
mvn tomcat7:run
```

### Switch back to H2:
```bash
# 1. Update spring-servlet.xml (uncomment H2, comment MySQL)
# 2. Rebuild
mvn clean package
mvn tomcat7:run
```

---

## Summary

- ✅ **Current Setup**: H2 file-based database with persistent storage (ready to use)
- 🔄 **MySQL Ready**: Configuration and scripts prepared
- 📝 **Easy Switch**: Simple configuration changes
- 🚀 **Production Ready**: Complete setup guide provided

The application is currently working with H2 database. Follow this guide when you're ready to switch to MySQL for production deployment.