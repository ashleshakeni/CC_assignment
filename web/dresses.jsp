<%-- 
    Document   : dresses
    Created on : 23 Aug 2024, 6:30:01 pm
    Author     : ashle
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift Shop - Dresses</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/tops.css">
    <script src="<%= request.getContextPath() %>/scripts.js"></script>
    <jsp:include page="modal.jsp" />
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
        <img src="photos/aboutus.png" alt="Bags"/>
    </a>
</div>

        </div>
        
    </header>

    <main>
        <h1>Dresses</h1>
        <div class="product-grid">
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift", "root", "123456");
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM dresses";
                    rs = stmt.executeQuery(query);
                    int productCount = 0;

                    while (rs.next()) {
                        if (productCount % 4 == 0) {
            %>
                            <div class="product-row">
            <%
                        }
            %>
                                <div class="product-item">
                                    <a href="<%= request.getContextPath() %>/productdetailsDresses.jsp?id=<%= rs.getString("id") %>">
                                        <img src="<%= rs.getString("image_url") %>" alt="<%= rs.getString("name") %>">
                                    </a>
                                    <h2><%= rs.getString("name") %></h2>
                                    <p>Size: <%= rs.getString("size") %></p>
                                    <p>Price: ₹<%= rs.getDouble("price") %></p>
                                </div>
                                
            <%
                        productCount++;
                        if (productCount % 4 == 0) {
            %>
                            </div>
            <%
                        }
                    }
                    if (productCount % 4 != 0) {
            %>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </div>
    </main>
</body>
</html>
