<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Comment</title>
        
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
			background-color:#f8f8f8;
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
        <%
            
             if(session.getAttribute("Name")==null)
             {
               response.sendRedirect("Login.jsp");
             }
           try{
               
           
         String userid = request.getParameter("userid");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
        PreparedStatement pst = con.prepareStatement("SELECT MP_Name,MP_DOB,MP_State,MP_DOM,MP_ReportDate from missingpeople_details where U_ID=?");
        pst.setString(1,userid);
        ResultSet rs = pst.executeQuery();
        rs.next();
        pst = con.prepareStatement("select ID,Comment from comment where User_ID=?");
        pst.setString(1,userid);
        ResultSet rst = pst.executeQuery();
        
            %>
            
            <table width="100%">
                <tr>
                    <td>
                <center>
                    <b><h2><%= rs.getString("MP_Name")%></h2></b>
                        <h4>Date Of Birth     :<%=rs.getDate("MP_DOB") %></h4>
                         <% 
                          pst=con.prepareStatement("select S_Name from states where Number=?");
                          pst.setString(1,String.valueOf(rs.getInt("MP_State")));
                          ResultSet rs1=pst.executeQuery();
                          rs1.next();
                         %> 
                         <h4>States          :<%= rs1.getString("S_Name") %></h4>
                        <h4>Date Of Missing  :<%= rs.getDate("MP_DOM")%></h4>
                        <h4>Posted On        :<%= rs.getDate("MP_ReportDate")%></h4>
                </center>
                    </td>
                    <td>
                    <center>
                        <image src="${pageContext.request.contextPath}/DisplayImages?id=<%= userid %>" alt="hii" style="height: 220px; width: 250px; "/> 
                    </center>
                    </td>
                </tr>
                <tr><td><h2><b><font color="38acec">COMMENTS</font></b></h2></td>
                <%
                    while(rst.next())
                    {
                %>
                <table>
                <tr>
                    <td><%=rst.getString("ID")%>      : <%= rst.getString("Comment")%></td>
                       
                </tr>
                </table>
                  <% } %>
                </tr>
            </table>
            <%
                }catch(Exception ex)
                  {
                    System.out.println(ex);
                  }
                %>
        <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>	
    </body>
</html>
