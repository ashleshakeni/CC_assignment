/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ashle
 */
@WebServlet(urlPatterns = {"/register"})
public class register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String phone = request.getParameter("phone");
            String message;
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thrift", "root", "123456");

            String query = "INSERT INTO users (fullname, email, username, password, phone_number) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.setString(5, phone);
            int row = ps.executeUpdate();

            if (row > 0) {
                response.sendRedirect("login.jsp?message=Registration successful! Please login.");
                return;
            } else {
                message = "Registration failed.";
            }

            ps.close();
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
//
//import jakarta.servlet.RequestDispatcher;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.Properties;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//@WebServlet(urlPatterns = {"/register"})
//public class register extends HttpServlet {
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            String fullname = request.getParameter("fullname");
//            String email = request.getParameter("email");
//            String username = request.getParameter("username");
//            String password = request.getParameter("password");
//            String phoneNumber = request.getParameter("phone"); // Retrieve phone number
//            String message;
//
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thrift", "root", "123456");
//
//            String query = "INSERT INTO users (fullname, email, username, password, phone) VALUES (?, ?, ?, ?, ?)";
//            PreparedStatement ps = con.prepareStatement(query);
//            ps.setString(1, fullname);
//            ps.setString(2, email);
//            ps.setString(3, username);
//            ps.setString(4, password);
//            ps.setString(5, phoneNumber); // Insert phone number
//            int row = ps.executeUpdate();
//
//            if (row > 0) {
//                sendConfirmationEmail(email, fullname);
//                response.sendRedirect("login.jsp?message=Registration successful! Please login.");
//                return;
//            } else {
//                message = "Registration failed.";
//            }
//
//            ps.close();
//            con.close();
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace();
//        }
//        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void sendConfirmationEmail(String email, String fullname) {
//        String to = email;
//        String from = "your-email@example.com"; // Your email address
//        String host = "smtp.example.com"; // SMTP server (e.g., smtp.gmail.com for Gmail)
//
//        final String usernameSMTP = "your-email@example.com"; // Your email address
//        final String passwordSMTP = "your-app-specific-password"; // Your email password or app-specific password
//
//        Properties properties = System.getProperties();
//        properties.setProperty("mail.smtp.host", host);
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.smtp.port", "587"); // Port for TLS
//
//        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(usernameSMTP, passwordSMTP);
//            }
//        });
//
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(from));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            message.setSubject("Registration Successful");
//            message.setText("Dear " + fullname + ",\n\nThank you for registering on our website.\n\nBest regards,\nYour Website Team");
//
//            Transport.send(message);
//            System.out.println("Email sent successfully...");
//        } catch (MessagingException mex) {
//            mex.printStackTrace();
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }
//}
