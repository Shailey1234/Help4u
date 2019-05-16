<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
         * {
		box-sizing: border-box;
		}
		body {
			font-family: Arial , Helvetica , sans-serif;
			overflow: scroll;
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
			position: float-right;
		}
	.roundbutton {
			border-radius: 50%;
		}
	.roundbutton:hover {
		background-color:#ddd;
		 color: #0084ff;
		}
		.footer {
			left: 0;
			bottom: 0;
			width: 100%;
			background-color: #38acec;
			color: white;
			text-align: left;
			}
			h2 {
				color: #808080;
		}   
          input[type='submit']{
		background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 30%;
		opacity: 0.9;
	}
	input[type='submit']:hover{
		opacity:1;
	}
	input[type='submit']{
		width: 20%;
		padding: 14px 20px;
		background-color: #f44336;
	}
        </style>
    </head>
    <body>
        <%
           if(session.getAttribute("Name")==null)
           {
               response.sendRedirect("Login.jsp");
           }
        %>
<div class="header">
		<img src="logo.png" alt="logo" class="logo" height="50" width="200">		
		<div class="header-right">
			<a href="#">Help Us to Find Someone</a>
			<a href="#">Get Involved</a>
			<a href="#">About Us</a>
			<button class="button1 roundbutton">Helpline</button>
			<button class="button1 roundbutton">FAQ</button>
		</div>
	</div>
        <fieldset>
            <legend><b>PHOTO</b></legend>
        <form method="post" action="InserPicture" enctype="multipart/form-data">
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
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>          
    </body>
</html>
