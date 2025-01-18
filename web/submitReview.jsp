<%-- 
    Document   : submitReview
    Created on : 16 Sept 2024, 12:19:48 am
    Author     : ashle
--%>
<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Submitted</title>
</head>
<body>
    <div class="container">
        <h1>Thank You for Your Review!</h1>

        <%
            // Retrieve form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String rating = request.getParameter("rating");
            String comments = request.getParameter("comments");

            // Database connection parameters
            String dbURL = "jdbc:mysql://localhost:3306/thrift";
            String dbUser = "root";
            String dbPassword = "123456";

            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection to the database
                conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                // SQL query to insert review into the database
                String sql = "INSERT INTO review (name, email, rating, comments) VALUES (?, ?, ?, ?)";

                // Prepare the statement and bind the parameters
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, name);
                pstmt.setString(2, email);
                pstmt.setString(3, rating);
                pstmt.setString(4, comments);

                // Execute the insert query
                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<p>Your review has been recorded. We appreciate it!</p>");
                } else {
                    out.println("<p>There was an issue saving your review. Please try again.</p>");
                }

            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>
