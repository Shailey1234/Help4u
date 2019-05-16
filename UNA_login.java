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
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingListener;
import javax.swing.JOptionPane;

public class UNA_login extends HttpServlet{

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try {
        Connection con =DBConnection.getConnection();
        String uid=request.getParameter("uid");
         String password=request.getParameter("password");
         HttpSession session =request.getSession();
        PreparedStatement ps=con.prepareStatement("select * from login_table where ID=? and Password=?");
         ps.setString(1,uid);
         ps.setString(2,password);
         ResultSet rs=ps.executeQuery();
          if(rs.next())
           {
               
               session.setAttribute("Uid",rs.getString("ID"));
               
             
             if(rs.getInt("Type_of_users")==1)
             {
               PreparedStatement pst=con.prepareStatement("select * from user_details where U_ID=?");
               pst.setString(1,uid);
               ResultSet rt = pst.executeQuery();
               rt.next();
               session.setAttribute("Name",rt.getString("Name"));
               response.sendRedirect("AfterLogin.jsp");
             }
             else if(rs.getInt("Type_of_users")==2)
             {
               PreparedStatement pst=con.prepareStatement("select * from user_details where U_ID=?");
               pst.setString(1,uid);
               ResultSet rt = pst.executeQuery();
               rt.next();
               session.setAttribute("Name",rt.getString("Name"));
               response.sendRedirect("Admin.jsp");  
             }
             else
             {
                PreparedStatement pst=con.prepareStatement("select * from ngo_details where N_ID=? and N_Val_NonVal=1"); 
                pst.setString(1,uid);
                ResultSet rt = pst.executeQuery();
                
                if(rt.next())
                { 
                    session.setAttribute("Name",rt.getString("N_Name"));
                    response.sendRedirect("NGO_login.jsp");
                }
                else
                {
                     JOptionPane.showMessageDialog(null,"You are not verified by admin","Error",JOptionPane.ERROR_MESSAGE);
                    response.sendRedirect("Login.jsp");
                }    
              }
           }
      else
      {
          JOptionPane.showMessageDialog(null,"Wrong Password or UserId","Error",JOptionPane.ERROR_MESSAGE);
           response.sendRedirect("Login.jsp");
      }
    }catch(Exception ex)
    {
        System.out.println(ex);
        response.sendRedirect("Login.jsp");
    }
 }
}
