<%-- 
    Document   : crochet
    Created on : 5 Sept 2024, 9:04:24 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift Shop - Tops</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/tops.css">
    <script src="<%= request.getContextPath() %>/scripts.js"></script>
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
                <a href="<%= request.getContextPath() %>/aboutus.jsp"> <img src="photos/shopping-bags.png" alt=""/></a>
            </div>
        </div>
        <div class="search-bar">
            <input type="text" placeholder="Search for quality pre-loved fashion">
            <button>Search</button>
        </div>
    </header>

    <main>
        <h1>Crochet</h1>
        <div class="product-grid">
            <%
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift", "root", "123456");
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM crochet";
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
                                    <!-- Make the image clickable by wrapping it in an anchor tag -->
                                    <a href="<%= request.getContextPath() %>/productdetailsCrochet.jsp?id=<%= rs.getInt("id") %>">
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
                    out.println("<p>An error occurred while fetching products. Please try again later.</p>");
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
        <footer>
        <p>&copy; 2024 Thrifted Treasures. All rights reserved.</p>
    </footer>
</body>
</html>

