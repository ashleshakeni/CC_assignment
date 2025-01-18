<%-- 
    Document   : searchSuggestions
    Created on : 13 Sept 2024, 10:13:50 am
    Author     : ashle
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String searchTerm = request.getParameter("query");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift", "root", "123456");

        String sql = "SELECT name FROM products WHERE name LIKE ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + searchTerm + "%"); // Use wildcard to find similar names
        rs = pstmt.executeQuery();

        while (rs.next()) {
            String productName = rs.getString("name");
%>
            <div class="suggestion-item" onclick="selectSuggestion('<%= productName %>')">
                <%= productName %>
            </div>
<%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>


