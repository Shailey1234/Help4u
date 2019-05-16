

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% if((String)session.getAttribute("Name")==null)
        {
          response.sendRedirect("Login.jsp");
        }
        %>
        <% 
            String N_ID = request.getParameter("N_ID");
           Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
             PreparedStatement pst=con.prepareStatement("Update ngo_details set N_Val_NonVal=1 where N_ID=?");
             pst.setString(1,N_ID);
             int i = pst.executeUpdate();
             if(i>0)
             {
             response.sendRedirect("Admin.jsp");}
             else
             {
             response.sendRedirect("admin-verifyNgo.jsp");    
             }
        %>
    </body>
</html>
