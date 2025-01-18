<%-- 
    Document   : logout
    Created on : 6 Sept 2024, 3:17:34?pm
    Author     : ashle
--%>

<%
    if (session != null) {
        session.invalidate(); // Invalidate session
    }
    response.sendRedirect("index.jsp"); // Redirect to login page
%>
