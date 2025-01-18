<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/confirmationResult.css">
    <title>Final Confirmation</title>
</head>
<body>
    <div class="container">
        <h1>Thank You!</h1>

        <%
            // Retrieve form data from the previous JSP page
            String date = request.getParameter("date");
            String timeSlot = request.getParameter("time-slot");
            String name = request.getParameter("name");
            String productType = request.getParameter("product-type");
            String city = request.getParameter("city");         // Added city field
            String subCity = request.getParameter("sub-city");  // Added sub-city field

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

                // SQL query to insert data into the slot_confirmation table
                String sql = "INSERT INTO slot_confirmation (date, time_slot, name, product_type, city, sub_city) VALUES (?, ?, ?, ?, ?, ?)";

                // Prepare the statement and bind the parameters
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, date);
                pstmt.setString(2, timeSlot);
                pstmt.setString(3, name);
                pstmt.setString(4, productType);
                pstmt.setString(5, city);       // Bind city
                pstmt.setString(6, subCity);    // Bind sub-city

                // Execute the insert query
                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    out.println("<div class='confirmation-details'>");
                    out.println("<p><strong>Date:</strong> " + date + "</p>");
                    out.println("<p><strong>Time Slot:</strong> " + timeSlot + "</p>");
                    out.println("<p><strong>Name:</strong> " + name + "</p>");
                    out.println("<p><strong>Products:</strong> " + productType + "</p>");
                    out.println("<p><strong>City:</strong> " + city + "</p>");       // Display city
                    out.println("<p><strong>Sub-City:</strong> " + subCity + "</p>"); // Display sub-city
                    out.println("</div>");
                } else {
                    out.println("<p>There was an issue saving your data. Please try again.</p>");
                }

            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>

        <p>We appreciate your submission. You will be contacted shortly for further instructions.</p>
    </div>
</body>
</html>
