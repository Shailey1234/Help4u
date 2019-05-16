
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
<title>Profile Page</title>
<style>
	.header {
			overflow:hidden;
			background-color:#b3e0ff;
			padding: 20px 10px;
			text-align:center;
		}
	hr {
		border-top: 2px solid #f1f1f1;
           margin-bottom:25px;
	}
	.column {
				float: right;
				width: 33.33%;
				padding: 15px;
				
		}
			.row:after {
				content: "";
				display: table;
				clear: both;
		}
	.columnright {
				float: left;
				width: 33.33%;
				padding: 15px;
	}
	.logoutbutton{
		background-color:#38acec;
		color:white;
		padding:14px 20px;
		margin: 175px ;
		outline-width:50px;
		border:none;
		cursor:pointer;
		width: 50%;
		opacity: 0.9;
		}
	.logoutbutton:hover{
		opacity:1;
	}
		.vbutton{
		background-color:#38acec;
		color:white;
		padding:14px 20px;
		margin: 50px ;
		border:none;
		cursor:pointer;
		width: 50%;
		opacity: 0.9;
		}
	.vbutton:hover{
		opacity:1;
	}
		.mbutton{
		background-color:#38acec;
		color:white;
		padding:14px 20px;
		margin: 50px ;
		outline-width:50px;
		border:none;
		cursor:pointer;
		width: 30%;
		opacity: 0.9;
		}
	.mbutton:hover{
		opacity:1;
	}
		.jobbutton{
		background-color:#38acec;
		color:white;
		padding:14px 20px;
		margin: 150px 200px ;
		outline-width:50px;
		border:none;
		cursor:pointer;
		width: 30%;
		opacity: 0.9;
		}
	.jobbutton:hover{
		opacity:1;
	}
	.timelinebutton{
		background-color:#38acec;
		color:white;
		padding:14px 20px;
		margin: 175px ;
		outline-width:50px;
		border:none;
		cursor:pointer;
		width: 50%;
		opacity: 0.9;
		}
	.timelinebutton:hover{
		opacity:1;
	}
	.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

		.close:hover,focus {
					color: #000;
					text-decoration: none;
					cursor: pointer;
				}

				.container {
					position: relative;
					width: 10%;
				}

		.image {
				opacity: 1;
				display: block;
				width: 100%;
				height: auto;
				transition: .5s ease;
				backface-visibility: hidden;
				}

		.middle {
					transition: .5s ease;
					opacity: 0;
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					-ms-transform: translate(-50%, -50%);
					text-align: center;
				}

		.container:hover .image {
					opacity: 0.3;
				}

		.container:hover .middle {
					opacity: 1;
				}

		.text {
					background-color: #4CAF50;
					color: white;
					font-size: 16px;
					padding: 16px 32px;

			}
		input[type='submit']{
						background-color: #38acec;
						color: white;
						padding: 14px 20px;
						margin: 8px 0;
						border: none;
						cursor: pointer;
						width: 50%;
						opacity: 0.9;
				}
		input::placeholder {
						color: black;
						font-size: 1em;
						font-style: italic;
						width:50%;
					}
		a.notif {
					position: relative;
					display: block;
					height: 55px;
					width: 55px;
					background: url('5.png');
					background-size: contain; 
					background:no repeat;
					text-decoration: none;
					border-radius: 50%;
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
	.num {
			position: absolute;
			right: 11px;
			top: 6px;
			color: red;
		}
			@media screen and (max-width:600px){
	.card{
	box-shadow:0 4px 8px rgba(0,0,0.2);
	max-width:100px;
	margin:100px;
	text-align:center;
	font-family:arial;
	position:absolute;
	}
	.title{
	color: grey;
	font-size: 18px;
	}

</style>
</head>
<body background="back.jpg" >
    <% if((String)session.getAttribute("Name")==null)
         {
           response.sendRedirect("Login.jsp");
        }
        %>
<div class="header">
	<b><font size="20">Welcome To Your Profile</font></b>
 <a href="NotificationUser.jsp" class="notif"><span class="num"></span></a>
</div>
<hr>
	<div class= "row">
		<div class= "column">
			<form>
			<br>
			<br>
			<br>
	

            <button type="submit" formaction="after___Volunteer" class="vbutton" style="width:30%" >Volunteer Form</button><br>
			<br>
			<button type="submit" formaction="after___TaskVolunteers" class="mbutton">Jobs</button>
			<br>
                        <button type="submit" formaction="UserChangePass.jsp" class="mbutton">Change Password</button>
			</form>
		</div>
		<div class= "column">
		<h2 style="text-align:center">Profile</h2>
		<div class="card" align="center">
                    <%
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
                      PreparedStatement pst = con.prepareStatement("select photo from profilepic where U_ID=?");
                      pst.setString(1,(String)session.getAttribute("Uid"));
                      ResultSet rs =pst.executeQuery();
                      if(rs.next())
                      {
                   %>
                   <img src="${pageContext.request.contextPath}/DisplayProfile?id=<%=(String)session.getAttribute("Uid")%>" alt=" Missing Person" style="width:40%">
                   <% }else{%>
         <a href="UserProfileView.jsp"><img src="avatar2.png" alt="User" style="width:20%"></a>
	<% } %>	
         <h1>${Name}</h1>
		</div>
		<br>
		<br>
		<a href="Timeline.jsp" class="timelinebutton">Timeline</a>
		<br>
		<br>
		<br>
		<br>
		<br>
		<a href="Logout" class="logoutbutton">Logout</a>
		</div>
		<div class= "columnleft">
		<form>
		<br>
		<br>
		<br>

        <button type="submit" formaction="after___found" class="mbutton" style="width:20%">Found</button>
		<br>
		<button type="submit" formaction="after___missing" class="mbutton" style="width:20%">Complaint Form For Missing People</button>

			<div class="container">
			<div class="middle">
			<button id="myBtn">Found</button>
			<div id="myModal" class="modal">
			<div class="modal-content">
			<span class="close">&times;</span>
			<label>Address:</label>
			<input type="text" placeholder="Write where missing person found.." name="address" />
			<label>Reason of Missing</label>
			<input type="text" placeholder="what was reason for missing.." name="reason"/>
			<label>Missing Person Found By:</label>
			<input type="text" placeholder="Let us know the name of person.." name="found"/>
			&nbsp &nbsp &nbsp &nbsp &nbsp <input type="submit" value="submit" name="submit" formaction="#" style="width:200px"/>
</div>
</div>
</form>
  <script>
var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0]; 
btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</div>
</div>
</form>
</div>
</div>
	
		<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
		</div>
</body>
</html>