<%-- 
    Document   : confirmOrder
    Created on : 16 Sept 2024, 7:08:33 am
    Author     : ashle
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/all css/confirmOrder.css">
</head>
<body>
    <div class="confirmation-container">
        <h1>Order Placed Successfully!</h1>
        <p>Thank you for your purchase. Your order has been successfully placed.</p>

        <h2>Your Receipt</h2>
        <div class="receipt">
            <table class="receipt-table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Size</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <body>
                    <%
                       List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                        double totalAmount = 0;
                        String username = (String) session.getAttribute("username");
                        
                        // Database connection setup
                        Connection conn = null;
                        PreparedStatement pstmt = null;

                        if (cart != null && !cart.isEmpty() && username != null) {
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/thrift?useSSL=false", "root", "123456");

                                for (Map<String, Object> item : cart) {
                                    String name = (String) item.get("name");
                                    double price = (Double) item.get("price");
                                    String size = (String) item.get("size");
                                    totalAmount += price;
                                    out.println(name);
                                    // Insert order into the database
                                    String sql = "INSERT INTO orders (username, product_name, price, size, order_date) VALUES (?, ?, ?, ?, NOW())";
                                    pstmt = conn.prepareStatement(sql);
                                    pstmt.setString(1, username);
                                    pstmt.setString(2, name);
                                    pstmt.setDouble(3, price);
                                    pstmt.setString(4, size);
                                    pstmt.executeUpdate();

                                    // Display product in the receipt
                    %>
                    <tr>
                        <td><%= name %></td>
                        <td>Rs. <%= price %></td>
                        <td><%= size %></td>
                        <td>Rs. <%= price %></td>
                    </tr>
                    <%
                                }
                            } catch (SQLException | ClassNotFoundException e) {
                                e.printStackTrace();
                            } finally {
                                // Close resources safely
                                try {
                                    if (pstmt != null) pstmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException ex) {
                                    ex.printStackTrace();
                                }
                            }
                        } else {
                            out.println("<p>Error: Cart is empty or user is not logged in.</p>");
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
        </div>

        <!-- Download receipt button -->
        <button onclick="window.print();" class="download-btn">Download Receipt</button>

        <!-- Back to Home Button -->
        <button class="back-btn" onclick="window.location.href='<%= request.getContextPath() %>/index.jsp';">Back to Home</button>
    </div>
</body>
</html>
