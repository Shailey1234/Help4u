<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
${sessionScope.MyAttribute}
<title>Volunteer Registration</title>
<meta name="viewport" content="width=device-width , initial-scale=1">
<style>
img{
display:block;
margin-left: auto;
margin-right: auto;
}
	body{
		font-family: Arial, Helvetica, sans-serif;
		box-sizing: border-box;
	}
	input[type=text],input[type=password],input[type=number]{
		width: 50%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border-style: solid, solid;
		border-color: #f5f5f5;
		background: #f8f8f8;
		}
			.header {
			overflow:hidden;
			background-color:#b3e0ff;
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
			float:left;
		}
	select {
					width: 30%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border-style: solid, solid;
		border-color: #f5f5f5;
		background: #f8f8f8;
		}
			
	input[type=text]:focus, input[type=password]:focus{
		background-color: #ddd;
		outline:none;
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
		float:right;
		width:50%;
	}
	
	
	input[type='reset']{
		width: 50%;
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
			.footer {
			left: 0;
			bottom: 0;
			width: 100%;
			background-color:#b3e0ff;
			color: black;
			text-align: left;
			padding: 20px;
			}
</style>
</head>

<body>
<%
       if(session.getAttribute("Name")==null)
       {
           response.sendRedirect("Login.jsp");
       } 
       Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
  %>
  <div class= "header">
  <img src="logo.png" alt="logo" class="logo" height="50" width="200">
  <h1>Volunteer</h1>
  </div>
<form action="VolunteersForm" style="border:1px solid #ccc" method="post" autocomplete="on" name="V_name" onsubmit=" return validateV()">
<hr>
	<div class=" container">
	
	<p>Please fill up this form to volunteer.</p>
	<hr>
	<fieldset>
	<legend><h1>Personal Details</h1></legend>
		<label for ="name"><b> Full Name</b></label>
                <input type="text" placeholder="Enter Name" name="uname" maxlength="20" required>
		<br>
		<label for ="address"><b>Correspondence Address</b></label>
                <input type="text" placeholder="Enter Address" name="address" maxlength="90" required>
		<br>
		<label for ="pincode"><b>Pincode</b></label>
                <input type="number" placeholder="Enter Pincode" name="pincode" maxlength="6" required>
		<br>
                <label for ="State"><b>State</b></label>
                <select name="State" required>
                    <% 
                    PreparedStatement pst=con.prepareStatement("select * from states");
                    ResultSet rs=pst.executeQuery();
                    while(rs.next())
                    {
                    %>
                    <option value="<%=rs.getInt("Number")%>"><%=rs.getString("S_Name")%></option>
                   <% }%>
				   </select>
				   <br>
				   <br>
		<label for ="phno"><b>Phone Number</b></label>
                <input type="number" placeholder="Enter Phone Number" name="phno" maxlength="10" required>
		<br>
                <br>
				<label for ="adno"><b>Verification Number</b></label>
                
                
                <br>
                <select name="Verify">
                    <option value="1">Aadhaar Number</option>
                    <option value="2">VoterID Number</option>
                </select>
                <input type="text" placeholder="Enter Verification Number" name="VerifyNumber" maxlength="12" required>
		<br>
		
	
	</fieldset>
	<fieldset>
	<legend><h1>Qualification</h1></legend>
	<label for="boards"><b>Senior Secondary Board</b></label>
		<select name="boards">
         <%
                    PreparedStatement ps=con.prepareStatement("select * from boards_12");
                    ResultSet rs1=ps.executeQuery();
                    while(rs1.next())
                    {
                    %>
                    <option value="<%=rs1.getInt("Number")%>"><%=rs1.getString("B_Name")%></option>
                   <% }%>
          </select>
           <label for="Passyear12"><b>Year Of Passing</b></label>
        <input type="month" name="Passyear12">
<br>
<br>
<br>
	<label for="undergraduate"><b>Under Graduate Course</b></label>
	<select name="undergraduate" >
	         <%
                    PreparedStatement p=con.prepareStatement("select * from ug_course");
                    ResultSet r=p.executeQuery();
                    while(r.next())
                    {
                    %>
                    <option value="<%=r.getInt("Number")%>"><%=r.getString("UGC_Name")%></option>
              <% }%>
	</select>	
	 <label for="PassyearUg"><b>Year Of Passing</b></label>
        <input type="month" name="PassyearUG">
	</fieldset>
	<fieldset>
	<legend><h1>Application Information</h1></legend>
	
	<label for="availability"><b>Your Availability</b></label><br>
	<select name="availability" >
	         <%
                    PreparedStatement s=con.prepareStatement("select * from volunteer_days");
                    ResultSet set=s.executeQuery();
                    while(set.next())
                    {
                    %>
                    <option value="<%=set.getInt("Number")%>"><%=set.getString("VD_Name")%></option>
                   <% }%>
	</select>
	<br>
	<br>
	<label for="time"><b>Your Time Donation</b></label><br>
	
	Start Time:<select name="Starttime" value="hours">
	<option value="9">9</option>
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	</select>
	<br>
	<br>
	End Time:
	<select name="Endtime" value="hours">
	<option value="10">10</option>
	<option value="11">11</option>
	<option value="12">12</option>
	<option value="13">13</option>
	<option value="14">14</option>
	<option value="15">15</option>
	<option value="16">16</option>
	<option value="17">17</option>
	<option value="18">18</option>
	</select>
	<br>
	<br>
	
	<label for="experience"><b>Experience</b></label>
	<br>
	<textarea name="experience" style="width:300px;height:100px;"></textarea>
	</fieldset>
	<div class="clearfix">
	<input type="submit" value="Submit">
	<input type="reset" value="Reset">
</div>
</div>
</form>

<script>
function validateV()
{
	var num=document.V_name.pincode.value;
	var uname =  document.V_name.name.value;
      var letters = /^[A-Za-z]+$/; 
     /* if(uname!=letters)
      {
      alert('Please input alphabet characters only');
      return false;
      }*/

	if (isNaN(num)){
	alert(" You have entered an invalid number in pincode");
	return false;
	}
else{
return true;
}
}

</script>
	<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>
</body>
</html>