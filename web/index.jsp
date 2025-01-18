<%-- 
    Document   : index
    Created on : 26 Jul 2024, 1:37:10 pm
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/modal.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/profile.css">
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
<!--                            <div class="dropdown-section">
                                <h4>Traditional</h4>
                                <a href="<%= request.getContextPath()%>/traditional.jsp">All</a>
                                <a href="<%= request.getContextPath()%>/traditionalattire.jsp">Attire</a>
                                <a href="<%= request.getContextPath()%>/traditionalaccessories.jsp">Accessories</a>
                                <a href="<%= request.getContextPath()%>/traditionalbags.jsp">Bags</a>
                            </div>-->
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
        <img src="photos/aboutus.png" alt="About Us"/>
    </a>
</div>

<!--        </div>
        <div class="search-bar">
            <input type="text" id="search" placeholder="Search for quality pre-loved fashion" onkeyup="debouncedFetchSuggestions()" autocomplete="off">
            <button onclick="performSearch()">Search</button>
            <div id="suggestions" class="suggestions-box"></div>
        </div>-->
    </header>

    <main>
        <div class="hero">
            <h2>Summer Clearance</h2>
            <p>Shop up to 80% off 100K pieces.</p>
        </div>

        <div class="carousel">
    <div class="carousel-container">
        <div class="carousel-item">
            <div class="image-container">
                <a href="<%= request.getContextPath() %>/productdetailsauto.jsp">
                    <img src="<%= request.getContextPath() %>/photos/autoslider/FloralSummerDress.jpg" alt="Floral Dress">
                </a>
<!--                <div class="caption">Dopamine Dressing →<br>Wear the rainbow.</div>-->
            </div>
            <div class="image-container">
                <a href="<%= request.getContextPath() %>/productdetailsauto.jsp">
                    <img src="<%= request.getContextPath() %>/photos/autoslider/hoodedjacket.jpg" alt="Hooded Jacket">
                </a>
<!--                <div class="caption">Mood boosting looks</div>-->
            </div>
        </div>
        <div class="carousel-item">
            <div class="image-container">
                <a href="<%= request.getContextPath() %>/productdetailsauto.jsp">
                    <img src="<%= request.getContextPath() %>/photos/autoslider/limitedediition.jpg" alt="New">
                </a>
<!--                <div class="caption">"New" in →<br>Shop the latest uploads.</div>-->
            </div>
            <div class="image-container">
                <a href="<%= request.getContextPath() %>/productdetailsauto.jsp">
                    <img src="<%= request.getContextPath() %>/photos/autoslider/upperarmchain.jpg" alt="Chain">
                </a>
<!--                <div class="caption">Get first pick</div>-->
            </div>
        </div>
    </div>
    <div class="carousel-controls">
        <button class="prev-slide">&lt;</button>
        <button class="next-slide">&gt;</button>
    </div>
</div>


        <h2 class="section-title">Shop by Collection</h2>
        <div class="collection-grid">
            <div class="collection-item">
                <a href="<%= request.getContextPath() %>/womenall.jsp">
                    <img src="<%= request.getContextPath() %>/photos/pic2.jpg" alt="Women">
                    <div class="caption">WOMEN</div>
                </a>
            </div>
            <div class="collection-item">
                <a href="<%= request.getContextPath() %>/menall.jsp">
                    <img src="<%= request.getContextPath() %>/photos/mens.jpg" alt="Men">
                    <div class="caption">MEN</div>
                </a>
            </div>
            <div class="collection-item">
                <a href="<%= request.getContextPath() %>/alllocal.jsp">
                    <img src="<%= request.getContextPath() %>/photos/local.jpg" alt="Shop Local">
                    <div class="caption">SHOP LOCAL</div>
                </a>
            </div>
<!--            <div class="collection-item">
                <a href="<%= request.getContextPath() %>/alltraditional.jsp">
                    <img src="<%= request.getContextPath() %>/photos/traditional.jpg" alt="Traditional">
                    <div class="caption">TRADITIONAL</div>
                </a>-->
            </div>
        </div>

        <div class="slider-container">
            <h2>Under 499</h2>
    <div class="slider">
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=1">
                <img src="<%= request.getContextPath() %>/photos/under499/basictop.jpg" alt="Basic Top">
            </a>
            <div class="product-info">
                <h3>Basic Blue Top</h3>
                <p>Rs.400.00</p>
                <span>M</span>
            </div>
        </div>
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=2">
                <img src="<%= request.getContextPath() %>/photos/under499/phaseofmoon.jpg" alt="Phase of Moon Crop Top">
            </a>
            <div class="product-info">
                <h3> Phase of Moon Crop Top</h3>
                <p>Rs.400.00</p>
                <span>S</span>
            </div>
        </div>
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=3">
                <img src="<%= request.getContextPath() %>/photos/under499/clawclip.jpg" alt="Claw Clip">
            </a>
            <div class="product-info">
                <h3>Claw clip</h3>
                <p>Rs.300.00</p>
            </div>
        </div>
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=4">
                <img src="<%= request.getContextPath() %>/photos/under499/newyorkcap.jpg" alt="New York Cap">
            </a>
            <div class="product-info">
                <h3>New York Cap</h3>
                <p>Rs.300.00</p>
            </div>
        </div>
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=5">
                <img src="<%= request.getContextPath() %>/photos/under499/meowtote.jpg" alt="Meow Tote">
            </a>
            <div class="product-info">
                <h3>Meow Tote</h3>
                <p>Rs.300.00</p>
            </div>
        </div>  
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=6">
                <img src="<%= request.getContextPath() %>/photos/under499/beatsrings.jpg" alt="Beats Rings">
            </a>
            <div class="product-info">
                <h3>Beats Rings</h3>
                <p>Rs.199.00</p>
            </div>
        </div>
        <div class="slide">
            <a href="<%= request.getContextPath() %>/productdetail499.jsp?productId=7">
                <img src="<%= request.getContextPath() %>/photos/under499/generalgarment.jpg" alt="generalgarment">
            </a>
            <div class="product-info">
                <h3>General Yellow Garment</h3>
                <p>Rs. 450.00</p>
                <span>M</span>
            </div>
        </div>
    </div>
    <div class="carousel-controls">
        <div class="prev">&lt;</div>
        <div class="next">&gt;</div>
    </div>
</div>

    </main>

    <footer>
        <p>© 2024 Thrift Store</p>
    </footer>
</body>
</html>
