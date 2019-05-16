<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!--<%@page contentType="text/html" pageEncoding="UTF-8"%>-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
table {
    border-collapse: collapse;
    border: 3px solid black;
     width:100%;
     background-color: white;
    }
    body  {
      
             background-color: white;
             background-repeat: no-repeat;
             background-attachment: fixed;
             background-position: center; 
          }  

	input[id='discard']:hover{
		opacity:1;
	}
	input[id='submit']:hover{
		opacity:1;
	}
        #submit{
            background-color:red;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
                float:right;
		width:50%;
        }
        #discard{
            background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
                width: 50%;
		padding: 14px 20px;
		background-color: #f44336;
        }* {
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
    <body>
        <%
            if(session.getAttribute("Name")==null)
             {
                response.sendRedirect("Login.jsp");
              }
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
              
              Date dateobj =new Date();
              java.text.SimpleDateFormat sdf =new java.text.SimpleDateFormat("yyyy-MM-dd");
              String currentTime = sdf.format(dateobj);
             PreparedStatement pst=con.prepareStatement("select * from task where T_LastDate_Accept>? and typeOfUser=1");
             pst.setDate(1,java.sql.Date.valueOf(currentTime));
             ResultSet rs=pst.executeQuery();
             PreparedStatement ps=con.prepareStatement("select * from task where T_LastDate_Accept>? and typeOfUser=3");
             ps.setDate(1,java.sql.Date.valueOf(currentTime));
             ResultSet r=ps.executeQuery();
             
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
        <table >
            
             <%   while(r.next())
             {
             PreparedStatement s=con.prepareStatement("select * from ngo_details where N_ID=? and N_Val_NonVal=2");
             s.setString(1,r.getString("ID"));
             ResultSet z=s.executeQuery();
               if(!z.next())
                   continue;
               PreparedStatement ls=con.prepareStatement("select S_Name from states where Number=?");
               ls.setInt(1,z.getInt("N_State"));
               ResultSet o=ls.executeQuery();
               o.next();
               PreparedStatement monkey =con.prepareStatement("select Sl_No from applytask where T_Name =? and U_ID=?");
               monkey.setString(1,r.getString("T_Name"));
               monkey.setString(2,(String)session.getAttribute("Uid"));
               ResultSet lot = monkey.executeQuery();
               if(lot.next())
                   continue;
            %>
           <tr>
           <form>
            <table width="940" cellspacing="15" cellpadding="2S">
               <tr>
                  <br>
                   <td>
                       <b><center>Task_id          :</b><b><i><%= r.getString("T_Name")%></i></center><br><br></b>
                   </td>
                   <br>
               </tr>
               <tr>
                <td>
                    <b><center>What You Have To Do       :</b><b><i><%= r.getString("T_Descri")%></i></center><br><br></b>
                
                </td>
                
               </tr>
               <tr>
                  <td>
                    <b>Name Of User :</b><b><%= z.getString("N_Name") %><br><br><br</b>
                    
                  </td>
                  <br>
                   <td>
                       <b>Address           :</b><b><%= z.getString("N_Address") %>,<%= o.getString("S_Name")%><br><br></b>
                  </td>
                  <br>
               </tr>
               <tr>
                  <td>
                      <b>Last Date To Apply :</b><b><%= r.getDate("T_LastDate_Accept") %><br><br></b>
                  </td>
                   <td>
                      <b>Last Date To Finish :</b><b><%= r.getDate("T_Timelimit") %><br><br></b>
                  </td>
               </tr>
               <tr>
                  <td>
                      <input type="hidden" name="T_Name" value="<%= r.getString("T_Name") %>"/>  
                  </td>
                  <td>
                      <button id="submit" type="submit" formaction="Apply" style="">Apply</button>
                  </td>
               </tr>
            </table>
          </form>
        </tr>
        <% } %>
            <%   while(rs.next())
             { 
             PreparedStatement p =con.prepareStatement("select * from volunteer_login where U_ID=? and Validated_By_Admin=2;");
             p.setString(1,rs.getString("ID"));
             ResultSet rt = p.executeQuery();
             
             if(!rt.next())
                continue;
             PreparedStatement x =con.prepareStatement("select * from user_details where U_ID=?;");
             x.setString(1,rs.getString("ID"));
             ResultSet y = x.executeQuery();
             y.next();
             PreparedStatement l=con.prepareStatement("select S_Name from states where Number=?");
               l.setInt(1,rt.getInt("State"));
               ResultSet oo=l.executeQuery();
               oo.next();
               PreparedStatement monkey =con.prepareStatement("select Sl_No from applytask where T_Name =? and U_ID=?");
               monkey.setString(1,rs.getString("T_Name"));
               monkey.setString(2,(String)session.getAttribute("Uid"));
               ResultSet lot = monkey.executeQuery();
               if(lot.next())
                   continue;
            %>
           <tr>
             <form>
            <table width="940" cellspacing="15" cellpadding="2S">
               <tr>
                  <br>
                   <td>
                       <b><center>Task_id          :</b><b><i><%= rs.getString("T_Name")%></i></center><br><br></b>
                   </td>
                   <br>
               </tr>
               <tr>
                <td>
                    <b><center>What You Have To Do       :</b><b><i><%= rs.getString("T_Descri")%></i></center><br><br></b>
                
                </td>
                
               </tr>
               <tr>
                  <td>
                    <b>Name Of User :</b><b><%= y.getString("Name") %><br><br><br</b>
                    
                  </td>
                  <br>
                   <td>
                       <b>Address           :</b><b><%= rt.getString("Cor_Address")%></b>,<b><%= oo.getString("S_Name") %><br><br></b>
                  </td>
                  <br>
               </tr>
               <tr>
                  <td>
                      <b>Last Date To Apply :</b><b><%= rs.getDate("T_LastDate_Accept") %><br><br></b>
                  </td>
                   <td>
                      <b>Last Date To Finish :</b><b><%= rs.getDate("T_Timelimit") %><br><br></b>
                  </td>
               </tr>
               <tr>
                  <td>
                      <input type="hidden" name="T_Name" value="<%= rs.getString("T_Name") %>"/>   
                  </td>
                  <td>
                      <button id="submit" type="submit" formaction="Apply" class="vbutton">Apply</button>
                  </td>
               </tr>
            </table>
             </form>
        </tr>
        <% } %>
        <div class = "footer">
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's </p>
	</div>          
          </table>
       
    </body>
     
</html>
