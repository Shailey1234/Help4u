<%@page import="java.util.Date"%>
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
            table {
               border-collapse: collapse;
               border: 3px solid black;
               width: 100%;
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
            </style>
    </head>
    <body background="back.jpg" >
        <%
            
                if((String)session.getAttribute("Name")==null)
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
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            PreparedStatement pst=con.prepareStatement("select * from found_missingpeople");
            ResultSet r = pst.executeQuery();
            while(r.next())
            {
               pst = con.prepareStatement("select MP_Name,MP_DOB,MP_State,MP_DOM,MP_ReportDate from missingpeople_details where U_ID=?");
               pst.setString(1,r.getString("U_ID"));
               ResultSet rs = pst.executeQuery();
               rs.next();
            %>  
      <tr>
            <table>
                <form method="post">
            <tr>
                <td>
                    <b>Name    :</b>
                </td>
                <td>
                    <input type="hidden" name="Uid" value="<%= r.getString("U_ID") %>"/>
                    <%= rs.getString("MP_Name") %>
                </td>
                <td rowspan=8>
                    <image src="${pageContext.request.contextPath}/DisplayImages?id=<%=r.getString("U_ID") %>" alt="hii" style="height:220px; width: 220px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Age  :</b>
                </td>
                <td>
                    <%
                    String date = rs.getString("MP_DOB");
                    Date date1 = new Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    String currentDate = sdf.format(date1);
                    System.out.println(date);
                    System.out.println(currentDate);
                    String d[] = date.split("-");
                    String d1[] = currentDate.split("-");
                    int age = (Integer.parseInt(d1[0])-Integer.parseInt(d[0]))-1;
                    %>
                   <%= age %> 
                </td>
            </tr>
            <tr>
                <td>
                    Place  :
                </td>
                <td>
                    <% 
                     pst=con.prepareStatement("select S_Name from states where Number=?");
                     pst.setString(1,String.valueOf(rs.getInt("MP_State")));
                     ResultSet rs1=pst.executeQuery();
                     rs1.next();
                    %> 
                    <%= rs1.getString("S_Name") %>
                </td>
            </tr>
            <tr>
                <td>
                    Date Of Missing :
                </td>
                <td>
                   <%= rs.getString("MP_DOM") %> 
                </td>
            </tr>
            <tr>
                <td>
                    Posted On :
                </td>
                <td>
                   <%= rs.getDate("MP_ReportDate") %> 
                </td>
            </tr>
            <tr>
                <td><b>Founded By</b></td>
                <td><%= r.getString("F_FoundBy") %></td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td>
                    <input type ="submit" formaction="ViewMissing.jsp" value="View Details" style="background-color:red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 40%;
		opacity: 0.9;"/>  
                </td>
                
            </tr>
           </form>
           </table>
           
        </tr>
          <% } %>

      </table>
      <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
    </body>
</html>
