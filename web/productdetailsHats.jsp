<%-- 
    Document   : productdetailsHats
    Created on : 13 Sept 2024, 9:56:58 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dress Detail</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/productdetails.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
</head>
<body>
    <header>
        <div class="top-bar">
            <nav>
                <ul> 
                    <li><a href="<%= request.getContextPath() %>/review.jsp"><img src="photos/review.png" alt=""/></a></li>
                     <li class="dropdown">
                        <a href="<%= request.getContextPath() %>/store.jsp"><img src="photos/store.png" alt=""/></a>
                        <div class="dropdown-content">
                            <div class="dropdown-section">
                                <h4>Women</h4>
                                <a href="<%= request.getContextPath()%>/womenall.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/top.jsp">Tops</a>
                                <a href="<%= request.getContextPath()%>/dresses.jsp">Dresses</a>
                                <a href="<%= request.getContextPath()%>/bottoms.jsp">Bottoms</a>
                                <a href="<%= request.getContextPath()%>/jackets.jsp">Jackets</a>
                            </div>
                            <div class="dropdown-section">
                                <h4>Men</h4>
                                <a href="<%= request.getContextPath()%>/menall.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/tees.jsp">Tees</a>
                                <a href="<%= request.getContextPath()%>/shirts.jsp">Shirts</a>
                                <a href="<%= request.getContextPath()%>/menjackets.jsp">Jackets</a>
                                <a href="<%= request.getContextPath()%>/pants.jsp">Pants</a>
                            </div>
                            <div class="dropdown-section">
                                <h4>Shop Local</h4>
                                <a href="<%= request.getContextPath()%>/alllocal.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/cotton.jsp">Cotton Shirts</a>
                                <a href="<%= request.getContextPath()%>/summerdresses.jsp">Summer Dresses</a>
                                <a href="<%= request.getContextPath()%>/totes.jsp">Bags & Totes</a>
                                <a href="<%= request.getContextPath()%>/hats.jsp">Hats</a>
                            </div>
                        </div>
                    </li>
                    <li><a href="<%= request.getContextPath() %>/sell.jsp"><img src="photos/sell.png" alt=""/></a></li>
                </ul>
            </nav>
                <div class="logo">
                <a href="<%= request.getContextPath() %>/index.jsp">
                    <img src="photos/LOGO.png" alt="Logo">
                </a>
                </div>
            <div class="user-actions">
                <a href="<%= request.getContextPath() %>/login.jsp"><img src="photos/avatar.png" alt=""/></a>
                <a href="<%= request.getContextPath() %>/cart.jsp"><img src="photos/shopping-cart.png" alt=""/></a>
                <a href="<%= request.getContextPath() %>/aboutus.jsp"> <img src="photos/aboutus.png" alt=""/></a>
            </div>
        </div>
    </header>
<%
    String productId = request.getParameter("id"); // Get product ID from request
    if (productId != null && !productId.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift", "root", "123456");

            // Prepare and execute the SQL statement for dresses
            pstmt = conn.prepareStatement("SELECT * FROM hats WHERE id = ?");
            pstmt.setString(1, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                //boolean isSoldOut = rs.getBoolean("is_sold_out"); // Check if the product is sold out
%>
    <div class="product-detail">
        <div class="product-image">
            <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("name") %>">
        </div>
        <div class="product-info">
            <h1><%= rs.getString("name") %></h1>
            <p class="price">Rs. <%= rs.getDouble("price") %></p>
            <div class="size">
                <p>Size: <%= rs.getString("size") %></p>
            </div>
            <<div class="actions">
                <%
                    if (true) { // If the product is not sold out, show action buttons
                %>
                    <!-- Form to add the product to the cart -->
                    <form action="<%= request.getContextPath() %>/addtocart.jsp" method="post">
                        <input type="hidden" name="productId" value="<%= rs.getString("id") %>">
                        <input type="hidden" name="name" value="<%= rs.getString("name") %>">
                        <input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
                        <input type="hidden" name="imageUrl" value="<%= rs.getString("image_url") %>">
                        <input type="hidden" name="size" value="<%= rs.getString("size") %>">
                         <button onclick="checkLoginForCart('cart', '<%= rs.getString("id") %>', '<%= rs.getString("name") %>', '<%= rs.getDouble("price") %>', '<%= rs.getString("image_url") %>', '<%= rs.getString("size") %>')">Add to Cart</button>
                    
                    </form>
                    <!-- Form to buy the product now -->
                    <form action="<%= request.getContextPath() %>/bill.jsp" method="post">
                        <input type="hidden" name="productId" value="<%= rs.getString("id") %>">
                        <input type="hidden" name="name" value="<%= rs.getString("name") %>">
                        <input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
                        <input type="hidden" name="imageUrl" value="<%= rs.getString("image_url") %>">
                        <input type="hidden" name="size" value="<%= rs.getString("size") %>">
                        <input type="hidden" name="quantity" value="1"> <!-- Default quantity is 1 -->
                        <button onclick="checkLoginForBuy('buy', '<%= rs.getString("id") %>', '<%= rs.getString("name") %>', '<%= rs.getDouble("price") %>', '<%= rs.getString("image_url") %>', '<%= rs.getString("size") %>')">Buy Now</button>
                    </form>
                <%
                    } else { // If the product is sold out, show "Sold Out" message
                %>
                    <p>Sold Out</p>
                <%
                    }
                %>
            </div>
        </div>
    </div>
<%
            } else {
                out.println("<p>Product not found.</p>");
            }
        } catch (SQLException e) {
    e.printStackTrace(); // This will give more details in the console
    out.println(e);
} finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("<p>Invalid product ID.</p>");
    }
%>

<footer>
    <p>&copy; 2024 Thrifted Treasures. All rights reserved.</p>
</footer>
</body>
</html>