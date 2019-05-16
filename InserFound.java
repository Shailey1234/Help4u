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
public class InserFound extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into found_missingpeople(U_ID, F_Address, F_Reason, F_FoundBy) values(?,?,?,?)");
                     pst.setString(1,(String)session.getAttribute("Uid"));
                     pst.setString(2,request.getParameter("address"));
                     pst.setString(3,request.getParameter("reason"));
                     pst.setString(4,request.getParameter("found"));
                     int i = pst.executeUpdate();
                    if(i>0)
                    {//out.println("hiii");
                     /*out.write("<script type='text/javascript'>\n");
                     out.write("alert('Successfully Submitted');\n");
                     out.write("setTimeout(function(){window.loaction.href='AfterLogin.jsp'},10);)\n");
                     out.write("</script>\n");*/
                        
                        response.sendRedirect("AfterLogin.jsp");
                    }
                    else
                    {
                      response.sendRedirect("foundForm.jsp");
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
