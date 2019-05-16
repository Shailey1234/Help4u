
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
    <body background='back.jpg'>
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
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 100px; height:60px; float: left;">FAQ</button></a>
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
    <center><h2>Outgoing Tasks</h2></center>
    <br>
        <table style="padding: 30px;">

            <tr>
            <td>
                <ol><li type="star"><b>Task</b></li></ol>
            </td>
            <td>
                <ol><li type="star"><b>Task Performed By</b></li></ol>
            </td>
            </tr>   
       <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
              Date obj =new Date();
              java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
              String currentdate = sdf.format(obj);
              PreparedStatement pst=con.prepareStatement("select T_Name,T_Descri,ID,typeOfUser from task where T_Timelimit>? and T_Accept=1");
              pst.setDate(1,java.sql.Date.valueOf(currentdate));
              ResultSet rs=pst.executeQuery();
              while(rs.next())
              {
                  %>
                  <tr>
                      <td>
                          <ol>
                      <% PreparedStatement p=con.prepareStatement("select U_ID from applytask where T_Name=?");
                         p.setString(1,rs.getString("T_Name"));
                         ResultSet r =p.executeQuery();
                         if(!r.next())
                           continue;
                         if(rs.getInt("typeOfUser")==3)
                         {
                             p=con.prepareStatement("select N_Name from ngo_details where N_ID=? and N_Val_NonVal=2");
                             p.setString(1,rs.getString("ID"));
                             ResultSet s=p.executeQuery();
                             if(!s.next())
                                continue;
                                   %>
                             <b><li type="square"><%= rs.getString("ID") %></li></b>
                             <b><li type="square"><center><%= s.getString("N_Name") %></center></li></b>
                         <%
                         }
                         else
                         {
                           p=con.prepareStatement("select Name from user_details where U_ID=? and exists( select * from volunteer_login where Validated_By_Admin=2 and U_ID=?)");
                             p.setString(1,rs.getString("ID"));
                             p.setString(2,rs.getString("ID"));
                             ResultSet s=p.executeQuery();
                             if(!s.next())
                               continue;
                            %>
                             <b><li type="square"><%= rs.getString("ID") %></li></b>
                             <b><li type="square"><%= s.getString("Name") %></li></b> 
                         <%
                         } %>
                     </ol> 
                    </td>
                    <td> <ol>
                        <% 
                           do{
                             p=con.prepareStatement("select Name from user_details where U_ID=?");
                             p.setString(1,r.getString("U_ID"));
                             ResultSet s=p.executeQuery();
                             s.next();%>
                             <li><%= s.getString("Name")%></li>  
                           <%}while(r.next());
                         %>
                        </ol>
                    </td>
                   </tr>
             <% }
              %>
             

           </table>
              
    </body>
    <div class = "footer" style="position:absolute;">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
</html>
