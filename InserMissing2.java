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
public class InserMissing2 extends HttpServlet {
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
           
            Connection con=(Connection)session.getAttribute("con");
             PreparedStatement pst=null;
             con.setAutoCommit(false);
             
             
             if(request.getParameter("ifother")!=null && !request.getParameter("ifother").isEmpty())
             {
              pst = con.prepareStatement("insert into missingpeople_appearance(U_ID, MP_HairType, MP_HairColour, MP_EyebrowsType, MP_EyesType, MP_Teeth, MP_ShapeFace, MP_Complexion, MP_BodyBuild, MP_IdenMark1, MP_IdenPart1, MP_IdenLoc1, MP_IdenMark2, MP_IdenPart2, MP_IdenLoc2, MP_Disabilities, MP_Weight, MP_HeightFeet, MP_HeightInches, MP_MentallyChallenged, MP_IfOther) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
              pst.setString(21,request.getParameter("ifother"));
             }
             else
             {
              pst = con.prepareStatement("insert into missingpeople_appearance(U_ID, MP_HairType, MP_HairColour, MP_EyebrowsType, MP_EyesType, MP_Teeth, MP_ShapeFace,MP_Complexion, MP_BodyBuild, MP_IdenMark1, MP_IdenPart1, MP_IdenLoc1, MP_IdenMark2, MP_IdenPart2, MP_IdenLoc2, MP_Disabilities,MP_Weight,MP_HeightFeet, MP_HeightInches, MP_MentallyChallenged) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");    
              
             }
            pst.setString(1,(String)session.getAttribute("Uid"));
            pst.setInt(2,Integer.parseInt(request.getParameter("HairType")));
            pst.setInt(3,Integer.parseInt(request.getParameter("HairColour")));
            pst.setInt(4,Integer.parseInt(request.getParameter("EyeBrowsType")));
            pst.setInt(5,Integer.parseInt(request.getParameter("EyesType")));
            pst.setInt(6,Integer.parseInt(request.getParameter("Teeth")));
            pst.setInt(7,Integer.parseInt(request.getParameter("ShapeoftheFace")));
            pst.setInt(8,Integer.parseInt(request.getParameter("Complexion")));
            pst.setInt(9,Integer.parseInt(request.getParameter("BodyBuild")));
            pst.setInt(10,Integer.parseInt(request.getParameter("IdentificationMark1")));
            pst.setInt(11,Integer.parseInt(request.getParameter("Part1")));
            pst.setInt(12,Integer.parseInt(request.getParameter("Location1")));
            pst.setInt(13,Integer.parseInt(request.getParameter("IdentificationMark2")));
            pst.setInt(14,Integer.parseInt(request.getParameter("Part2")));
            pst.setInt(15,Integer.parseInt(request.getParameter("Location2")));
            pst.setInt(16,Integer.parseInt(request.getParameter("type")));
            pst.setInt(17,Integer.parseInt(request.getParameter("weight")));
            pst.setInt(18,Integer.parseInt(request.getParameter("Feet")));
            pst.setInt(19,Integer.parseInt(request.getParameter("inches")));
            pst.setString(20,request.getParameter("mental"));
            
             
            int i = pst.executeUpdate();
            if(i>0)
            {
                response.sendRedirect("Photo.jsp");
            }
            else
            {
                con.rollback();
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
