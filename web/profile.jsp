<%@ page import="java.sql.*" %>
<%
    // Check if the user is logged in
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    // Retrieve session attributes
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("user_id");

    // Ensure user_id is retrieved properly
    if (userId == null) {
        response.sendRedirect("login.jsp"); // Redirect to login if user_id is missing
        return;
    }
%>