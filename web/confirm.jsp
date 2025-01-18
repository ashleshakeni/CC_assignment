<%-- 
    Document   : confirm
    Created on : 10 Sept 2024, 12:59:21 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/confirm.css">
    <title>Confirmation</title>
</head>
<body>
    <div class="container">
        <h1>Confirm Your Details</h1>
        <p>Thank you for selecting your slot!</p>
        <p>Date: <%= request.getParameter("date") %></p>
        <p>Time Slot: <%= request.getParameter("time-slot") %></p>
        <p>City: <%= request.getParameter("city") %></p>
        <p>Sub-City: <%= request.getParameter("sub-city") %></p>

        <form action="confirmationResult.jsp" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br><br>

            <label for="product-type">What kind of products are you selling?</label><br>
            <input type="text" id="product-type" name="product-type" required><br><br>

            <input type="hidden" name="date" value="<%= request.getParameter("date") %>">
            <input type="hidden" name="time-slot" value="<%= request.getParameter("time-slot") %>">
            <input type="hidden" name="city" value="<%= request.getParameter("city") %>">
            <input type="hidden" name="sub-city" value="<%= request.getParameter("sub-city") %>">

            <button type="submit">Confirm</button>
        </form>
    </div>
</body>
</html>
