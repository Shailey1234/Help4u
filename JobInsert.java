import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
public class JobInsert extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            PreparedStatement pst=con.prepareStatement("insert into task(T_Name, T_Descri, T_Timelimit, T_Accept, T_LastDate_Accept, ID, typeOfUser) values(?,?,?,?,?,?,?)");
            //HttpSession session= request.getSession();
            System.out.println("sxc");
            String Jname=request.getParameter("Jname");
            String description=request.getParameter("description");
            String ApplyDate=request.getParameter("Adate");
            String LastDate=request.getParameter("Ldate");
            String j=request.getParameter("tab");
            System.out.println("kjmk");
            String array3[]=ApplyDate.split("-");
            String array[]=LastDate.split("-");
            if(Integer.parseInt(array[0])<Integer.parseInt(array3[0]))
            {
              JOptionPane.showMessageDialog(null,"Apply date is greater than End date");
              response.sendRedirect("Admin.jsp");
            }
            else
            { int i=0;
              System.out.println("sxc");
              pst.setString(1,Jname);
              pst.setString(2,description);
              pst.setDate(3,java.sql.Date.valueOf(LastDate));
              pst.setInt(4,0);
              pst.setDate(5,java.sql.Date.valueOf(ApplyDate));
              if(j.equals("user"))
              {
              pst.setString(6,request.getParameter("user"));
              pst.setInt(7,1);
               System.out.println("sxc"); 
              }
              else 
              { 
                  if(j.equals("ngo"))
                   {
                     pst.setString(6,request.getParameter("ngo"));
                     pst.setInt(7,3);
                   }
               System.out.println("ngo");
              }
               System.out.println("before");
             int k=pst.executeUpdate(); 
             System.out.println("sxc");
             if(k>0)
             {
                 JOptionPane.showMessageDialog(null,"Job Successfully Registered");
                 response.sendRedirect("Admin.jsp");
             }
             else
             {
                JOptionPane.showMessageDialog(null,"Job not Successfully Registered");
                 response.sendRedirect("Admin.jsp");
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
