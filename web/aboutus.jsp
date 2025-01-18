<%-- 
    Document   : aboutus
    Created on : 10 Sept 2024, 12:06:31 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Thrifted Treasures</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/aboutus.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
</head>
<body>

    <header>
        <!-- Header with logo and navigation menu -->
        <div class="top-bar">
            <div class="logo">
                <a href="<%= request.getContextPath() %>/index.jsp"><img src="photos/LOGO.png" alt="Thrifted Treasures Logo"></a>
            </div>
            <nav>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/store.jsp">Store</a></li>
                    <li><a href="<%= request.getContextPath() %>/review.jsp">Reviews</a></li>
                    <li><a href="<%= request.getContextPath() %>/sell.jsp">Sell</a></li>
                    <li><a href="<%= request.getContextPath() %>/aboutus.jsp">About Us</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main>
        <!-- Company Overview -->
        <section class="company-overview">
            <h1>About Us</h1>
            <p>Welcome to Thrifted Treasures, where sustainable fashion meets affordability. Our mission is to provide high-quality, pre-loved clothing and accessories to style-conscious shoppers who want to make a positive impact on the environment. By choosing thrifted fashion, you're not just making a fashion statement, you're supporting a greener planet.</p>
        </section>

        <!-- Our Story -->
        <section class="our-story">
            <h2>Our Story</h2>
            <p>Thrifted Treasures started with a vision to offer a more eco-friendly way of shopping. Our founder, [Founder Name], saw an opportunity to reduce fashion waste by curating a selection of pre-loved items that deserved a second chance. Since our humble beginnings, we've grown into a community-driven thrift store where every purchase makes a difference.</p>
        </section>

        <!-- Our Values -->
        <section class="our-values">
            <h2>Our Values</h2>
            <ul>
                <li><strong>Sustainability:</strong> We are committed to reducing waste and promoting eco-conscious fashion choices.</li>
                <li><strong>Affordability:</strong> Our goal is to make stylish, high-quality clothing accessible to everyone.</li>
                <li><strong>Community:</strong> We support local charities and engage with our customers to create a positive impact.</li>
            </ul>
        </section>

<!--         Meet the Team 
        <section class="meet-the-team">
            <h2>Meet the Team</h2>
            <div class="team-member">
                <img src="photos/team/founder.jpg" alt="Founder Photo">
                <p><strong>[Founder Name]</strong> - Founder & CEO</p>
            </div>
        </section>-->

        <!-- Sustainability Commitment -->
        <section class="sustainability">
            <h2>Our Commitment to Sustainability</h2>
            <p>At Thrifted Treasures, we take sustainability seriously. By offering pre-loved clothing, we help reduce the environmental impact of the fashion industry. Our curated selection of items ensures that each piece has a story to tell, and we invite you to be part of the journey.</p>
        </section>

        <!-- Customer Testimonials -->
        <section class="testimonials">
            <h2>What Our Customers Say</h2>
            <blockquote>
                <p>"I found the perfect vintage jacket at Thrifted Treasures. The quality is amazing, and I love supporting sustainable fashion!" – [Customer Name]</p>
            </blockquote>
        </section>

        <!-- Call to Action -->
        <section class="call-to-action">
            <h2>Join Our Movement</h2>
            <p>Ready to embrace sustainable fashion? Shop our collection or donate your pre-loved items today. Together, we can make a difference!</p>
            <a href="<%= request.getContextPath() %>/store.jsp" class="btn">Shop Now</a>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Thrifted Treasures. All rights reserved.</p>
    </footer>

</body>
</html>
