import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
public class after___Volunteer extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           HttpSession session = request.getSession();
            if(session.getAttribute("Name")==null)
              {
                 response.sendRedirect("Login.jsp"); 
              }
           
            Class.forName("com.mysql.jdbc.Driver");
             Connection conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            PreparedStatement pst1 = conn.prepareStatement("select verify from volunteer_login where U_ID=?");
            pst1.setString(1,(String)session.getAttribute("Uid"));
            ResultSet rs=pst1.executeQuery();
            if(rs.next())
            {
                JOptionPane.showMessageDialog(null,"You Have Already Filled The form");
                conn.close();
                response.sendRedirect("AfterLogin.jsp");
             }
            else
            {
               request.getRequestDispatcher("Volunteers.jsp").forward(request, response);
            }
        }catch(Exception ex)
        {
            System.out.println(ex);
        }
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
