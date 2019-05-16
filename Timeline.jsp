<%@page import="java.util.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
<title>Timeline</title>
<style>
*,
*::before,
*::after {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
	.header {
			overflow:hidden;
			background-color:#b3e0ff;
			padding: 20px ;
			text-align:center;
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
                		.footer {
			left: 0;
			bottom: 0;
			width: 100%;
			background-color:#b3e0ff;
			color: black;
			text-align: left;
                        padding: 20px;
			}
body {
  font: normal 16px/1.5 "Helvetica Neue", sans-serif;
  background: #456990;
  color: #fff;
  overflow-x: hidden;
  padding-bottom: 50px;
}  /* INTRO SECTION
?????????????????????????????????????????????????? */

.intro {
  background:#b3e0ff;

}

.container {
  width: 90%;
  max-width: 1200px;
  margin: 0 auto;
  text-align: center;
}

h1 {
  font-size: 4rem;
}


/* TIMELINE
?????????????????????????????????????????????????? */

.timeline ul {
 
  padding: 50px 0;
}

.timeline ul li {
  list-style-type: none;
  position: relative;
  width: 6px;
  margin: 0 auto;
  padding-top: 50px;
  background: #fff;
}

.timeline ul li::after {
  content: '';
  position: absolute;
  left: 50%;
  bottom: 0;
  transform: translateX(-50%);
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background: inherit;
}

.timeline ul li div {
  position: relative;
  bottom: 0;
  width: 400px;
  padding: 15px;
  background:#38acec;
}

.timeline ul li div::before {
  content: '';
  position: absolute;
  bottom: 7px;
  width: 0;
  height: 0;
  border-style: solid;
}

.timeline ul li:nth-child(odd) div {
  left: 45px;
}

.timeline ul li:nth-child(odd) div::before {
  left: -15px;
  border-width: 8px 16px 8px 0;
  border-color: transparent #38acec transparent transparent;
}

.timeline ul li:nth-child(even) div {
  left: -439px;
}

.timeline ul li:nth-child(even) div::before {
  right: -15px;
  border-width: 8px 0 8px 16px;
  border-color: transparent transparent transparent #38acec;
}

time {
  display: block;
  font-size: 1.2rem;
  font-weight: bold;
  margin-bottom: 8px;
}



.timeline ul li::after {
  transition: background .5s ease-in-out;
}

.timeline ul li.in-view::after {
  background: #38acec;
}

.timeline ul li div {
  visibility: hidden;
  opacity: 0;
  transition: all .5s ease-in-out;
}

.timeline ul li:nth-child(odd) div {
  transform: translate3d(200px, 0, 0);
}

.timeline ul li:nth-child(even) div {
  transform: translate3d(-200px, 0, 0);
}

.timeline ul li.in-view div {
  transform: none;
  visibility: visible;
  opacity: 1;
}




@media screen and (max-width: 900px) {
  .timeline ul li div {
    width: 250px;
  }
  .timeline ul li:nth-child(even) div {
    left: -289px;
    /*250+45-6*/
  }
}

@media screen and (max-width: 600px) {
  .timeline ul li {
    margin-left: 20px;
  }
  .timeline ul li div {
    width: calc(100vw - 91px);
  }
  .timeline ul li:nth-child(even) div {
    left: 45px;
  }
  .timeline ul li:nth-child(even) div::before {
    left: -15px;
    border-width: 8px 16px 8px 0;
    border-color: transparent #F45B69 transparent transparent;
  }
}
    
</style>
</head>
<body background="back.jpg">
    <div class="header">
        <img src="logo.png" alt="logo" class="logo" height="50" width="200" style="float:left;">	
        <h1 style="color:black;">Timeline</h1>
        <a href="AfterLogin.jsp" style="float:left;"><img src="1_1.jpg" alt="logo" height="50" width="50" style="float:left; border-radius:5px;"></a>
    </div>
    <%
      if(session.getAttribute("Name")==null)
         {
           response.sendRedirect("Login.jsp");
         }
        %>
<section class="intro">
  <div class="container">
    <h1></h1>
  </div>
</section>

<section class="timeline">
     <%     
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
        PreparedStatement pst = con.prepareStatement("SELECT U_ID,MP_Name,MP_DOB,MP_State,MP_DOM,MP_ReportDate from missingpeople_details ");
        ResultSet rs = pst.executeQuery();
       
    %>
  <ul>
      <%
                while(rs.next())
                 {
                  pst=con.prepareStatement("select F_Address from found_missingpeople where U_ID=?");
                  pst.setString(1,rs.getString("U_ID"));
                  ResultSet r = pst.executeQuery();
                  if(r.next())
                   continue;
            %>
    <li>
      <div>
        <table>
            <form method="post">
            <tr>
                <td>
                    <b>Name    :</b>
                </td>
                <td>
                    <input type="hidden" name="userid" value="<%= rs.getString("U_ID") %>"/>
                    <%= rs.getString("MP_Name") %>
                </td>
                <td rowspan=6>
                    <img src="${pageContext.request.contextPath}/DisplayImages?id=<%=rs.getString("U_ID") %>" alt="hii" style="height: 220px; width: 220px;"/>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Age  :</b>
                </td>
                <td>
                    <%
                    String date = rs.getString("MP_DOB");
                    Date date1 = new Date();
                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    String currentDate = sdf.format(date1);
                    System.out.println(date);
                    System.out.println(currentDate);
                    String d[] = date.split("-");
                    String d1[] = currentDate.split("-");
                    int age = (Integer.parseInt(d1[0])-Integer.parseInt(d[0]))-1;
                    %>
                   <%= age %> 
                </td>
            </tr>
            <tr>
                <td>
                    Place  :
                </td>
                <td>
                    <% 
                     pst=con.prepareStatement("select S_Name from states where Number=?");
                     pst.setString(1,String.valueOf(rs.getInt("MP_State")));
                     ResultSet rs1=pst.executeQuery();
                     rs1.next();
                    %> 
                    <%= rs1.getString("S_Name") %>
                </td>
            </tr>
            <tr>
                <td>
                    Date Of Missing :
                </td>
                <td>
                   <%= rs.getString("MP_DOM") %> 
                </td>
            </tr>
            <tr>
                <td>
                    Posted On :
                </td>
                <td>
                   <%= rs.getString("MP_ReportDate") %> 
                </td>
            </tr>
            <tr>
                <td>
                    <textarea rows="2" cols="25" name="comment" placeholder="help us to find"></textarea>
                </td>
                <td>
               <input type ="submit" formaction="CommentSave" value="Save"/>  
                </td>
            </tr>
            <tr>
                <td>
                 <input type ="submit" formaction="Timeline_Comment" value="View Comment"/>  
                </td>
                
            </tr>
            </form>
           </table>
      </div>
    </li>
    <% } %>
  </ul>
</section>
<script>
(function() {
  var items = document.querySelectorAll(".timeline li");
  function isElementInViewport(el) {
    var rect = el.getBoundingClientRect();
    return (
      rect.top >= 0 &&
      rect.left >= 0 &&
      rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
      rect.right <= (window.innerWidth || document.documentElement.clientWidth)
    );
  }

  function callbackFunc() {
    for (var i = 0; i < items.length; i++) {
      if (isElementInViewport(items[i])) {
        items[i].classList.add("in-view");
      }
    }
  }


  window.addEventListener("load", callbackFunc);
  window.addEventListener("resize", callbackFunc);
  window.addEventListener("scroll", callbackFunc);

})();
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

	<div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Reserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>

</body>
</html>