<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <%
            if((String)session.getAttribute("Name")==null)
            {
               response.sendRedirect("Login.jsp");
            }
         try{
             Date date = new Date();
             java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
             String currentdate = sdf.format(date);
             String Uid = request.getParameter("Uid");
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
               con.setAutoCommit(false);
              PreparedStatement pst = con.prepareStatement("Update missingpeople_details set MP_Accept=1 where U_ID=?");
             pst.setString(1,Uid);
             int j = pst.executeUpdate();
             if(j>0)
             {
            pst = con.prepareStatement("insert into accept_missing(user_id, ngo_id, AcceptDate) values(?,?,?)");
             pst.setString(1,Uid);
             pst.setString(2,(String)session.getAttribute("Uid"));
             pst.setDate(3,java.sql.Date.valueOf(currentdate));
             int i = pst.executeUpdate();
             if(i>0)
             {
               con.commit();
               JOptionPane.showMessageDialog(null,"successfully accepted");
               response.sendRedirect("NGO_login.jsp");
             }
             else
             {
                con.rollback();
               JOptionPane.showMessageDialog(null,"NOT successfully accepted");
               response.sendRedirect("NGO_login.jsp");
             }
             }
            }catch(Exception ex)
              {
                 System.out.println(ex);
              }
        %>
    </body>
</html> 
