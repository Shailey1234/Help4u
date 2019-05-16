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
public class UpdateChangePassword extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try { HttpSession session = request.getSession();
              if(session.getAttribute("Name")==null)
              {
                  response.sendRedirect("Login.jsp");
              }
              String current = request.getParameter("current");
              String newpass = request.getParameter("newpass");
              String confirmpass = request.getParameter("confirmpass");
              
              
                  Connection con= DBConnection.getConnection();
                  PreparedStatement pst = con.prepareStatement("select Password,Type_of_users from login_table where ID=?");
                  pst.setString(1,(String)session.getAttribute("Uid"));
                  ResultSet rs = pst.executeQuery();
                  if(rs.next())
                  {
                      if(!newpass.equals(confirmpass))
                        {
                           JOptionPane.showMessageDialog(null,"New password and current password doesn't match");
                           if(rs.getInt("Type_of_users")==3)
                           response.sendRedirect("ChangePassword.jsp");
                           else if(rs.getInt("Type_of_users")==2)
                                response.sendRedirect("AdminChangePass.jsp");
                           else
                               response.sendRedirect("");
                        } 
                     else if(current.equals(rs.getString("Password")))
                      {
                          pst = con.prepareStatement("Update login_table set Password=? where ID=?");
                          pst.setString(1,newpass);
                          pst.setString(2,(String)session.getAttribute("Uid"));
                          int i = pst.executeUpdate();
                          if(i>0)
                          {   
                              JOptionPane.showMessageDialog(null,"Successfully Updated");
                              if(rs.getInt("Type_of_users")==3)
                           response.sendRedirect("ChangePassword.jsp");
                           else if(rs.getInt("Type_of_users")==2)
                                response.sendRedirect("AdminChangePass.jsp");
                           else
                               response.sendRedirect("AfterLogin.jsp");
                          }
                          else
                          {
                           JOptionPane.showMessageDialog(null,"Not Successfully Updated");   
                          }
                      }
                      else{
                          JOptionPane.showMessageDialog(null,"Current Password Incorrect");
                      }
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
