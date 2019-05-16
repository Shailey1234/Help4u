import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import jdk.nashorn.internal.parser.TokenType;
public class VolunteersForm extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection con= DBConnection.getConnection();
            PreparedStatement pst=con.prepareStatement("insert into volunteer_login values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
             HttpSession session= request.getSession();
            String Address=request.getParameter("address");
            String Pincode=request.getParameter("pincode");
            int State=Integer.parseInt(request.getParameter("State"));
            String Phone = request.getParameter("phno");
            int Verify=Integer.parseInt(request.getParameter("Verify"));
            String VerifyNumber=request.getParameter("VerifyNumber");
            int boards=Integer.parseInt(request.getParameter("boards"));
            String Passyear12=request.getParameter("Passyear12");
            int undergraduate=Integer.parseInt(request.getParameter("undergraduate"));
            String PassyearUg=request.getParameter("Passyear12");
            int availability=Integer.parseInt(request.getParameter("availability"));
            int Starttime=Integer.parseInt(request.getParameter("Starttime"));
            int Endtime=Integer.parseInt(request.getParameter("Endtime"));
            String experience=request.getParameter("experience");
            String array3[]=Passyear12.split("-");
            int Passyr12 =Integer.parseInt(array3[0]);
            String array[]=PassyearUg.split("-");
            int PassyrUg =Integer.parseInt(array[0]);
            con.setAutoCommit(false);
            if(Starttime>Endtime)
            {
                JOptionPane.showMessageDialog(null,"Start Time is Greater than End time");
                response.sendRedirect("Volunteers.jsp");
            }
            else if((Passyr12>PassyrUg))
            {
              JOptionPane.showMessageDialog(null,"Year of Passing of Secondary is greater than Year of Passing of UnderGraduation ");
                response.sendRedirect("Volunteers.jsp");  
            }
            else{
               pst.setString(1,(String)session.getAttribute("Uid"));
               pst.setString(2,Address);
               pst.setInt(3,Integer.parseInt(Pincode));
               pst.setInt(4,State);
               pst.setLong(5,Long.parseLong(Phone));
               pst.setString(6,VerifyNumber);
               pst.setInt(7,Verify);
               pst.setInt(8,boards);
               pst.setInt(9,Passyr12);
               pst.setInt(10,undergraduate);
               pst.setInt(11,PassyrUg);
               pst.setInt(12,availability);
               pst.setInt(13,Starttime);
               pst.setInt(14,Endtime);
               pst.setString(15,experience);
               pst.setInt(16,2);
              int j=pst.executeUpdate();
             if(j>0)
             {
              PreparedStatement ps=con.prepareStatement("insert into no_of_tasks values(?,?)");
              ps.setString(1,(String)session.getAttribute("Uid"));
              ps.setInt(2,0);
              int i=ps.executeUpdate();
              if(i>0)
              { int k;
                 PreparedStatement t=con.prepareStatement("select Purpose from user_details where U_ID=?");
                 t.setString(1,(String)session.getAttribute("Uid"));
                 ResultSet result=t.executeQuery();
                 result.next();
                  if((result.getInt("Purpose"))==0)
                  { PreparedStatement p=con.prepareStatement("UPDATE user_details set Purpose=2 where U_ID=?");
                    p.setString(1,(String)session.getAttribute("Uid"));
                    k=p.executeUpdate();
                  }
                  else
                  {
                   PreparedStatement s=con.prepareStatement("UPDATE user_details set Purpose=3 where U_ID=?");
                    s.setString(1,(String)session.getAttribute("Uid"));
                    k=s.executeUpdate();
    
                   }
                  if(k>0)
                  { 
                     con.commit(); 
                    JOptionPane.showMessageDialog(null,"You Have Successfully Registered");
                    response.sendRedirect("AfterLogin.jsp");
                  }
                  else
                  {
                      con.rollback();
                      JOptionPane.showMessageDialog(null,"You Have Not Successfully Registered");
                      response.sendRedirect("AfterLogin.jsp");  
                    }
                  }
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
