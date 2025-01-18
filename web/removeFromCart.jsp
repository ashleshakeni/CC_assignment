<%-- 
    Document   : removeFromCart
    Created on : 25 Sept 2024, 11:21:32 am
    Author     : ashle
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<%
    // Get the productId from the request
    String productId = request.getParameter("productId");

    // Get the cart from the session
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if (cart != null && productId != null) {
        // Iterate through the cart to find the item by productId
        Iterator<Map<String, Object>> iterator = cart.iterator();

        while (iterator.hasNext()) {
            Map<String, Object> item = iterator.next();
            String itemProductId = (String) item.get("productId");

            // If the productId matches, remove the item from the cart
            if (itemProductId.equals(productId)) {
                iterator.remove();
                break;
            }
        }

        // Update the cart in the session
        session.setAttribute("cart", cart);
    }

    // Redirect back to the cart page
    response.sendRedirect(request.getContextPath() + "/cart.jsp");
%>
   