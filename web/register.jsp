<%-- 
    Document   : register
    Created on : 26 Jul 2024, 1:49:40 pm
    Author     : ashle
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/login.css">
    <script>
        // Function to check URL parameters
        function checkRegistrationStatus() {
            const params = new URLSearchParams(window.location.search);
            if (params.get('status') === 'success') {
                alert('Registration successful!');
            }
        }

        // Run the function on page load
        window.onload = checkRegistrationStatus;
    </script>
</head>
<body>
    <div class="register-container">
        <form class="register-form" action="<%= request.getContextPath() %>/register" method="post">
            <h2>Register</h2>
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Register</button>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="<%= request.getContextPath() %>/login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
