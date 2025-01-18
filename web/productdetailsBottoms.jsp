<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %> 
<%@ include file="productActions.jsp" %>
<%@ include file="action.js" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dress Detail</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/productdetails.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
    <script src="<%= request.getContextPath() %>/scripts.js"></script>
    <jsp:include page="modal.jsp" /> `
</head>
<body>
    <header>
        <div class="top-bar">
            <nav>
                <ul> 
                    <li><a href="<%= request.getContextPath() %>/review.jsp"><img src="photos/review.png" alt="Review"/></a></li>
                    <li class="dropdown">
                        <a href="<%= request.getContextPath() %>/store.jsp"><img src="photos/store.png" alt="Store"/></a>
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
                    <li><a href="<%= request.getContextPath() %>/sell.jsp"><img src="photos/sell.png" alt="Sell"/></a></li>
                </ul>
            </nav>
            <div class="logo">
                <a href="<%= request.getContextPath() %>/index.jsp">
                    <img src="photos/LOGO.png" alt="Logo">
                </a>
            </div>
            <div class="user-actions">
               
    
    <!-- Check if user is logged in -->
    <%
        String username = (String) session.getAttribute("username");
        if (username == null) {
            // User is not logged in
    %>
        <!-- Login Avatar (Redirect to login.jsp) -->
        <a href="<%= request.getContextPath() %>/login.jsp">
            <img src="photos/avatar.png" alt="Login" id="avatarIcon"/>
        </a>
    <%
        } else {
            // User is logged in
    %>
        <!-- Profile Avatar (Show Profile Modal) -->
        <a href="javascript:void(0);" id="profileTrigger">
            <img src="photos/avatar.png" alt="Profile" id="avatarIcon"/>
        </a>
    <%
        }
    %>
    
    <!-- Shopping Cart and About Us Icons -->
    <a href="<%= request.getContextPath() %>/cart.jsp">
        <img src="photos/shopping-cart.png" alt="Cart"/>
    </a>
    <a href="<%= request.getContextPath() %>/aboutus.jsp">
        <img src="photos/aboutus.png" alt="About"/>
    </a>
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
            pstmt = conn.prepareStatement("SELECT * FROM bottoms WHERE id = ?");
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
            <div class="actions">
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
        } catch (Exception e) {
            out.println("<p>An error occurred while retrieving the product details.</p>");
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException e) { /* Ignored */ }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { /* Ignored */ }
            if (conn != null) try { conn.close(); } catch (SQLException e) { /* Ignored */ }
        }
    } else {
        out.println("<p>Invalid product ID.</p>");
    }
%>

<footer>
    <p>&copy; 2024 Thrifted Treasures. All rights reserved.</p>
</footer>

<!--
<script>
    function checkLoginForCart(productId, name, price, imageUrl, size) {
        if (!isLoggedIn) {
            alert("Please login first before adding to cart.");
            window.location.href = "login.jsp";  // Redirect to login page
        } else {
            // Proceed with adding the item to the cart
            let form = document.createElement("form");
            form.method = "post";
            form.action = "<%= request.getContextPath() %>/addtocart.jsp";

            form.innerHTML = `
                <input type="hidden" name="productId" value="${productId}">
                <input type="hidden" name="name" value="${name}">
                <input type="hidden" name="price" value="${price}">
                <input type="hidden" name="imageUrl" value="${imageUrl}">
                <input type="hidden" name="size" value="${size}">
            `;
            document.body.appendChild(form);
            form.submit();
        }
    }

    function checkLoginForBuy(productId, name, price, imageUrl, size) {
        if (!isLoggedIn) {
            alert("Please login first before making a purchase.");
            window.location.href = "login.jsp";  // Redirect to login page
        } else {
            // Proceed with the purchase
            let form = document.createElement("form");
            form.method = "post";
            form.action = "<%= request.getContextPath() %>/bill.jsp";

            form.innerHTML = `
                <input type="hidden" name="productId" value="${productId}">
                <input type="hidden" name="name" value="${name}">
                <input type="hidden" name="price" value="${price}">
                <input type="hidden" name="imageUrl" value="${imageUrl}">
                <input type="hidden" name="size" value="${size}">
                <input type="hidden" name="quantity" value="1">  Default quantity is 1 
            `;
            document.body.appendChild(form);
            form.submit();
        }
    }
</script>-->

</body>
</html>
