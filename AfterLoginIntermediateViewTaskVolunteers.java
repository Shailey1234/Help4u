import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import sun.security.pkcs11.wrapper.Functions;
public class AfterLoginIntermediateViewTaskVolunteers extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            Connection con=DBConnection.getConnection();
            PreparedStatement pst=con.prepareStatement("select Validated_By_Admin from volunteer_login where U_ID=?");
            pst.setString(1,(String)session.getAttribute("Uid"));
            ResultSet rs = pst.executeQuery();
            if(rs.next())
            {
                if(rs.getInt("Validated_By_Admin")==1)
                  {
                     response.sendRedirect("ViewTaskVolunteers.jsp");
                   }
                  else{
                        response.sendRedirect("Sorry.jsp");  
                      }
            }
            else
            {
                JOptionPane.showMessageDialog(null,"You are not Volunteer , Fill a request Form of Volunteer");
                response.sendRedirect("AfterLogin.jsp");
            }
        }catch(Exception e)
         {
             System.out.println(e);
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
