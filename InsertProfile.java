import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
@MultipartConfig(maxFileSize = 16177216)
public class InsertProfile extends HttpServlet {
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
            Part part=request.getPart("image");
            if(part!=null)
            {
              Connection con=DBConnection.getConnection();
                PreparedStatement pst = con.prepareStatement("insert into profilepic values(?,?)");  
                pst.setString(1,(String)session.getAttribute("Uid"));
                InputStream in = part.getInputStream();
                pst.setBlob(2,in);
                int i = pst.executeUpdate();
                if(i>0)
                 {
                 //con.close();
                     JOptionPane.showMessageDialog(null,"Successfully Inserted");
                     response.sendRedirect("AfterLogin.jsp");
                 }
                 else
                   {
                   
                     JOptionPane.showMessageDialog(null,"Not Successfully Inserted Try Again");
                     response.sendRedirect("UserProfileView.jsp");
                    
                   }
             }
            else
            {
               JOptionPane.showMessageDialog(null,"Select Photo");
                     response.sendRedirect("UserProfileView.jsp");
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
