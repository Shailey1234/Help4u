<html lang="en">
<head>
<title>ADMIN Change Password</title>
    <link rel="stylesheet" type="text/css" href="outgoingjobs.css" >
        <link rel="stylesheet" type="text/css" href="headfooter.css" >
   
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
	input[type='reset'],input[type='submit']{
		background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 10%;
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
    </head>
    <body background="back.jpg">
        <% if((String)session.getAttribute("Name")==null)
        {
          response.sendRedirect("Login.jsp");
        }
        %>
        <div class="header">
            <img src="logo.png" alt="logo" class="logo" style=" height:50; width:200; float: left;">
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
			<button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 100px; height:60px; float: left;"">FAQ</button></a>
		</div>
</div>
         <center><h1>${Name}</h1></center>
         <ul class="main-navigation">
  <li><a href="Admin.jsp">Home</a></li>          
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

  <li><a href="#">Change Password</a></li>
  <li><a href="Logout">Logout</a></li>
</ul>



         <br>
         <br>
         <br>
         
           <fieldset><legend><b><h1>Change Password</h1></b></legend>
           
            <form method="post" action="UpdateChangePassword">
                
            <label>Current Password:   </label>
            <input type="password" name="current" placeholder="enter current password" required/>
            <br>
            <br>
            <br>
            <label>New Password:       </label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="newpass" placeholder="enter new password" required/>
            <br>
            <br>
            <br>
            <label>Confirm Password:  </label>
            <input type="password" name="confirmpass" placeholder="enter confirm new password" required/>
            <br>
            <br>
            <br>
           
            <input type="Reset" value="Reset"/>
            <input type="submit" value="Submit"/>
            <br>
            <br>
            <br>
            <br>
            </form>
       </fieldset>      
         <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>

</body>
</html>