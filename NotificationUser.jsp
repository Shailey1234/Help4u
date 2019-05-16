<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Notification</title>
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
		float: right;
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
			position: float-left;
		}
	.header-left {
			position: float-right;
		}

	.header a:hover {
		background-color:#ddd;
		 color: #0084ff;
		}
	.header-right{
		position: float-right;
		}
	.button {
			background-color:#38acec;
			border:none;
			color: white;
			padding: 20px;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size: 16px;
			cursor:pointer;
			position: float-right;
		}
	.roundbutton {
			border-radius: 50%;
                        float: left;
		}
	.roundbutton:hover {
		background-color:#b3e0ff;
		 color: #0084ff;
		}
		.footer {

			left: 0;
			bottom: 0;
			width: 100%;
			background-color: #38acec;
			color: white;
			text-align: left;
                        float:none;
		       display:block;
		       text-align:left;
                       position: fixed;
			}

	@media screen and (max-width:600px){
	.header a {
		float:none;
		display:block;
		text-align:left;
		}
	.header-right {
		float:none;
		}
	
	}
  </style>
    </head>
    <body>
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
           
        <%
          Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
         PreparedStatement pst = con.prepareStatement("SELECT ngo_id FROM accept_missing where user_id=?");
                       pst.setString(1,(String)session.getAttribute("Uid"));
                       ResultSet rs = pst.executeQuery();
                       if(rs.next())
                       {
                           pst = con.prepareStatement("select N_Name,N_Address,N_Pincode from ngo_details where N_ID=?");
                           pst.setString(1,rs.getString("ngo_id"));
                           ResultSet r = pst.executeQuery();
                           r.next();
                           pst = con.prepareStatement("select Email from login_table where ID=?");
                           pst.setString(1,rs.getString("ngo_id"));
                           ResultSet rt = pst.executeQuery();
                           rt.next();
                       
        %>
            <tr>
                 <h2>Your Complaint</h2>
             Your Complaint has being accepted by  <b><%=r.getString("N_Name") %></b> situated at <b>  <%=r.getString("N_Address") %>  </b>   <b><%=r.getString("N_Pincode") %></b> , whose email id is  <b><%=rt.getString("Email") %></b>. 
            </tr>
            <% } %>
           
           <%
                   pst = con.prepareStatement("SELECT State FROM volunteer_login where U_ID=? and Validated_By_Admin=1");
                   pst.setString(1,(String)session.getAttribute("Uid"));
                   ResultSet rt = pst.executeQuery();
                   if(rt.next())
                   {
           %>
           <tr>
                 <h2>Your Volunteer Request</h2>
                Your Volunteer Request is accepted by admin.
           </tr>
            <% } %>
            
            <tr>
              <%
            pst = con.prepareStatement("select ID,Comment from comment where User_ID=?");
            pst.setString(1,(String)session.getAttribute("Uid"));
            ResultSet eat = pst.executeQuery();
            if(eat.next())
            { pst=con.prepareStatement("select MP_Name,MP_State from  missingpeople_details where U_ID=?");  
              pst.setString(1,(String)session.getAttribute("Uid"));
              ResultSet rg = pst.executeQuery();
              rg.next();
               pst=con.prepareStatement("select S_Name from states where Number=?");
               pst.setString(1,String.valueOf(rg.getInt("MP_State")));
             ResultSet rs1=pst.executeQuery();
             rs1.next();%>
             <h2><b>Comments On <%=rg.getString("MP_Name")%>   from   <%= rs1.getString("S_Name")%></b></h2>
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
        </table>
         <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
         </div>
    </body>
</html>
