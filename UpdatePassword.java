import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class UpdatePassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
          String password = request.getParameter("new");  
          String userid = request.getParameter("Uid");
            System.out.println(userid);
        Connection con = DBConnection.getConnection();
        PreparedStatement pst = con.prepareStatement("UPDATE login_table set Password =? where ID=?");
        pst.setString(2,userid);
        pst.setString(1,password);
        int i =pst.executeUpdate();
        if(i>0)
        {
            out.write("<script type='text/javascript'>\n");
            out.write("alert('Password Updated');\n");
            out.write("setTimeout(function(){window.location.href='Login.jsp'},0.0001);");
            out.write("</script>\n");    
        }else{
            out.write("<script type='text/javascript'>\n");
            out.write("alert('Password not updated');\n");
            out.write("setTimeout(function(){window.location.href='SecurityQuestion.jsp'},0.0001);");
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
