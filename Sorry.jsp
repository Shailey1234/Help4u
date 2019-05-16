<html>
<head>

<title>Error</title>
<style>


* {
		box-sizing: border-box;
		}
		body {
			margin:0;
			font-family: Arial;
			overflow: scroll;
		}
	.header {
			overflow:hidden;
			background-color:#f8f8f8;
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
	.header-left {
			position: float-right;
		}
	
	.header a:hover {
		background-color:#ddd;
		 color: #0084ff;
		}
	.header-right{
		position: float-right;
		}
	.button {
			background-color:#38acec;
			border:none;
			color: white;
			padding: 20px;
			text-align:center;
			text-decoration:none;
			display:inline-block;
			font-size: 16px;
			cursor:pointer;
			position: float-right;
		}
	.roundbutton {
			border-radius: 50%;
		}
		.footer {
			
			left: 0;
			bottom: 0;
			width: 100%;
			background-color: #38acec;
			color: white;
			text-align: left;
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




</style>
</head>

<body style="margin: 0px; padding: 0px; font-family: 'Trebuchet MS',verdana;">
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

<table width="100%" style="height: 100%;" cellpadding="10" cellspacing="0" border="0">


<!-- ============ HEADER SECTION ============== -->



<!-- ============ NAVIGATION BAR SECTION ============== -->


<tr>
<!-- ============ LEFT COLUMN (MENU) ============== -->
<td width="20%" valign="top" bgcolor="white">

</td>

<!-- ============ MIDDLE COLUMN (CONTENT) ============== -->
<td width="55%" valign="top" bgcolor="white">
<div style="width: 1000px;
height: 300px;
    border: 5px solid grey;
border-style:rigid;
border-radius:5px;
    padding: 25px;
    margin: 25px;">

<p style="text-align:center;"><img src="1.jpg" alt="1">
</p>
<p style="font-family:verdana;
color:grey;
text-align:center;
font-size:160%;"
>
You are not verified by admin.
</p>
</div>
</div>

</td>

<td width="25%" valign="top" bgcolor="white">&nbsp;</td>

</tr>

<!-- ============ FOOTER SECTION ============== -->
<tr><td colspan="3" align="center" height="20" bgcolor="white"></td></tr>
</table>
<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</body>

<html>
