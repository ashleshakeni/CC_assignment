<%-- 
    Document   : adminPanel
    Created on : 14 Sept 2024, 10:35:33?pm
    Author     : ashle
--%>

<%@ page session="false" %>
<%
    HttpSession session = request.getSession(false);
    if(session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Welcome to Admin Panel</h2>

    <!-- Section to display total number of registered users -->
    <h3>Total Registered Users</h3>
    <%
        // Replace this with your actual logic to fetch the total number of users from the database
        int totalUsers = 10;  // Example value
        out.print("Total Users: " + totalUsers);
    %>

    <!-- Section to add new product categories -->
    <h3>Add New Product Category</h3>
    <form action="addProductCategoryServlet" method="post">
        <label for="category">Category Name:</label>
        <input type="text" id="category" name="category" required><br>
        <input type="submit" value="Add Category">
    </form>

    <!-- Logout Button -->
    <form action="logoutServlet" method="post">
        <input type="submit" value="Logout">
    </form>
</body>
</html>
