<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ADMIN</title>
    <link rel="stylesheet" type="text/css" href="outgoingjobs.css" >
   
<style type="text/css">
  
        img{
             display:block;
             margin-left: auto;
            margin-right: auto;
           }

	body{
		font-family: Arial, Helvetica, sans-serif;
		box-sizing: border-box;
	}
	input[type=text],input[type=password],input[type=number],input[type=date]:focus,input[type=textarea]:focus{
		width: 30%;
		padding: 10px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border-style: solid;
		border-color: #f5f5f5;
		background: #f8f8f8;
	}
		input[type=text]:focus, input[type=password]:focus {
		background-color: #ddd;
		outline:none;
	}
        select {
	     width: 15%;
    padding: 6px 10px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	background: #f1f1f1;
	}

	hr{
		border-top: 2px solid #f1f1f1;
		margin-bottom: 25px;
	}
	input[type='reset'],input[type='submit']{
		background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
	}
	input[type='reset']:hover{
		opacity:1;
	}
	input[type='submit']:hover{
		opacity:1;
	}
	
	input[type='submit']{
		float:center;
		width:30%;
	}
	
	
	input[type='reset']{
		width: 30%;
                float:left;
		padding: 14px 20px;
		background-color: #f44336;
	}
	.container{
		padding: 14px;
	}
	.clearfix::after{
		content:"";
		clear: both;
		display:table;
        }
        body {
				font-family: arial;
			}
		.hide {
				display: none;
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
<script>
		function show1(){
			document.getElementById('div1').style.display ='block';
		}
			function show2(){
			document.getElementById('div2').style.display = 'block';
		}
		   
	</script>
    </head>
    <body background="back.jpg">
        <% if((String)session.getAttribute("Name")==null)
        {
          response.sendRedirect("Login.jsp");
        }
        %>
        <div class="header">
		<img src="logo.png" alt="logo" class="logo" style=" height:50px; width:200px; float: left;">
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
                        <br>
                        <br>
                        <br><button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp" style="float:left;"><button class="buttonr roundbutton" style= " width: 100px; height:60px;">FAQ</button></a>
		</div>
</div>
        <% 
            
           Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            
        %>
         <center><h1>${Name}</h1></center>
         <ul class="main-navigation">
            
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



         <br>
         <br>
         <br>
        <form action="JobInsert" method="post">
            <fieldset>
	    <legend> <h1> Assign JOB </h1></legend>
            <label>Job ID :</label>
            <input type="text" name="Jname" placeholder="Enter Task Name" maxlength="10" required />
            <br>
            <br>
            <label>Choice To Which you want to assign JOB</label>
            <br>
		<input type="radio" name="tab" value="user" onclick="show1()" />
		 Volunteers
		<input type="radio" name="tab" value="ngo" onclick="show2()" />
		Non-Government-Organisation
            <div id="div1" class="hide">
                <select name="user">
                    <option>select</option>
                <%
                   PreparedStatement ps=con.prepareStatement("select U_ID,Name from user_details where EXISTS(select U_ID from volunteer_login where user_details.U_ID=volunteer_login.U_ID and volunteer_login.Validated_By_Admin=2 ) and NOT EXISTS (select ID from task where task.ID=user_details.U_ID);");
                   ResultSet rs=ps.executeQuery();
                   while(rs.next())
                   { %>
		
                    <option value="<%= rs.getString("U_ID")%>"><%= rs.getString("Name")%></option>
                      
                  <% }%>
               </select>
		</div>
	      <div id="div2" class="hide">
		<select name="ngo">
                    <option value="">select</option>
	       <%
                   PreparedStatement p=con.prepareStatement("select N_ID,N_Name from ngo_details where N_Val_NonVal=2 and NOT EXISTS(select ID from task where ngo_details.N_ID=task.Id);");
                   ResultSet w=p.executeQuery();
                   while(w.next())
                   {  
                %>
                
		
                    <option value="<%= w.getString("N_ID")%>"><%= w.getString("N_Name")%></option>
                    
                  <%
                   }%>
		</select>

		</div>
            <br>
            <br>
            <br>
            <br>
            <label>Description :</label><br>
            <textarea name="description" placeholder="What to do exactly" maxlength="50" style="width:300px;height:100px;" required></textarea>
                <br><br>
                <label> Last Date To Apply  :</label>
               <input type="date" name="Adate"/>
               <br><br>
               <label> Last Date To Finish Task  :</label>
               <input type="date" name="Ldate"/>
               <br><br><br>
              
               <center><input type="reset" value="Reset" /></center>
               <center><input type="submit" value="Submit"/></center>
            </fieldset>
        </form>
                <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>

</body>
</html>