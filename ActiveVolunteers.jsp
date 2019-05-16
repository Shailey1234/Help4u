<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="outgoingjobs.css" />
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

         </style>
    </head>
    <% if((String)session.getAttribute("Name")==null)
        {
          response.sendRedirect("Login.jsp");
        }
        %>
    <body background="back.jpg">
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
        </table>
    <center><h2>Active Volunteers</h2></center>
    <br>
        <table style="width: 1350px">
           
            <tr>
            <td><b> Volunteers</b></td>
            <td><b> No Of Tasks</b></td>
            <td>  </td>
            </tr>
        <%
           Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
             
            PreparedStatement pst=con.prepareStatement("SELECT volunteer_login.U_ID,No_Tasks from no_of_tasks,volunteer_login where volunteer_login.U_ID=no_of_tasks.U_ID and Validated_By_Admin=1 order by No_Tasks desc;");
            ResultSet rs=pst.executeQuery();
            while(rs.next())
            {
        %>
        <form>
        <tr>
            <td>
             <input type="hidden" name="U_ID" value="<%= rs.getString("U_ID") %>"/>
             
            <%= rs.getString("U_ID")%> </td><td>      :<%= rs.getInt("No_Tasks") %>
            </td>
            </td>
            <td>
                <button formaction="veiw_volunteerAd.jsp" style="background-color: red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 60%;
		opacity: 0.9;
                pointer:float-right;">View Details</button>
            </td>
            
        </tr>
        </form>
        <% } %>
        
        </table>
        <div class = "footer" >
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
    </body>
</html>
