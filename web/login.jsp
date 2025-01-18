<%-- 
    Document   : login
    Created on : 26 Jul 2024, 1:45:27 pm
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/login.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
</head>
<body>
    
    <div class="login-container">
        <form class="login-form" action="<%= request.getContextPath() %>/Login" method="post">
            <h2>Login</h2>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
        <div class="register-link">
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
