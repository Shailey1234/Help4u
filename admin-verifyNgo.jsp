<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="outgoingjobs.css" />
        <link rel="stylesheet" type="text/css" href="headfooter.css" />
        <style> 
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
        table {
    border-collapse: collapse;
    border: 3px solid black;
     width:100%;
    }

	input[id='discard']:hover{
		opacity:1;
	}
	input[id='submit']:hover{
		opacity:1;
	}
        #submit{
            background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
                float:right;
		width:50%;
        }
        #discard{
            background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
                width: 50%;
		padding: 14px 20px;
		background-color: #f44336;
        }
</style>

    </head>
    <body background="back.jpg">
        <% if((String)session.getAttribute("Name")==null)
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
        <center><h1>${Name}</h1></center>
        <ul class="main-navigation">
   <li><a href="Admin.jsp">Home</a></li>
  <li><a href="#">Details</a>

    <ul>

      <li><a href="#">Volunteers</a>
	
	<ul>

         <li><a href="OutgoingJoBs.jsp">Ongoing Tasks</a></li>

          <li><a href="FinishTask.jsp">Past Tasks</a></li>

          <li><a href="ActiveVolunteers.jsp">Active Volunteers</a></li>

        </ul>

       </li>

      <li><a href="#">Complainee</a>

        <ul>

          <li><a href="Unsolved.jsp">Unsolved Cases</a></li>

          <li><a href="Solved.jsp">Solved Cases</a></li>

          <li><a href="Not_accepted.jsp">Not Accepted Cases</a></li>


        </ul>

      </li>

    </ul>

  </li>

  <li><a href="#">Verify</a>

    <ul>

      <li><a href="admin-verifyNgo.jsp">NGO</a></li>

      <li><a href="admin-verifyvolunteer.jsp">Volunteers</a></li>

      

    </ul>

  </li>

  <li><a href="AdminChangePass.jsp">Change Password</a></li>
  <li><a href="Logout">Logout</a></li>
</ul>
    <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
             PreparedStatement pst=con.prepareStatement("select * from ngo_details u where N_Val_NonVal=2");
             ResultSet rs=pst.executeQuery();
             while(rs.next())
             {
                PreparedStatement p=con.prepareStatement("select R_Name from reference where Number=?");
                 p.setInt(1,rs.getInt("N_Ref"));
                 ResultSet result=p.executeQuery();
                 result.next();
                 p=con.prepareStatement("select S_Name from states where Number=?");
                 p.setInt(1,rs.getInt("N_State"));
                 ResultSet resu=p.executeQuery();
                 resu.next();
                 %>
          <tr>
          <table>
              <form method="post">
               <tr>
                   <br>
                   <br>
                   <h2><b><center><%= rs.getString("N_ID") %></center></b></h2>
               </tr>
               <tr>
                   <td>
                       <p style="font-weight: bold">
               <ol>
                   <li>Name    :<%= rs.getString("N_Name")%> </li>
                   <li> Address:<%= rs.getString("N_Address")%></li>
                   <li> State  :<%= resu.getString("S_Name")%></li>
                   <li> Pincode:<%= rs.getString("N_Pincode")%></li>
                   <li> <%=result.getString("R_Name")%>:<%= rs.getString("N_ValidNo")%></li>
               </ol>
                   
               </p>
               </td>
               <td>
                   <input type="hidden" name="N_ID" value="<%= rs.getString("N_ID") %>"/>
                   <button type="submit" formaction="Verify-NgoButton.jsp"style="background-color:red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 60%;
		opacity: 0.9;">Verify</button>
               </td>
               </tr>
               
          </form>
          </table>
        </tr>
       <% } %>
       </table>
       <div class = "footer" >
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
    </body>
</html>
