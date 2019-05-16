<%-- 
    Document   : RegisterationForm
    Created on : Mar 18, 2018, 9:02:16 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
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
		width: 100%;
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
    <form target = "popup" action="U_Registeration" method="post" style="border:1px solid #ccc" autocomplete="on">
	<div class="container">
	<h1>Sign Up</h1>
	<p>Please fill up this form to create an account.</p>
	<hr>
        <label for ="Uid"><b>Userid</b></label>
	<input type="text" placeholder="Enter Userid" name="Uid" maxlength=20 required>

	<label for ="name"><b>Name</b></label>
	<input type="text" placeholder="Enter Name" name="name" maxlength=20 required>

	<label for ="address"><b>Address</b></label>
	<input type="text" placeholder="Enter Address" maxlength=90 name="address" required>
	<br>
	<br>
	<label for ="dob"><b>Date of Birth</b></label>
	<input type="date" name="dob" required>
	<br>
	<br>
	<label for = "gender" required><b>Gender</b></label>
	<select name="gender">
	<option value= "Male">Male</option>
	<option value= "Female">Female</option>
	<option value= "Transgender">Transgender</option>
	</select>
        <br>
        <br>
	<label for ="email"><b>Email</b></label>
	<input type="email" placeholder="Enter Email" name="email" maxlength = 60 required>

	<label for ="password"><b>Password</b></label>
	<input type="password" placeholder="Enter Password" name="password" maxlenth =20 required>

	<label for ="repassword"><b>Re-enter Password</b></label>
	<input type="password" placeholder="Re-enter Password" name="repassword" maxlength =20 required>

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
		<input type="text" placeholder="Enter Security Answer" name="security_ans" maxlenth=45 required>

	<label for ="pincode"><b>Pincode</b></label>
	<input type="text" placeholder="Enter Pincode" name="pincode" maxlength =10 required>
        
	<p>By creating an account  you agree to our <a href="# style="color:dodgerblue">Terms & Privacy<a>.</p>
	<div class="clearfix">
	<button type="reset" class="cancelbtn">Clear</button>
	<button type="submit" class="signupbtn">Sign Up</button>
</div>
</div>
</form>
</body>
</html>
