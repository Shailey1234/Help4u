import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
@WebServlet(name="U_Registeration",urlPatterns = {"/U_Registeration"})
public class U_Registeration extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             int i=1;
             
            Connection con= DBConnection.getConnection();
            PreparedStatement pst=con.prepareStatement("insert into user_details(U_ID,Name,Type,DOB,Address,Pincode,Gender,Purpose) values(?,?,?,?,?,?,?,?)");
            String Uid=request.getParameter("Uid");
            String Name=request.getParameter("name");
            String Address=request.getParameter("address");
            String Dob = request.getParameter("dob");
            //SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
           // Date startDate = (Date) sdf.parse(startDateStr);
            String Password=request.getParameter("password");
            String Repassword=request.getParameter("repassword");
            String Email=request.getParameter("email");
            String Security_ans=request.getParameter("security_ans");
            String Security_ques=request.getParameter("security_ques");
            String Pincode=request.getParameter("pincode");
            String Gender=request.getParameter("gender");
   
           PreparedStatement p=con.prepareStatement("select * from user_details where U_ID=?");
           p.setString(1,Uid);
           ResultSet r=p.executeQuery();
           if(r.next())
           {
              JOptionPane.showMessageDialog(null,"This UserId id already used by someone","Error",JOptionPane.ERROR_MESSAGE); 
              response.sendRedirect("Login.jsp");
           }
          else
           {   if(!Password.equals(Repassword))
                 {
                    JOptionPane.showMessageDialog(null,"Password is not same","Error",JOptionPane.ERROR_MESSAGE);
                   //RequestDispatcher rd =request.getRequestDispatcher("RegisterationForm.html");
                    response.sendRedirect("Login.jsp");
                   
                 }
              else
                {  PreparedStatement pst1=con.prepareStatement("select Number from gender where Name=?");
                    pst1.setString(1,Gender);
        
                    ResultSet rst= pst1.executeQuery();
                
                    rst.next();
                   pst.setString(1,Uid);
                   pst.setString(2,Name);
               
                   pst.setInt(3,1);
               
                  pst.setDate(4,java.sql.Date.valueOf(Dob));
               
                  pst.setString(5,Address);
               
                  pst.setString(6,Pincode);
               
                  pst.setInt(7,rst.getInt("Number"));
              
                  pst.setInt(8,0);
               
                 try{
                     int j = pst.executeUpdate();
                      if(j>0)
                   {
                       PreparedStatement pst3=con.prepareStatement("insert into login_table(Email,ID,Password,Type_of_users,Forget_Pass,FrgtPass_Ans) values(?,?,?,?,?,?)");
                         pst3.setString(1,Email);
                        pst3.setString(2,Uid);
              
                        pst3.setString(3,Password);
                          pst3.setInt(4,1);
                      if(Security_ques.equals("1"))
                            i=1;
                      else if(Security_ques.equals("2"))
                            i=2;
                      else if(Security_ques.equals("3"))
                            i=3;
                      else if(Security_ques.equals("4"))
                            i=4;
                      else if(Security_ques.equals("5"))
                             i=5;
                      else if(Security_ques.equals("6"))
                             i=6;
                      else if(Security_ques.equals("7"))
                             i=7;
                      pst3.setInt(5,i);
                      pst3.setString(6,Security_ans);  
                      pst3.executeUpdate();
                      JOptionPane.showMessageDialog(null,"You Successfully Registered");
                      RequestDispatcher rd =request.getRequestDispatcher("Login.jsp");
                     rd.forward(request, response);
                     }
                    else
                     {
                      out.println("Data is not Stored");  
                    }
                    }catch(Exception e){
                   System.out.println(e);
                    }
                 }
               }
      }catch(Exception ex) {
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
