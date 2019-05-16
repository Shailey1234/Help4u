<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>found form</title>
        <style>

       body
	{
	background:#59ABE3;
	margin:0
	}

      .form
	{
	width:340px;
	height:440px;
	background:#e6e6e6;
	border-radius:8px;
	box-shadow:0 0 40px -10px #000;
	margin:calc(50vh - 220px) auto;
	padding:20px 30px;
	max-width:calc(100vw - 40px);
	box-sizing:border-box;
	font-family:'Montserrat',sans-serif;
	position:relative
	}

       h2
	{
	margin:10px 0;
	padding-bottom:10px;
	width:180px;
	color:#78788c;
	border-bottom:3px solid #78788c
	}

      input
	{
	width:100%;
	padding:10px;
	box-sizing:borderbox;
	background:none;
	outline:none;
	resize:none;
	border:0;
	font-family:'Montserrat',sans-serif;
	transition:all .3s;
	border-bottom:2px solid #bebed2
	}

       input:focus
	{
	border-bottom:2px solid #78788c
	}

       p:before
	{
	content:attr(type);
	display:block;
	margin:28px 0 0;
	font-size:14px;
	color:#5a5a5a
	}

       button
	{
	float:right;
	padding:8px 12px;
	margin:8px 0 0;
	font-family:'Montserrat',sans-serif;
	border:2px solid#78788c;
	background:0;
	color:#5a5a6e;
	cursor:pointer;
	transition:all .3s
	}

       button:hover
	{
	background:#78788c;
	color:#fff
	}

        div
	{
	content:'Hi';
	position:absolute;
	bottom:-15px;
	right:20px;
	background:#50505a;
	color:#fff;
	width:320px;
	padding:16px 4px 16px 0;
	border-radius:6px;
	font-size:13px;
	box-shadow:10px 10px 40px -14px #000
	}

       span
	{
	margin:0 5px 0 15px
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
</style>

    </head>
    <body>
        <a href="AfterLogin.jsp" style="float:left;"><img src="1_1.jpg" alt="logo" height="50" width="50" style="float:left; border-radius:5px;"></a>
        <% 
            if((String)session.getAttribute("Name")==null)
            {
                response.sendRedirect("Login.jsp");
            }
            %>
   <form class="form" method="post" action="InserFound">
   <label>Address:</label>
   <input type="text" placeholder="Write where missing person found.." name="address" />
  
   <label>Reason of Missing</label>
   <input type="text" placeholder="what was reason for missing.." name="reason"/>
   
   <label>Who Found Missing Person:</label>
   <input type="text" placeholder="Who Found Missing Person" name="found"/>
   
    &nbsp &nbsp &nbsp &nbsp &nbsp<input type="submit" value="submit" name="submit" style="width:200px"/>
   </form> 
   </body>
</html>
