<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Security Question</title>
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
                    position: absolute;
			left: 0;
			bottom: 0;
			width: 100%;
                        background-color: #b3e0ff;
			color: black;
			text-align: left;
			}

	input
	{
	width:100%;
	padding:10px;
	box-sizing:borderbox;
	background:none;
	outline:none;
	resize:none;
	border:0;
	font-family:'Montserrat',sans-serif;
	transition:all .3s;
	border-bottom:2px solid #bebed2
	}

       input:focus
	{
	border-bottom:2px solid #78788c
	}
select {
	     width: 100%;
    padding: 7px 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	background: #f1f1f1;
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
        <form method="post">
            <table style="padding:50px;">
            <tr>
                <td><b>Your UserId</b></td>
                <td><input type="text" name="Uid" placeholder="enter your Id" required/></td>
            </tr>
            <tr>
                <td>
                    <b>Security Question :</b>
                </td>
                <td>
                    <select name="question" required>
               <%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
        PreparedStatement pst = con.prepareStatement("SELECT * FROM questionnaire");
        ResultSet rs = pst.executeQuery();
           while(rs.next())
           {
               %>
             
               <option value="<%= rs.getInt("Number")%>"><%= rs.getString("Questions")%></option>     
          <% } %>     
           </select>
                </td>
            </tr>   
            <tr>
                <td><b>Security Answer  :</b></td>
            
            
                <td><input type="text" name="answer" placeholder="Enter Answer" required/></td>
            </tr>
            <tr>
            <br>
            <td></td>
                <td><input type="submit" value="Next" formaction="Question_Forget" style="background-color:red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;"/></td>
            </tr>
        </table>
       </form>
        <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
         </div>	
    </body>
</html>
