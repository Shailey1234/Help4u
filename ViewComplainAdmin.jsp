<%-- 
    Document   : ViewJob
    Created on : Mar 26, 2018, 11:44:37 PM
    Author     : abc
--%>

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
       <table>
           <tr>
            <table width="940" cellspacing="15" cellpadding="2S">
                <tr>
                   <td>
                    <img src="team-avatar2.png" alt="User" style="width:20%">
                   </td>
                  <td>
                   <img src="team-avatar2.png" alt="User" style="width:20%">
                  </td>
               </tr>
               <tr>
                   <td>
                       <b>Missing Person Name :</b> <b><i>#</i></b>
                   </td>
                   <td>
                       <b>Request Accepted By :</b> <b><i>#</i></b> ON <b>#</b>
                   </td>
               </tr>
               <tr>
                <td>
                    <b>Report Us ON :</b>
                   </td>
                   <td>
                       <b>Accepted By NGO On :</b>
                   </td>
               </tr>
            <tr>
    <td>
    </td>
     <td>
         <button style="align:center";"><a href="register.html">View Details</a></button>
     </td>
            </tr>
            </table>
        </tr>
          </table>
    </body>
</html>
