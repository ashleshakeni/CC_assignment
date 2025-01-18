<%-- 
    Document   : productActions
    Created on : 16 Sept 2024, 11:00:53 pm
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    // Check if the user is logged in by checking if the username session attribute exists
    boolean isLoggedIn = (session.getAttribute("username") != null);  
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Pass the login status to JavaScript -->
    <script>
        var isLoggedIn = <%= isLoggedIn ? "true" : "false" %>;
    </script>

    <!-- Include your CSS and JS files -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/style.css">
</head>
<body>

<!--     Buttons for actions like adding to cart or booking a slot 
    <a href="javascript:void(0);" class="book-slot" onclick="checkLoginForSlot()">Book Slot</a>
    <button class="add-to-cart-button" onclick="checkLoginForCart()">Add to Cart</button>
    <button class="buy-now" onclick="checkLoginForPurchase()">Buy Now</button>-->

    <script>
        // Function to check login for slot booking
        function checkLoginForSlot() {
            if (!isLoggedIn) {
                alert("Please login first before booking a slot.");
                window.location.href = "<%= request.getContextPath() %>/login.jsp";  // Redirect to login page
            } else {
                // Logic for booking slot can be added here
                alert("Slot booked successfully!");
                window.location.href = "<%= request.getContextPath() %>/bookingConfirmation.jsp";
            }
        }

        // Function to check login for adding to cart
        function checkLoginForCart() {
            if (!isLoggedIn) {
                alert("Please login first before adding to cart.");
                window.location.href = "<%= request.getContextPath() %>/login.jsp";  // Redirect to login page
            } else {
                alert("Item added to cart successfully!");
                window.location.href = "<%= request.getContextPath() %>/cart.jsp";
            }
        }

        // Function to check login for purchase
        function checkLoginForPurchase() {
            if (!isLoggedIn) {
                alert("Please login first before purchasing.");
                window.location.href = "<%= request.getContextPath() %>/login.jsp";  // Redirect to login page
            } else {
                alert("Purchase successful!");
                window.location.href = "<%= request.getContextPath() %>/orderConfirmation.jsp";
            }
        }
    </script>

</body>
</html>
