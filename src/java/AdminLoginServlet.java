import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/adminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if(username.equals("admin") && password.equals("admin123")) {
            // Create session and redirect to admin panel
            HttpSession session = request.getSession();
            session.setAttribute("admin", "true");
            response.sendRedirect("adminPanel.jsp");
        } else {
            // Invalid credentials, redirect back to login page
            response.sendRedirect("login.jsp?error=Invalid Credentials");
        }
    }
}
