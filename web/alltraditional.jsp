<%-- 
    Document   : alltraditional
    Created on : 12 Sept 2024, 8:22:19 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thrift Shop</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/scripts.js">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/womenall.css">
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
        <div class="search-bar">
            <input type="text" placeholder="Search for quality pre-loved fashion">
            <button>Search</button>
        </div>
    </header>
    <main>
        <div class="collection-grid">
            <a href="<%= request.getContextPath() %>/traditionalattire.jsp" class="collection-item">
                <img src="photos/traditional/attire.jpg" alt="Attire">
                <div class="caption">TRADITIONAL ATTIRE</div>
            </a>
            <a href="<%= request.getContextPath() %>/traditionalaccessories.jsp" class="collection-item">
                <img src="photos/traditional/accessories.jpg" alt="traditionalaccessories">
                <div class="caption">TRADITIONAL ACCESSORIES</div>
            </a>
            <a href="<%= request.getContextPath() %>/traditionalbags.jsp" class="collection-item">
                <img src="photos/traditional/bags.jpg" alt="TarditionalBags">
                <div class="caption">TRADITIONAL BAGS</div>
            </a>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Thrifted Treasures. All Rights Reserved.</p>
    </footer>
</body>
</html>

