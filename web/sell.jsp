<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/sell.css">
    <title>Thrift Shop</title>
</head>
<body>
    <div class="hero-section">
        <img src="<%= request.getContextPath() %>/photos/clothes.jpg" alt="Sell/Swap Your Closet" class="hero-image">
        <div class="hero-content">
            <h1>SELL/SWAP YOUR CLOSET!</h1>
            <p>Swap your threads, save the planet! Join us to give your wardrobe a sustainable makeover.</p>
            <p>THRIFT SHOP: BANDRA & VERSOVA</p>
            <%
    // Check if user is logged in
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser != null) {
%>
        <!-- If the user is logged in, show the booking button -->
        <button class="swap-button" onclick="location.href='<%= request.getContextPath() %>/selectDate.jsp'">Book your Slot</button>
<%
    } else {
%>
        <!-- If the user is not logged in, show a login button -->
        <button class="swap-button" onclick="location.href='<%= request.getContextPath() %>/login.jsp'">Login to Book Slot</button>
<%
    }
%>

        </div>
    </div>

    <div class="instructions-section">
        <p>👚 Swap your old clothes or make some cash with Bombay Closet Cleanse — India's first thrift shop! Experience the ultimate thrift shop adventure where you can trade your old stuff for "new" old stuff or cold, hard moolah! 💰</p>
        <p>Just follow three simple steps:</p>
        <ul>
            <li><strong>Book your slot.</strong></li>
            <li><strong>Wash and pack your clothes.</strong></li>
            <li><strong>Visit our store to swap or sell!</strong></li>
        </ul>
        
        
        <h2>SWAP SHOP</h2>
        <p>The most popular and exciting choice is to swap your clothes! We'll hook you up with store credit that you can use for 6 months at our stores or on our website. It's a shopping spree with a thrifty twist! 🛍️👗<strong>P.S: Your swap credit points are 2x the cash value and usually a better deal ;)</strong></p>

        <h2>CASH OUT</h2>
        <p><strong>You also have the option to CASH OUT your closet for 1/2x the swap credit offered!!.The money will hit your account via UPI or bank transfer within 48 hours!</strong></p>

        <h2>Here are a few important instructions:</h2>
        <ul>
            <li>🧺 Your clothes must be freshly washed and smelling nice</li>
            <li>🚫 No musty, smelly, stained or dirty clothes</li>
            <li>📦 The maximum limit is 50 pieces per slot and minimum limit is 10 items. If you've got more treasures, go ahead and book 2 slots—double the fun! 🎉</li>
            <li>🛍️ Please pack your clothes in bags you don't need back. Please don’t bring suitcases!</li>
            <li>📚 Feel free to throw in some used books/usable paper bags to sweeten the deal. We can never have enough of either!</li>
            <li>⏰ Be fashionably on time. Late arrivals will miss out on all the thrifty goodness. We will have to cancel the slot as there are others waiting in the queue :(</li>
            <li>❌ No refunds if you snooze and lose your slot. Gotta rebook if you need a do-over 🙁</li>
            <li>💡 Explore our website and Insta to see what’s trendy!. We may not be able to offer much for clothes that aren’t relevant.</li>
            <li>❌ Slot booking does not guarantee you a deal. If we find the clothing unacceptable, we reserve the right to not take them in for a swap or sale. In case we don’t accept your clothes, you get your 99/- booking fee back as store credit only. Cash refunds are not possible!</li>
        </ul>
        <h2>Selection Criteria:</h2>
        <ul>
            <li class="checkmark">We are accepting only branded western wear</li>
            <li class="cross">Faulty zippers, tears, stains, or pilling? Sorry, we'll have to pass. You can still choose to donate these to us 🙄</li>
            <li class="cross">Unbranded clothing – we will not accept anything without a label</li>
            <li class="cross">Sorry, no shoes for now.</li>
            <li class="dress">Casual kurtis from brands like FabIndia, Biba, or Global Desi? Bring 'em on but please expect extremely low rates!</li>
            <li class="cross">Ethnic wear, heavy gowns, and used lingerie (for obvious reasons) aren't our current jam</li>
            <li class="cross">Underwear, swimwear, and intimates for hygiene purposes</li>
        </ul>
    </div>

    <script src="<%= request.getContextPath() %>/scripts.js"></script>
</body>
</html>
