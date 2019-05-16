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
import javax.swing.JOptionPane;
public class N_Registeration extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement pst=con.prepareStatement("insert into ngo_details(N_ID,N_name,N_Address,N_Pincode,N_ref,N_ValidNo,N_Val_NonVal,N_State) values(?,?,?,?,?,?,?,?)");
            String N_Id=request.getParameter("O_Id");
            String Name=request.getParameter("name");
            String Address=request.getParameter("address");
            String Password=request.getParameter("password");
            String Repassword=request.getParameter("repassword");
            String Email=request.getParameter("email");
            String Security_ans=request.getParameter("security_ans");
            String Security_ques=request.getParameter("security_ques");
            String Pincode=request.getParameter("pincode");
            String Institution=request.getParameter("institution");
            String V_number = request.getParameter("v_number");
            con.setAutoCommit(false);
           PreparedStatement pt=con.prepareStatement("select * from ngo_details where N_ID=?");
           pt.setString(1,N_Id);
           ResultSet t=pt.executeQuery();
           if(t.next())
           {
            JOptionPane.showMessageDialog(null,"Is Ngo_id is already used","Error",JOptionPane.ERROR_MESSAGE);
            response.sendRedirect("Login.jsp");
           }
        else
           {
               PreparedStatement p = con.prepareStatement("select Number from reference where R_Name= ?");
           
                 p.setString(1,Institution);
                 ResultSet rs=p.executeQuery();
                  if(!Password.equals(Repassword))
                     {
                         JOptionPane.showMessageDialog(null,"Password is not same","Error",JOptionPane.ERROR_MESSAGE);
                          RequestDispatcher r =request.getRequestDispatcher("Login.jsp");
                         // out.println("<font<h1><b>Incorrect Password</b></h1>");
                          r.forward(request,response);
                       }
                   else
                       {  
                            pst.setString(1,N_Id);
                            pst.setString(2,Name);
                            pst.setString(3,Address);
                            pst.setString(4,Pincode);
                            rs.next();
                            pst.setInt(5,rs.getInt("Number"));
                            pst.setString(6,V_number);
                            pst.setInt(7,2);
                            pst.setInt(8,Integer.parseInt(request.getParameter("State")));
                         try{
                               int j = pst.executeUpdate();
                               
                              if(j>0)
                                { int i=1;
                                
                                       PreparedStatement pst3=con.prepareStatement("insert into login_table(Email,ID,Password,Type_of_users,Forget_Pass,FrgtPass_Ans) values(?,?,?,?,?,?)");
                                       pst3.setString(1,Email);
                                       pst3.setString(2,N_Id);
                                       pst3.setString(3,Password);
                                       pst3.setInt(4,3);
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
                                      con.commit();
                                      JOptionPane.showMessageDialog(null,"Your request is send to admin");
                                       response.sendRedirect("Login.jsp");
                                    }
                                   else
                                       {
                                           con.rollback();
                                        JOptionPane.showMessageDialog(null,"You request is not successfully send to admin");
                                        response.sendRedirect("Login.jsp");
                                       }
                          }catch(Exception e){
                             System.out.println(e);
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
