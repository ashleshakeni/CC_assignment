<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String query = request.getParameter("query");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift", "root", "123456");

        String sql = "SELECT * FROM products WHERE name LIKE ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "%" + query + "%");
        rs = pstmt.executeQuery();

%>
    <h2>Search Results for "<%= query %>"</h2>
    <ul>
<%
        while (rs.next()) {
            String productName = rs.getString("name");
            double price = rs.getDouble("price");
            String imageUrl = rs.getString("image_url");
%>
            <li>
                <img src="<%= imageUrl %>" alt="<%= productName %>" width="100" height="100">
                <h3><%= productName %></h3>
                <p>Price: Rs. <%= price %></p>
            </li>
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
    </ul>
