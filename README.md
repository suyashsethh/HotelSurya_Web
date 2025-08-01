# Hotel Surya - Spring MVC Website

A modern, responsive hotel website built with Spring MVC, featuring room booking, contact forms, and a beautiful user interface.

## 🌟 Features

- **Responsive Design**: Mobile-friendly interface using Bootstrap 5
- **Room Booking System**: Interactive booking forms with validation
- **Contact Management**: Contact forms with email integration
- **Modern UI/UX**: Beautiful animations and user experience
- **SEO Optimized**: Meta tags and structured content
- **Cross-browser Compatible**: Works on all modern browsers

## 🏗️ Technology Stack

- **Backend**: Spring MVC 5.3.33
- **Frontend**: Bootstrap 5, Font Awesome, Custom CSS/JS
- **Build Tool**: Maven 3.x
- **Java Version**: 17
- **Server**: Apache Tomcat 9.x/10.x

## 📁 Project Structure

```
HotelSurya-Web/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/hotelsurya/
│   │   │       └── controller/
│   │   │           ├── HomeController.java
│   │   │           └── BookingController.java
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── views/
│   │       │   │   ├── home.jsp
│   │       │   │   ├── rooms.jsp
│   │       │   │   ├── contact.jsp
│   │       │   │   └── ...
│   │       │   ├── web.xml
│   │       │   └── spring-servlet.xml
│   │       ├── css/
│   │       ├── js/
│   │       └── images/
├── pom.xml
└── README.md
```

## 🚀 Quick Start

### Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- Apache Tomcat 9.x/10.x

### Local Development

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd HotelSurya-Web
   ```

2. **Build the project**
   ```bash
   mvn clean package
   ```

3. **Deploy to Tomcat**
   - Copy `target/HotelSurya.war` to Tomcat's `webapps` directory
   - Start Tomcat server
   - Access at `http://localhost:8080/HotelSurya`

### Using Maven Tomcat Plugin

```bash
mvn tomcat7:run
```
Then access at `http://localhost:8080/hotelsurya`

## 🌐 Online Deployment

### Option 1: Traditional Hosting

1. **Build the WAR file**
   ```bash
   mvn clean package
   ```

2. **Upload to hosting provider**
   - Upload `target/HotelSurya.war` to your hosting provider
   - Configure domain settings
   - Set up SSL certificate

### Option 2: Cloud Platforms

#### Heroku
1. Create `Procfile`:
   ```
   web: java -jar target/dependency/webapp-runner.jar --port $PORT target/*.war
   ```

2. Deploy:
   ```bash
   heroku create hotelsurya-app
   git push heroku main
   ```

#### AWS Elastic Beanstalk
1. Create `.ebextensions/application.properties`
2. Deploy using AWS CLI or console

#### Google Cloud Platform
1. Use App Engine or Cloud Run
2. Configure `app.yaml` for App Engine

### Option 3: VPS Deployment

1. **Set up server** (Ubuntu/CentOS)
2. **Install Java and Tomcat**
   ```bash
   sudo apt update
   sudo apt install openjdk-17-jdk tomcat9
   ```

3. **Deploy application**
   ```bash
   sudo cp target/HotelSurya.war /var/lib/tomcat9/webapps/
   sudo systemctl restart tomcat9
   ```

4. **Configure Nginx** (optional)
   ```nginx
   server {
       listen 80;
       server_name yourdomain.com;
       
       location / {
           proxy_pass http://localhost:8080/HotelSurya;
           proxy_set_header Host $host;
           proxy_set_header X-Real-IP $remote_addr;
       }
   }
   ```

## 🔧 Configuration

### Database Configuration (Optional)

To add database support, add these dependencies to `pom.xml`:

```xml
<!-- Spring Data JPA -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>

<!-- MySQL Connector -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
</dependency>
```

### Email Configuration

Configure email settings in `application.properties`:

```properties
spring.mail.host=smtp.gmail.com
spring.mail.port=587
spring.mail.username=your-email@gmail.com
spring.mail.password=your-app-password
spring.mail.properties.mail.smtp.auth=true
spring.mail.properties.mail.smtp.starttls.enable=true
```

## 📱 Pages

- **Home** (`/`) - Landing page with hero section and features
- **Rooms** (`/rooms`) - Room types and pricing
- **Dining** (`/dining`) - Restaurant information
- **Amenities** (`/amenities`) - Hotel facilities
- **Gallery** (`/gallery`) - Photo gallery
- **About** (`/about`) - Hotel information
- **Contact** (`/contact`) - Contact form
- **Booking** (`/booking`) - Room reservation

## 🎨 Customization

### Colors
Modify CSS variables in `layout.jsp`:
```css
:root {
    --primary-color: #d4af37;
    --secondary-color: #2c3e50;
    --accent-color: #e74c3c;
}
```

### Images
Replace placeholder images with your hotel photos:
- Update image URLs in JSP files
- Store images in `src/main/webapp/images/`

### Content
- Update hotel information in JSP files
- Modify contact details in footer
- Customize room descriptions and pricing

## 🔒 Security Considerations

1. **Input Validation**: All forms include server-side validation
2. **XSS Protection**: JSTL automatically escapes output
3. **CSRF Protection**: Consider adding Spring Security
4. **HTTPS**: Always use HTTPS in production

## 📊 Performance Optimization

1. **Image Optimization**: Compress images before uploading
2. **CSS/JS Minification**: Minify static resources
3. **Caching**: Configure browser caching headers
4. **CDN**: Use CDN for Bootstrap and Font Awesome

## 🐛 Troubleshooting

### Common Issues

1. **404 Errors**: Check URL mappings in controllers
2. **Static Resources Not Loading**: Verify resource mapping in `spring-servlet.xml`
3. **Database Connection**: Check database configuration
4. **Email Not Sending**: Verify SMTP settings

### Logs
Check Tomcat logs:
```bash
tail -f /var/log/tomcat9/catalina.out
```

## 📞 Support

For support and questions:
- Email: support@hotelsurya.com
- Phone: +1 (555) 123-4567

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

---

**Hotel Surya** - Experience Luxury, Comfort, and Exceptional Service 