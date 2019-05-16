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
	
	.cancelbtn{
		width: 50%;
		padding: 14px 20px;
		background-color: #f44336;
	}
	.signupbtn{
		float:right;
		width:30%;
	}
	.cancelbtn{
		float:left;
		width:30%;
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
             PreparedStatement pst=con.prepareStatement("select * from user_details u where EXISTS(select U_ID from volunteer_login v where validated_by_admin=2 and v.U_ID=u.U_ID)");
             ResultSet rs=pst.executeQuery();
             while(rs.next())
             {
              PreparedStatement ls = con.prepareStatement("select Name from gender where Number=?");
              ls.setInt(1,rs.getInt("Gender"));
              ResultSet s=ls.executeQuery();
              s.next();
                 %>
          <tr>
          <table>
              <form method="post">
                  <tr>
                   <br>
                   <br>
                   <h2><b><center><%= rs.getString("U_ID") %></center></b></h2>
               </tr>
               <tr>
                   <td>
               <p>
               <ol>
                   <li><b>Name    :<%= rs.getString("Name")%> </b></li>
                   <li><b>Permanent Address:<%= rs.getString("Address")%></b></li>
                   <li><b>Permanent Gender:<%= s.getString("Name")%></b></li>
                   
               </ol>
                   
               </p>
               </td>
               <td>
                   <input type="hidden" name="U_ID" value="<%= rs.getString("U_ID") %>"/>
                   <button type="submit" formaction="veiw_volunteerAd.jsp" style="background-color: red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 40%;
		opacity: 0.9;">View Details</button>
                   <button  type="submit" formaction="Verify_VoluntButton.jsp" style="background-color:#38acec;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 40%;
		opacity: 0.9;">Verify</button>
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
