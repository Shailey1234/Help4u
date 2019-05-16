<%@page import="java.util.Date"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>

<title>NGO</title>
<style>

* {
		box-sizing: border-box;
		}
		body {
			margin:0;
			font-family: Arial;
			overflow: scroll;
                }
nav{
	height:42px;
	background-color:#38acec;
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
table table {
    border-collapse: collapse;
    border:2px solid black;
    width: 100%;
}
a.notif {
  position: relative;
  display: block;
  height: 55px;
  width: 55px;
  background: url('5.png');
  background-size: contain; 
background:no repeat;
  text-decoration: none;
border-radius: 50%;
float:right;
}
.num {
  position: absolute;
  right: 11px;
  top: 6px;
  color: red;
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

<body background="back.jpg" style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
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

  
<table width="100%">


<!-- ============ HEADER SECTION ============== -->
<tr>
<td valign="middle" height="30" bgcolor="white" style="color:black;font-size: 40px;font-family:serif;">
    <b><center>${Name}</center></b>
    
</td>
<td>
    <a href="Notification.jsp" class="notif"><span class="num"></span></a>
</td>
</tr>

<!-- ============ NAVIGATION BAR SECTION ============== -->
<tr><td colspan="3" valign="middle" height="30" bgcolor="white">
<nav>
<ul>
<li><a href="NGO_login.jsp" class="active"> Home</a></li>
<li><a href="ChangePassword.jsp">Change Password</a></li>
<li><a href="Logout">Logout</a></li>
</ul>
</nav></td>
</tr>
</table>
<!-- ============ LEFT COLUMN (MENU) ============== -->


<!-- ============ MIDDLE COLUMN (CONTENT) ============== -->
<tr>

    <%
      
    
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
        PreparedStatement pst = con.prepareStatement("SELECT U_ID,MP_Name,MP_DOB,MP_State,MP_DOM,MP_ReportDate from missingpeople_details where MP_Accept=0");
        ResultSet rs = pst.executeQuery();
       
    %>
        <table>
            <%
                while(rs.next())
                 {
                  pst=con.prepareStatement("select F_Address from found_missingpeople where U_ID=?");
                  pst.setString(1,rs.getString("U_ID"));
                  ResultSet r = pst.executeQuery();
                  if(r.next())
                   continue;
            %>
            <tr>
            <form method="post">
                <table style="width: 1350px;">
            <tr>
                <td>
                    <b>Name    :</b>
                </td>
                <td>
                    <input type="hidden" name="Uid" value="<%= rs.getString("U_ID") %>"/>
                    <%= rs.getString("MP_Name") %>
                </td>
                <td rowspan=6>
                  <image src="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>" alt="hii" style="height: 220px; width: 250px;"/>
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
                   <%= rs.getString("MP_ReportDate") %> 
                </td>
            </tr>
            <tr>
                <td>
                    <input type ="submit" formaction="ViewMissingVolun.jsp" value="View Details" style="background-color:red;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 80%;
		opacity: 0.9;"/>  
                </td>
                <td>
                   <input type ="submit" formaction="AcceptMissing.jsp" value="Accept" style="background-color:#38acec;
		color: white;
		padding: 10px 10px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 60%;
		opacity: 0.9;"/>    
                </td>
            </tr>
           </table>
           </form>
        </tr>
            <% } %>
            
          </table>
   

</tr>

<!-- ============ FOOTER SECTION ============== -->
<tr>
<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>
</tr>
</table>
</body>

</html>
