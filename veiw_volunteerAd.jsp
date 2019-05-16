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
            String U_ID=request.getParameter("U_ID");
            Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
             PreparedStatement pst=con.prepareStatement("SELECT * FROM volunteer_login where U_ID=?");
             pst.setString(1,U_ID);
             PreparedStatement ps=con.prepareStatement("SELECT * FROM user_details where U_ID=?");
             ps.setString(1,U_ID);
             ResultSet r=ps.executeQuery();
             ResultSet rs=pst.executeQuery();
              r.next();rs.next();
             PreparedStatement ls = con.prepareStatement("select Name from gender where Number=?");
              ls.setInt(1,r.getInt("Gender"));
              ResultSet s=ls.executeQuery();
              s.next();
              ls=con.prepareStatement("select ID_Name from verify_id where Number=?");
              ls.setInt(1,rs.getInt("verify"));
              ResultSet o=ls.executeQuery();
              o.next();
              ls=con.prepareStatement("select S_Name from states where Number=?");
              ls.setInt(1,rs.getInt("State"));
              ResultSet oe=ls.executeQuery();
              oe.next();
               ls=con.prepareStatement("select VD_Name from volunteer_days where Number=?");
              ls.setInt(1,rs.getInt("Available_Days"));
              ResultSet hii=ls.executeQuery();
              hii.next();
              
            %>
            <p>
            <pre>
                <font size="5"><b>Volunteer User_ID            :<%= U_ID %></b></font>
                <font size="5"><b>Volunteer Name               :<%=r.getString("Name") %></b></font>
                <font size="5"><b>Gender                       :<%=s.getString("Name")%></b></font>
                <font size="5"><b>Phone Number                 :<%=rs.getString("Phone_No")%></b></font>
                <font size="5"><b><%= o.getString("ID_Name")%>                :<%=rs.getString("Verify_ID_No") %></b></font>
                <font size="5"><b>Experience                   :<%=rs.getString("Experience") %></b></font>
                <font size="5"><b>Volunteer Address            :<%=rs.getString("Cor_Address") %></b></font>
                <font size="5"><b>State                        :<%=oe.getString("S_Name") %></b></font>
                <font size="5"><b>Pincode                      :<%=r.getString("Pincode") %></b></font>
                <font size="5"><b>Working Days                 :<%=hii.getString("VD_Name") %></b></font>
                <font size="5"><b>Start Time                   :<%=rs.getInt("Start_Time") %></b></font>
                <font size="5"><b>End Time                     :<%=rs.getInt("End_Time")  %></b></font>
                
            </pre>
            </p>
         <div class = "footer" style="position:absolute;">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
    </body>
</html>
