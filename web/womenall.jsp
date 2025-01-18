<%-- 
    Document   : womenall
    Created on : 5 Aug 2024, 4:14:09 pm
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
                                <a href="<%= request.getContextPath()%>/allocal.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/cotton.jsp">Cotton Shirts</a>
                                <a href="<%= request.getContextPath()%>/summerdresses.jsp">Summer Dresses</a>
                                <a href="<%= request.getContextPath()%>/totes.jsp">Bags & Totes</a>
                            </div>
                        </div>
                    </li>
                    <li><a href="<%= request.getContextPath() %>/sell.jsp"><img src="photos/sell.png" alt=""/></a></li>
                </ul>
            </nav>
            <div class="logo"><img src="photos/LOGO.png">
                <a href="<%= request.getContextPath() %>/index.jsp"></a>
            </div>
            
            <div class="user-actions">
                <a href="<%= request.getContextPath() %>/login.jsp"><img src="photos/avatar.png" alt=""/></a>
                <a href="<%= request.getContextPath() %>/addtocart.jsp"><img src="photos/shopping-cart.png" alt=""/></a>
                <a href="<%= request.getContextPath() %>/aboutus.jsp"><img src="photos/aboutus.png" alt=""/></a>
            </div>
        </div>
    </header>
    <main>
        <div class="collection-grid">
            <a href="<%= request.getContextPath() %>/top.jsp" class="collection-item">
                <img src="photos/tops.jpg" alt="Tops">
                <div class="caption">TOPS</div>
            </a>
            <a href="<%= request.getContextPath() %>/dresses.jsp" class="collection-item">
                <img src="photos/dresses.jpg" alt="Dresses">
                <div class="caption">DRESSES</div>
            </a>
            <a href="<%= request.getContextPath() %>/bottoms.jsp" class="collection-item">
                <img src="photos/bottoms.jpg" alt="Bottoms">
                <div class="caption">BOTTOMS</div>
            </a>
            <a href="<%= request.getContextPath() %>/jackets.jsp" class="collection-item">
                <img src="photos/jackets.jpg" alt="Jackets">
                <div class="caption">JACKETS</div>
            </a>
            <a href="<%= request.getContextPath() %>/corset.jsp" class="collection-item">
                <img src="photos/corset.jpg" alt="Corset">
                <div class="caption">CORSET</div>
            </a>
            <a href="<%= request.getContextPath() %>/accessories.jsp" class="collection-item">
                <img src="photos/accessories.jpg" alt="Accessories">
                <div class="caption">ACCESSORIES</div>
            </a>
            <a href="<%= request.getContextPath() %>/crochet.jsp" class="collection-item">
                <img src="photos/crochet.jpg" alt="Crochet">
                <div class="caption">CROCHET</div>
            </a>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 Thrifted Treasures. All Rights Reserved.</p>
    </footer>
</body>
</html>

