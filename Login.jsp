<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
	<title>Home</title>
	<meta name= "viewport" content= "width=device-width, initial-scale=1">
<style>
		* {
		box-sizing: border-box;
		}
		body {
				font-family: Arial , Helvetica , sans-serif;
				overflow: scroll;
		}
		input[type=text], input[type=password] , input[type=email],input[type=number]{
    width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus ,input[type=email]:focus,input[type=number]:focus{
    background-color: #ddd;
    outline: none;
}
select {
	     width: 40%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	background: #f1f1f1;
	}
button {
    background-color: #38acec;
    color: white;
    padding: 14px 20px;
   
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
	float: left;

}
.signbtn {

    padding: 14px 20px;
    background-color: #38acec;
	float: right;

}
.container {
    padding: 10px;
	
}

span.psw {
    float: right;
    padding-top: 16px;
}
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto 15% auto;
    border: 1px solid #888;
    width: 80%;
}



.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    cursor: pointer;
}


.animate {
    -webkit-animation: animatezoom 0.6s;
    animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
    from {-webkit-transform: scale(0)}
    to {-webkit-transform: scale(1)}
}

@keyframes animatezoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
}
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    .cancelbtn {
       width: 100%;
    }
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
			background-color:#e6e6e6;
			color: black;
			text-align: left;
			}
			h2 {
				color: #808080;
		}
	img {
			border: 1px solid #ddd;
			border-radius: 2px;
			padding: 5px;

		}
	img:hover {
			box-shadow: 0 0 2px 1px rgba(0, 140 , 186, 0.5);
		}
		.column {
				float: left;
				width: 33.33%;
				padding: 15px;

		}
		.columnright {
		float:right;
		}
			.footer {
			left: 0;
			bottom: 0;
			width: 100%;
			background-color:#b3e0ff;
			color: black;
			text-align: left;
			padding: 20px 10px;
			}
		.row:after {
				content: "";
				display: table;
				clear: both;
		}
	.mySlides {
			display: none;
			overflow: hidden;
		}
	img {
		vertical-align: middle;
		}
	.slideshow-container {
		max-width: 800px;
		position: relative;
		margin: auto;

		}

	.active {
		background-color:#717171;
	}
	.fade{
		-webkit-animation-name: fade;
		-webkit-animation-duration: 1.5s;
		animation-name: fade;
		animation-duration: 1.5s;
	}

		@media screen and (max-width:600px){
	.header a {
		float:none;
		display:block;
		text-align:left;
		}
	.header-right {
		float:none;
		}
	.footer {
		float:none;
		display:block;
		text-align:left;
		}
		.column{
				width: 100%;
		}
		}
</style>
</head>
<body background="back.jpg">
     <%
        Class.forName("com.mysql.jdbc.Driver");
      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
  %>
	<div class="header">
		<img src="logo.png" alt="logo" class="logo" height="50" width="200">
                <br>
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
			<button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 90px; height:60px; float: left;">FAQ</button></a>
		</div>
	</div>
	<div class= "row">
		<div class= "column">
			<h2> Help Us Find..</h2>
		<br>
                  <%
                    PreparedStatement pst = con.prepareStatement("select U_ID from missingpeople_details where NOT EXISTS(select U_ID from found_missingpeople where found_missingpeople.U_ID=missingpeople_details.U_ID) order by MP_ReportDate desc;");
                        ResultSet rs = pst.executeQuery();
                        int i=1;


                        while(rs.next())
                        {
                          if(rs.getString("U_ID").equals("Monica@123"))
                             rs.next();

                          if(i==5)
                              break;
                          if(i==3)
                          {%>
                           <br>
                <%}
                          i++;

               %>
		<a target="_blank" href="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>">
		<img src="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>" alt=" Missing Person" height= "150" width="100" style="border:10px solid #f0f0f0">
		</a>
                <% } %>
		</div>
	<div class= "column">
			<div class = "slideshow-container">
			<div class="mySlides fade">
			<img src="Picture1.jpg" style="width:100%">
			</div>
			<div class="mySlides fade">
			<img src="picture2.jpg" style="width:100%">
			</div>
			<div class="mySlides fade">
			<img src="picture3.jpg" style="width:100%">
			</div>
			<div class="mySlides fade">
			<img src="picture4.jpg" style="width:100%">
			</div>
			<div class="mySlides fade">
			<img src="picture5.jpg" style="width:100%">
			</div>
         </div>
		 <br>
		 <br>
		 <br>
		 <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
<button onclick="document.getElementById('id03').style.display='block'" style="width:auto; margin-left: 40px">Sign Up As User</button>
<button onclick="document.getElementById('id02').style.display='block'" style="width:auto; float: right;">Sign Up As Ngo</button>

<div id="id03" class="modal">
  <span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content animate" action="U_Registeration" method="post" name="SignU" onsubmit=" return validateU()">
	<div class="container">
	<h1>Sign Up</h1>
	<p>Please fill up this form to create an account.</p>
	<hr>
        <label for ="Uid"><b>User ID:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Userid" name="Uid" maxlength=20 required >

        <br>
	<label for ="name"><b>Name:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Name" name="name" maxlength=20  id="username" pattern="[a-zA-Z\s]{1,15}" title= "Username should only contain letters" required>
        <br>
        <br>
	<label for ="address"><b>Address:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Address" maxlength=90 name="address" required>
	<br>
	<br>
	<label for ="pincode"><b>Pincode:</b></label>
     &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   <input type="number" placeholder="Enter Pincode" name="pincode" maxlength = 6 required id= "pin" >
	<br>
	<br>
	<label for ="dob" ><b>Date of Birth:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="date" name="dob" required>
	<br>
	<br>
	<label for ="gender" ><b>Gender:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<select name="gender" required>
	<option value= "Male">Male</option>
	<option value= "Female">Female</option>
	<option value= "Others">Others</option>
	</select>
        <br>
        <br>
	<label for ="email"><b>Email:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="email" placeholder="Enter Email" name="email" maxlength = 60  required>

<br>
<br>
	<label for ="password"><b>Password:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" placeholder="Enter Password" name="password" maxlength =20 required id="psw1" >
<br>
<br>
	<label for ="repassword"><b>Re-enter Password:</b></label>
	<input type="password" placeholder="Re-enter Password" name="repassword" maxlength =20 required id="psw2" >

        <br>
		<br>
		<label for ="security_ques"><b>Security Question:</b></label>
               &nbsp <select name="security_ques" required>
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
		<label for ="security_ans"><b>Security Answer:</b></label>
		&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Security Answer" name="security_ans" maxlength=45 required>

      <p>By creating an account you agree to our <a href="PasswordPolicy.html" style="color:dodgerblue">Terms & Privacy</a>.</p>
      	      <div class="container" style="background-color:#f1f1f1; height:75px;">
 
			<button type="submit" class="signbtn" style="width:20%">Sign Up</button>	 
			<button type="button" onclick="document.getElementById('id03').style.display='none'" class="cancelbtn" style="width:20%">Cancel</button>
			
		  </div>

    </div>
  </form>
</div>

<script>
var modal = document.getElementById('id03');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<script>
function validateU()
{
	var num =document.SignU.pincodeU.value;
	var firstpasswordU =document.SignU.passwordU.value;
	var secondpasswordU =document.SignU.repasswordU.value;
      if (isNaN(num)){
	alert(" You have entered an invalid number in pincode");
	return false;
	}
if(firstpasswordU!=secondpasswordU){
alert("password must be same!");
return false;
}
else{
return true;
}
}

</script>



<div id="id02" class="modal">
  <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
  <form class="modal-content animate" action="N_Registeration" method="Post" name="NGO_U" onsubmit= " return validateNGO()">
	<div class=" container">
	<h1>Request Application For NGO</h1>
	<p>Please fill up this form to create an account.</p>
	<hr>
        <fieldset>
	<legend><h1>Details Of Organisation</h1></legend>
        <label for ="O_Id"><b>Organisation ID:</b></label>
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter NGO Id" name="O_Id" maxlength="20" required>
    <br>
	<br>
	<label for ="name"><b>Name Of Organisation:</b></label>
	<input type="text" placeholder="Enter Name Of Organisation" name="name" maxlength="20" pattern="[a-zA-Z\s]{1,15}" title= "Username should only contain letters" required>
    <br>
	<br>
	<label for ="email"><b>Email:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="email" placeholder="Enter Email" name="email" required>
    <br>
	<br>

	<label for ="password"><b>Password:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" placeholder="Enter Password" name="password" required>
    <br>
	<br>
	<label for ="repassword"><b>Re-enter Password:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" placeholder="Re-enter Password" name="repassword" required>
     <br>
	<br>
	<label for ="security_ques"><b>Security Question:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<select name="security_ques">
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
	<label for ="security_ans"><b>Security Answer:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Security Answer" name="security_ans" required>
	<br>
	<br>
        <label for ="address"><b>Address:</b></label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter Address" name="address" maxlength="90" required>
    <br>
	<br>
         <label for ="State"><b>State:</b></label>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<select name="State">
                    <%
                     pst=con.prepareStatement("select * from states");
                    rs=pst.executeQuery();
                    while(rs.next())
                    {
                    %>
                    <option value="<%=rs.getInt("Number")%>"><%=rs.getString("S_Name")%></option>
                   <% }%>
                   </select>
                   <br>
                   <br>
	<label for ="pincode"><b>Pincode:</b></label>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="number" placeholder="Enter Pincode" maxlength="6" name="pincode" required>
        </fieldset>
    <br>
       <br>
       <fieldset>
	<legend><h1>Verified By Institution</h1></legend>
       <label for ="institution"><b>Selected Institution:</b></label>
       <select name="institution">
       	<option value= "Charities Aid Foundation">Charities Aid Foundation</option>
       	<option value= "NGOs INDIA">NGOs INDIA</option>
       	<option value= "TechSoup Asia-Pacific">TechSoup Asia-Pacific</option>
       </select>
	   <br>
	   <br>
        <label for ="v_number"><b>Validation Number:</b></label>
	&nbsp<input type="text" placeholder="Enter Validation Number" name="v_number" required>
     <br>
        <br>
       </hr>
       </fieldset>

      <p>By creating an account you agree to our <a href="PasswordPolicy.html" style="color:dodgerblue">Terms & Privacy</a>.</p>
      &nbsp
	      <div class="container" style="background-color:#f1f1f1; height:75px;">
 
			<button type="submit" class="signbtn" style="width:20%">Sign Up</button>	 
			<button type="button" onclick="document.getElementById('id02').style.display='none'" class="cancelbtn" style="width:20%">Cancel</button>
			
		  </div>
      
    </div>
  </form>
</div>

<script>
var modal = document.getElementById('id02');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

<script type= "text/javascript">
function validateNGO()
{
	var numN=document.NGO_U.pincodeN.value;
	var firstpasswordN=document.NGO_U.passwordN.value;
	var secondpasswordN=document.NGO_U.repasswordN.value;
	var Nname =  document.NGO_U.nameN.value;
      if(!isNaN(Nname))
      {
      alert('Please input alphabet characters only');
      return false;
      }

	if (isNaN(numN)){
	alert(" You have entered an invalid number in pincode");
	return false;
	}
if(firstpasswordN!=secondpasswordN){
alert("password must be same!");
return false;
}
else{
return true;
}
}

</script>

<div id="id01" class="modal">
  <form class="modal-content animate" method="get" action="UNA_login">
    <div class="container">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>
	<div class="container">
	<label for="uid"><b>UserId:</b></label>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" placeholder="Enter User Id" name="uid" required>
	<br>
	<label for="password"><b>Password:</b></label>
	<input type="password" placeholder="Enter Password" name="password" required>



    </div>
        

    <div class="container" style="background-color:#f1f1f1; height:75px;">
        &nbsp
        &nbsp
<button type="submit" class="signbtn" style="width:20%">Login</button>	 
<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn" style="width:20%">Cancel</button>
 <span class="psw">Forgot <a href="SecurityQuestion.jsp">password?</a></span>
    </div>
  </form>
</div>
<br>
<br>
<script>
var modal = document.getElementById('id01');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

    </div>
	<div class= "columnright">
			<h2> Successfully Found..</h2>
		<%
                     pst = con.prepareStatement("SELECT U_ID FROM found_missingpeople;");
                     rs = pst.executeQuery();
                      i=1;
                        while(rs.next())
                        {
                          if(i==5)
                              break;
                          if(i==3)
                          {%>
                           <br>
                <%}
                          i++;

               %>
		<a target="_blank" href="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>">
		<img src="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>" alt=" Missing Person" height= "150" width="100" style="border:10px solid #f0f0f0">
		</a>
                <% } %>
		</div>
	</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");

    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}

    slides[slideIndex-1].style.display = "block";
    setTimeout(showSlides, 2000);
}
</script>


		</div>
	</div>
	<p style= "color:#808080;">
Among all the persons who are reported to be missing, actually only few of them are out of our reach. Most of them are waiting somewhere for someone to help them connect with their family.
That ‚??Someone‚?ù can be you or anyone like us.
Everyone is connected with someone. Let us march forward holding hand in hand so that someday we can hold the hands of those people who are eagerly waiting for someone like us. At help4u.com we do our best to find missing people with the help of numerous NGOs and selfless volunteers. We invite members of the public to contribute by giving information on children or adults who they think might be lost / separated from family and need help. A small effort from you will help us reunite them with their families. Let happiness flow again.
	</p>
	<img src="Support.png" alt="Supported By">
	<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>
	</div>
</body>
</html>






