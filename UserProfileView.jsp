<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    position: absolute;
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
                input[type='submit']{
		background-color: red;
		color: white;
		padding: 10px 15px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 10%;
		opacity: 0.9;
	}
        input[type='submit']:hover{
		opacity:1;
	}
	
	input[type='submit']{
		float:center;
		width:10%;
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
                <br>
                <a href="AfterLogin.jsp" style="float:left;"><img src="1_1.jpg" alt="logo" height="50" width="50" style="float:left; border-radius:5px;"></a>
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
			<button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 100px; height:60px; float: left;"">FAQ</button></a>
		</div>
	</div>
        <fieldset>
            <legend><b><h1>PHOTO</h1></b></legend>
        <form method="post" action="InsertProfile" enctype="multipart/form-data">
            <br>
            <br>
            <br>
            <br>
            <label><b>Choose picture</b></label>
            <br><br><br>
            <input type="file" name="image"/>
            <br><br><br>
            <input type="submit">
            <br>
            <br>
        </form>
     </fieldset>
       <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>
    </body>
</html>
