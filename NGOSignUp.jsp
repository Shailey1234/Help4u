<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
	<title>Sign Up</title>
	<meta name=" viewport" content ="width=device-width", "initial-scale=1">
<style>

      body{
		font-family: Arial, Helvetica, sans-serif;
		box-sizing: border-box;
	}
	input[type=text],input[type=password],input[type=email]{
		width: 50%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border-style: solid, solid;
		border-color: #f5f5f5;
		background: #f8f8f8;
	}
		input[type=text]:focus,input[type=password],input[type=email]:focus{
		background-color: #ddd;
		outline:none;
	}
	hr{
		border-top: 2px solid #f1f1f1;
		margin-bottom: 25px;
	}
	button{
		background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
	}
	button:hover{
		opacity:1;
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
	.container{
		padding: 14px;
	}
	.clearfix::after{
		content:"";
		clear: both;
		display:table;
	}
</style>
</head>
<body>
    
    <%
        Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
  %> 
<form action="N_Registeration" method="Post" style="border:1px solid #ccc" autocomplete="on">
	<div class=" container">
	<h1>Request Application For NGO</h1>
	<p>Please fill up this form to create an account.</p>
	<hr>
        <fieldset>
	<legend><h1>Details Of Organisation</h1></legend>
        <label for ="O_Id"><b>Organisation ID</b></label>
	<input type="text" placeholder="Enter NGO Id" name="O_Id" required>
    <br>
	<br>
	<label for ="name"><b>Name Of Organisation</b></label>
	<input type="text" placeholder="Enter Name Of Organisation" name="name" required>
    <br>
	<br>
	<label for ="email"><b>Email</b></label>
	<input type="email" placeholder="Enter Email" name="email" required>
    
    <br>
	<br>
	<label for ="password"><b>Password</b></label>
	<input type="password" placeholder="Enter Password" name="password" required>
    <br>
	<br>
	<label for ="repassword"><b>Re-enter Password</b></label>
	<input type="password" placeholder="Re-enter Password" name="repassword" required>
     <br>
	<br>
	<label for ="security_ques"><b>Security Question</b></label>
	<select name="security_ques">
	<option value= "1">What was your childhood nickname?</option>
	<option value= "2">What is your pet's name?</option>
	<option value= "3">What school did you attend for tenth grade?</option>
	<option value= "4">In which state you were born?</option>
	<option value= "5">What is your mother tongue?</option>
	<option value= "6">Who is your best friend?</option>
	<option value= "7">Who was your childhood hero?</option>
	</select>
     <br>
	<br>
	<label for ="security_ans"><b>Security Answer</b></label>
	<input type="text" placeholder="Enter Security Answer" name="security_ans" required>
	<br>
	<br>
	<label for ="address"><b>Address</b></label>
	<input type="text" placeholder="Enter Address" name="address" required>
        <br>
        <br>
                <label for ="State"><b>State</b></label>
		<select name="State">
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
	<label for ="pincode"><b>Pincode</b></label>
	<input type="text" placeholder="Enter Pincode" name="pincode" required>
        </fieldset>
    <br>
       <br>
       <fieldset>
	<legend><h1>Verified By Institution</h1></legend>
       <label for ="institution"><b>Selected Institution</b></label>
       <select name="institution">
       	<option value= "Charities Aid Foundation">Charities Aid Foundation</option>
       	<option value= "NGOs INDIA">NGOs INDIA</option>
       	<option value= "TechSoup Asia-Pacific">TechSoup Asia-Pacific</option>
       </select>
        <label for ="v_number"><b>Validation Number</b></label>
	<input type="text" placeholder="Enter Validation Number" name="v_number" required>
     <br>
        <br>
       </hr>
       </fieldset>
	<p>By creating an account  you agree to our <a href="# style="color:dodgerblue">Terms & Privacy<a>.</p>
	<div class="clearfix">
	<button type="reset" class="cancelbtn">Clear</button>
	<button type="submit" class="signupbtn">Sign Up</button>
</div>
</div>
</form>
</body>
</html>