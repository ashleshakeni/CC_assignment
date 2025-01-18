<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/cart.css">
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
                            <div class="dropdown-section">
                                <h4>Traditional</h4>
                                <a href="<%= request.getContextPath()%>/traditional.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/traditionalattire.jsp">Attire</a>
                                <a href="<%= request.getContextPath()%>/traditionalaccessories.jsp">Accessories</a>
                                <a href="<%= request.getContextPath()%>/traditionalbags.jsp">Bags</a>
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
                

    <div class="cart-container">
        <h1>Your Shopping Cart</h1>
        <%
            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
            double totalAmount = 0;

            if (cart != null && !cart.isEmpty()) {
                for (Map<String, Object> item : cart) {
                    String productId = (String) item.get("productId");
                    String name = (String) item.get("name");
                    double price = (Double) item.get("price");
                    String imageUrl = (String) item.get("imageUrl");
                    String size = (String) item.get("size");

                    // Calculate total amount
                    totalAmount += price;
        %>
        <div class="cart-item">
            <div class="cart-image">
                <img src="<%= imageUrl %>" alt="<%= name %>">
            </div>
            <div class="cart-info">
                <h2><%= name %></h2>
                <p>Price: Rs. <%= price %></p>
                <p>Size: <%= size %></p>

                <!-- Remove button -->
                <form action="<%= request.getContextPath() %>/removeFromCart.jsp" method="post">
                    <input type="hidden" name="productId" value="<%= productId %>">
                    <button type="submit" class="remove-button">Remove</button>
                </form>
            </div>
        </div>
        <%
                }
        %>
        <div class="cart-total">
            <h2>Total Amount: Rs. <%= totalAmount %></h2>
            <form action="<%= request.getContextPath() %>/bill.jsp" method="post">
                <button type="submit" class="buy-button">Proceed to Buy</button>
            </form>
        </div>
        <% 
            } else { 
        %>
        <p>Your cart is empty.</p>
        <% 
            } 
        %>
    </div>

    <footer>
        <p>&copy; 2024 Thrifted Treasures. All rights reserved.</p>
    </footer>
</body>
</html>
