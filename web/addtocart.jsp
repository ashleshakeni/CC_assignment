<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%
    // Initialize session and check if it's available
//    HttpSession session = request.getSession(false);
     if (session == null || session.getAttribute("username") == null) {
        // If not, redirect to login.jsp
        response.sendRedirect("login.jsp");
        return;
    }
    
    // Retrieve product details from the request
    String productId = request.getParameter("productId");
    String name = request.getParameter("name");
    String imageUrl = request.getParameter("imageUrl");
    String size = request.getParameter("size");

    // Validate and parse price
    double price = 0.0;
    try {
        price = Double.parseDouble(request.getParameter("price"));
    } catch (NumberFormatException e) {
        // Handle the case where price is not a valid number
        out.println("Invalid price value.");
        return;
    }

    // Get the cart from the session, or create a new one if it doesn't exist
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    // Check if the item is already in the cart
    boolean alreadyInCart = false;
    for (Map<String, Object> item : cart) {
        if (item.get("productId").equals(productId)) {
            alreadyInCart = true;
            break;
        }
    }

    // Add the item to the cart only if it's not already there
    if (!alreadyInCart) {
        // Create a new cart item map
        Map<String, Object> cartItem = new HashMap<>();
        cartItem.put("productId", productId);
        cartItem.put("name", name);
        cartItem.put("price", price);
        cartItem.put("imageUrl", imageUrl);
        cartItem.put("size", size);

        // Add the item to the cart
        cart.add(cartItem);
        session.setAttribute("cart", cart);

        // Feedback to the user (optional)
        out.println("<script>alert('Item added to cart successfully!');</script>");
    } else {
        // Feedback to the user if the item is already in the cart
        out.println("<script>alert('Item already in cart!');</script>");
    }

    // Redirect to the cart page
    response.sendRedirect("cart.jsp");
%>
