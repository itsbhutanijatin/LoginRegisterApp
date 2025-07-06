import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // DB Connection
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/loginapp", "root", "123#Avenger");

            // Insert Query
            String sql = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                // Store username in session
                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                // Redirect to home.jsp
                response.sendRedirect("success.html");
            } else {
                response.getWriter().println("Registration Failed!");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
