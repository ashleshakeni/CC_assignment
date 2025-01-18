import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String message = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish a connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thrift", "root", "123456");

            // Query to check if the user exists with the provided credentials
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // If user exists, create a session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);  // Storing the username in session

                // You can store more user details in the session if needed, like user ID or roles
                session.setAttribute("userId", rs.getInt("id"));  // Assuming 'id' column exists in the 'users' table
                session.setAttribute("email", rs.getString("email"));  // Assuming 'email' column exists

                // Redirect to homepage after login
                response.sendRedirect("index.jsp");
            } else {
                // If credentials are invalid, set an error message
                message = "Invalid username or password.";
                request.setAttribute("message", message);
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }

            // Close resources
            rs.close();
            ps.close();
            con.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            message = "Login failed due to an error: " + e.getMessage();
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Login failed due to a database error: " + e.getMessage();
        }

        if (message != null) {
            // If any error occurred, redirect back to login page with the error message
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user login and session creation";
    }
}