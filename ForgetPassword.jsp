<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
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
                    position: absolute;
			left: 0;
			bottom: 0;
			width: 100%;
                        background-color: #b3e0ff;
			color: black;
			text-align: left;
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
		width:20%;
	}
	input[type='reset']{
		width: 20%;
		padding: 14px 20px;
		background-color: #f44336;
	}
        input[type=text],input[type=password],input[type=number]{
		width: 30%;
		padding: 10px;
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
  </style>
    </head>
    <body>
       
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
        <fieldset><legend><b>New Password</b></legend>
            <% String userid = request.getParameter("Uid"); %>
            <form method="post" action="UpdatePassword">
            <label>New Password</label>
            <input type="password" name="new" placeholder="enter password" required/>
            <br>
            <br>
            <br>
            <label>Confirm Password</label>
            <input type="password" name="newii" placeholder="enter password" required/>
            <br>
            <br>
            <br>
            <input type="hidden" name="Uid" value="<%= userid %>"/>
            <input type="reset" value="reset"/>
            <input type="submit" value="Submit"/>
            <br>
            <br>
            <br>
            <br>
            </form>
       </fieldset>
      <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
         </div>	  
        
    </body>
</html>
