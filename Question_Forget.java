import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Question_Forget extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
         String userid = request.getParameter("Uid");
          int i = Integer.parseInt(request.getParameter("question"));
           String answer = request.getParameter("answer");
        Connection con = DBConnection.getConnection();
        PreparedStatement pst = con.prepareStatement("SELECT  Forget_Pass,FrgtPass_Ans FROM login_table where ID=?");
        pst.setString(1,userid);
        ResultSet rs = pst.executeQuery();
        if(rs.next())
        {
          if((rs.getString("FrgtPass_Ans").equals(answer))&&(rs.getInt("Forget_Pass")==i))
          { 
              request.getRequestDispatcher("ForgetPassword.jsp").include(request, response);
             
          }
          else
          {
           out.write("<script type='text/javascript'>\n");
            out.write("alert('Incorrect question and Answer');\n");
            out.write("setTimeout(function(){window.location.href='Login.jsp'},0.0001);");
            out.write("</script>\n");   
          }
        }
        else
        {
            out.write("<script type='text/javascript'>\n");
            out.write("alert('Incorrect UserId');\n");
            out.write("setTimeout(function(){window.location.href='Login.jsp'},0.0001);");
            out.write("</script>\n");
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
