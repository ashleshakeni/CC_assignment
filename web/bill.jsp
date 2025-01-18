<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Summary</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/bill.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/index.css">
</head>
<body>
    <header>
        <!-- Include Header content here -->
    </header>

    <div class="bill-container">
        <h1>Bill Summary</h1>
        <%
            List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
            double totalAmount = 0;

            // Check if the cart is valid and not empty
            if (cart != null && !cart.isEmpty()) {
        %>
        <table class="bill-table">
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Size</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Map<String, Object> item : cart) {
                        String name = (String) item.get("name");
                        double price = (Double) item.get("price");
                        String size = (String) item.get("size");
                        totalAmount += price;
                %>
                <tr>
                    <td><%= name %></td>
                    <td>Rs. <%= price %></td>
                    <td><%= size %></td>
                    <td>Rs. <%= price %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="3">Grand Total</th>
                    <th>Rs. <%= totalAmount %></th>
                </tr>
            </tfoot>
        </table>

        <!-- Checkout actions: Confirm and Return to Cart -->
        <div class="checkout-actions">
            <!-- Confirm Purchase Form -->
            <form action="<%= request.getContextPath() %>/confirmOrder.jsp" method="post">
                <button type="submit" class="confirm-button">Confirm Purchase</button>
            </form>

            <!-- Return to Cart Form -->
            <form action="<%= request.getContextPath() %>/cart.jsp" method="get">
                <button type="submit" class="return-button">Return to Cart</button>
            </form>
        </div>

        <% 
            } else { 
        %>
        <!-- Empty cart message -->
        <p>Your cart is empty. <a href="<%= request.getContextPath() %>/index.jsp">Continue Shopping</a></p>
        <% 
            } 
        %>
    </div>

    <footer>
        <!-- Include Footer content here -->
    </footer>
</body>
</html>
