import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
public class InserMissing1 extends HttpServlet {
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            PreparedStatement pst=null;
            Date date = new Date();
            session.setAttribute("con",con);
            con.setAutoCommit(false);
             java.text.SimpleDateFormat sdf =new java.text.SimpleDateFormat("yyyy-MM-dd");
             String currentDate = sdf.format(date);
            if(request.getParameter("Nickname")!= null && !request.getParameter("Nickname").isEmpty())
            {
                if(request.getParameter("LNumber")!= null && !request.getParameter("LNumber").isEmpty())
                {
                  pst = con.prepareStatement("insert into missingpeople_details(U_ID, MP_Name, MP_Gender, MP_DOB, MP_Fname, MP_Mname, MP_Gname, MP_Grelation, MP_LangSpoken, MP_MTongue, MP_Religion, MP_ReasonMissing, MP_DOM, MP_Address, MP_State, MP_Pincode, MP_MobNo, MP_AlternateNo, MP_ReportDate, MP_Accept , MP_Nickname, MP_LandlineNo)  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
                  pst.setString(21,request.getParameter("Nickname"));
                  pst.setLong(22,Long.parseLong( request.getParameter("LNumber")));
                }
                else
                {
                 pst = con.prepareStatement("insert into missingpeople_details(U_ID, MP_Name, MP_Gender, MP_DOB, MP_Fname, MP_Mname, MP_Gname, MP_Grelation, MP_LangSpoken, MP_MTongue, MP_Religion, MP_ReasonMissing, MP_DOM, MP_Address, MP_State, MP_Pincode, MP_MobNo, MP_AlternateNo, MP_ReportDate, MP_Accept , MP_Nickname) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");    
                 pst.setString(21,request.getParameter("Nickname"));
                }
            }
            else
            {
             if(request.getParameter("LNumber")!= null && !request.getParameter("LNumber").isEmpty())
             {
                 pst = con.prepareStatement("insert into missingpeople_details(U_ID, MP_Name, MP_Gender, MP_DOB, MP_Fname, MP_Mname, MP_Gname, MP_Grelation, MP_LangSpoken, MP_MTongue, MP_Religion, MP_ReasonMissing, MP_DOM, MP_Address, MP_State, MP_Pincode, MP_MobNo, MP_AlternateNo, MP_ReportDate, MP_Accept , MP_LandlineNo) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");    
                 pst.setLong(21,Long.parseLong( request.getParameter("LNumber")));
             }
             else
             {
                 pst = con.prepareStatement("insert into missingpeople_details(U_ID, MP_Name, MP_Gender, MP_DOB, MP_Fname, MP_Mname, MP_Gname, MP_Grelation, MP_LangSpoken, MP_MTongue, MP_Religion, MP_ReasonMissing, MP_DOM, MP_Address, MP_State, MP_Pincode, MP_MobNo, MP_AlternateNo, MP_ReportDate, MP_Accept) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");    
             }
            }
            
            pst.setString(1,(String)session.getAttribute("Uid"));
            pst.setString(2,request.getParameter("Name"));
            pst.setInt(3,Integer.parseInt(request.getParameter("gender")));
            pst.setDate(4,java.sql.Date.valueOf(request.getParameter("dob")));
            pst.setString(5,request.getParameter("FName"));
            pst.setString(6,request.getParameter("MName"));
            pst.setString(7,request.getParameter("GName"));
            pst.setString(8,request.getParameter("RelGuardian"));
            pst.setString(9,request.getParameter("LSpoken"));
            pst.setString(10,request.getParameter("MTongue"));
            pst.setInt(11,Integer.parseInt(request.getParameter("Religion")));
            pst.setString(12,request.getParameter("ReasonforMissing"));
            pst.setDate(13,java.sql.Date.valueOf(request.getParameter("dom")));
            pst.setString(14,request.getParameter("address"));
            pst.setInt(15,Integer.parseInt(request.getParameter("state")));
            pst.setInt(16,Integer.parseInt(request.getParameter("Pincode")));
            pst.setLong(17,Long.parseLong(request.getParameter("MNumber")));
            pst.setLong(18,Long.parseLong(request.getParameter("ANumber")));
            pst.setDate(19,java.sql.Date.valueOf(currentDate));
            pst.setInt(20,0);
           int i = pst.executeUpdate();
           if(i>0)
           {  // con.commit();
               
               response.sendRedirect("SecMissingReport.jsp");
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
