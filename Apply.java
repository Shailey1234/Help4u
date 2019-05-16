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
public class Apply extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
              
              HttpSession session=request.getSession();
              String T_Name=request.getParameter("T_Name");
              Connection con = DBConnection.getConnection();
              con.setAutoCommit(false);
              PreparedStatement pst =con.prepareStatement("Insert into applytask(T_Name, U_ID) values(?,?)");
              pst.setString(1,T_Name);
              pst.setString(2,(String)session.getAttribute("Uid"));
              int i=pst.executeUpdate();
              if(i>0)
              {
               pst=con.prepareStatement("select No_Tasks from no_of_tasks where U_ID=?");
               pst.setString(1,(String)session.getAttribute("Uid"));
               ResultSet x=pst.executeQuery();
               x.next();
               int y = x.getInt("No_Tasks");
               y++;
               pst =con.prepareStatement("Update no_of_tasks set No_Tasks=? where U_ID=?");   
               pst.setInt(1,y);
               pst.setString(2,(String)session.getAttribute("Uid"));
               int m=pst.executeUpdate();
               if(m>0)
               {
               pst =con.prepareStatement("Update task set T_Accept=? where T_Name=?");   
               pst.setInt(1,1);
               pst.setString(2,T_Name);
               i=pst.executeUpdate();
               if(i>0)
               {
                   con.commit();
                   JOptionPane.showMessageDialog(null,"YOU have successfully Assigned Job");
                   response.sendRedirect("AfterLogin.jsp");
               }
               else
                   con.rollback();
               
               }else
               {
                   con.rollback();
               }
              }
                  
        }catch(Exception ex){
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
