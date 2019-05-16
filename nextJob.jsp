
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
                PreparedStatement pst=con.prepareStatement("select * from volunteer_login where Validated_By_Admin=1 and U_ID=?");
                 pst.setString(1,(String)session.getAttribute("U_ID"));
                 ResultSet rs = pst.executeQuery();
                 if(rs.next())
                 {
                     response.sendRedirect("ViewTaskVolunteers.jsp");
                 }
                 else
                 {
                     JOptionPane.showMessageDialog(null,"You have not filled the form/You are not Validated By Admin");
                     response.sendRedirect("AfterLogin.jsp");
                 }
        %>
    </body>
</html>
