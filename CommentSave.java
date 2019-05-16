import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
public class CommentSave extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String comment = request.getParameter("comment");
            String uploadid = request.getParameter("userid");
             Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into comment(User_ID, ID, Comment) values(?,?,?)");
            pst.setString(1,uploadid);
            pst.setString(2,(String)session.getAttribute("Uid"));
            pst.setString(3,comment);
            int i = pst.executeUpdate();
            if(i>0)
            { 
                JOptionPane.showMessageDialog(null,"Comment saved");
              //out.write("setTimeout(function(){window.location.href='Timeline.jsp'},0.0001);");
              //out.write("</script>\n");
                response.sendRedirect("Timeline.jsp");
               }
        }catch(Exception ex)
        {
            System.out.println(ex);
            out.close();
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
