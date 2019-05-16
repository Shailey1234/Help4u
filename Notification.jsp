<%-- 
    Document   : Notification
    Created on : Apr 5, 2018, 10:50:31 AM
    Author     : abc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
           <style>
* {
		box-sizing: border-box;
		}
		body {
			margin:0;
			font-family: Arial;
			overflow: scroll;
		}
	.header {
			overflow:hidden;
			background-color:#b3e0ff;
			padding: 20px 10px;
		}
	.header a {
		float: left;
		color: #66b5ff;
		text-align:center;
		padding: 12px;
		text-decoration:  none;
		font-size: 18px;
		line-height: 25px;
 		border-radius: 4px;
		}
	.header a.logo {
			overflow:hidden;
			display:block;
			float:left;
		}
	.header-left {
			float:right;
		}

	.header a:hover {
		background-color:#ddd;
		 color: #0084ff;
		}
	.header-right{
		float:right;
		}
	.button1 {
			background-color:#38acec;
			border:none;
			color: white;
			padding: 20px;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size: 16px;
			cursor:pointer;
			float:left;
		}
			.buttonr {
			background-color:#38acec;
			border:none;
			color: white;
			padding: 20px;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size: 16px;
			cursor:pointer;
			float:left;
		}
	.roundbutton {
			border-radius: 50%;
                        float: left;
		}
	.roundbutton:hover {
		background-color:#ddd;
		 color: #0084ff;
		}
		.footer {
			left: 0;
			bottom: 0;
			width: 100%;
                        background-color: #b3e0ff;
			color: black;
			text-align: left;
			}
	nav{
	height:42px;
	background-color:#38acec;
        width: 1350px;
}

 nav ul{
	list-style:none;
}
 
nav ul li a{
	float:left;
	text-decoration:none;
	color:white;
	padding:0px 40px;
	text-align:center;
	line-height:42px;
}

nav ul li a:hover{
	background-color:white;
	color:cornflowerblue;
	border-radius:8px;
}	
  </style>
   </head>
    <body background="back.jpg">
        <%
             if(session.getAttribute("Name")==null)
             {
               response.sendRedirect("Login.jsp");
             }
            %>
        <div class="header">
		<img src="logo.png" alt="logo" class="logo" height="50" width="200">
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
			<button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 100px; height:60px; float: left;"">FAQ</button></a>
		</div>
        </div>
        <table>
            <tr>
<td valign="middle" height="30" bgcolor="white" style="color:black;font-size: 40px;font-family:serif;">
    <b><center>${Name}</center></b>
    
</td>
            </tr>
<tr><td colspan="3" valign="middle" height="30" bgcolor="white"><nav>
<ul>
<li><a href="NGO_login.jsp" class="active"> Home</a></li>
<li><a href="ChangePassword.jsp">Change Password</a></li>
<li><a href="Logout">Logout</a></li>
</ul>
</nav></td>
</tr>


        <%
        try{
         Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
        PreparedStatement pst = con.prepareStatement("SELECT user_id from accept_missing where ngo_id=? order by AcceptDate desc");
        pst.setString(1,(String)session.getAttribute("Uid"));
        ResultSet rs = pst.executeQuery();
        while(rs.next())    
        {
          
          pst=con.prepareStatement("select * from  found_missingpeople where U_ID=?");
          pst.setString(1,rs.getString("user_id"));
          ResultSet hell = pst.executeQuery();
          if(hell.next())
          { 
          pst=con.prepareStatement("select MP_Name,MP_State from  missingpeople_details where U_ID=?");  
          pst.setString(1,rs.getString("user_id"));
          ResultSet rg = pst.executeQuery();
          rg.next();
          pst=con.prepareStatement("select S_Name from states where Number=?");
          pst.setString(1,String.valueOf(rg.getInt("MP_State")));
          ResultSet rs1=pst.executeQuery();
          rs1.next();
         %>
         <tr>    
             <td><h2><b><%=rg.getString("MP_Name")%>   from   <%= rs1.getString("S_Name")%></b></h2></td>
         </tr>
         <tr>
             <td>
                 <b>Congratulation , <%=rg.getString("MP_Name") %></b> from <%= rs1.getString("S_Name")%>
                 has been found by <%= hell.getString("F_FoundBy") %> at <%= hell.getString("F_Address")%>  was missing due to  <%= hell.getString("F_Reason")%>.
             </td>
         </tr>
         
        <% }
          else{
          %>    
          <tr>
              <%
            pst = con.prepareStatement("select ID,Comment from comment where User_ID=?");
            pst.setString(1,rs.getString("user_id"));
            ResultSet eat = pst.executeQuery();
            if(eat.next())
            {
            pst=con.prepareStatement("select MP_Name,MP_State from  missingpeople_details where U_ID=?");  
            pst.setString(1,rs.getString("user_id"));
            ResultSet rg = pst.executeQuery();
            rg.next();
           pst=con.prepareStatement("select S_Name from states where Number=?");
          pst.setString(1,String.valueOf(rg.getInt("MP_State")));
          ResultSet rs1=pst.executeQuery();
          rs1.next();%>
          <tr><td><h2><b><%=rg.getString("MP_Name")%>   from   <%= rs1.getString("S_Name")%></b></h2></td></tr>
            <%
            eat.beforeFirst();
           while(eat.next())
             { 
                 
             
            pst= con.prepareStatement("select Email from login_table where ID=?");     
            pst.setString(1,eat.getString("ID"));
            ResultSet monica = pst.executeQuery();
            monica.next();
            %>
           <table>
              <tr>
                  <td><%=eat.getString("ID")%><b>(<%=monica.getString("Email") %>)</b>      : <%= eat.getString("Comment")%></td>
                       
             </tr>
           </table>
         <% } }%>
         </tr>
          <%}%>
          <%}
           }catch(Exception ex){
               System.out.println(ex);
           }
                 
        %>
        </table>
       <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
         </div>	  
    </body>
     
</html>
