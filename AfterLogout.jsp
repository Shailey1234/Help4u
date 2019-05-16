<%-- 
    Document   : AfterLogout
    Created on : Apr 19, 2018, 9:37:35 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            session.invalidate();
            out.print("<script type='text/javascript'>\n");
            out.print("alert('you have logged out');\n");
             out.print("window.history.forward(-1);");
            out.print("setTimeout(function(){window.location.href='Login.jsp'},0.0001);");
           
            out.print("</script>");
            
        %>
    </body>
</html>
