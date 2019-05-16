<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="outgoingjobs.css" />
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
		<img src="logo.png" alt="logo" class="logo" height="50" width="200">
		<div class="header-right">
			<a href="helpus.html">Help Us to Find Someone</a>
			<a href="GetInvolved.html">Get Involved</a>
			<a href="AboutUs.html">About Us</a>
			<button class="buttonr roundbutton" style= " width: 100px; height:60px; text-align: center; float: left;">Helpline</button>
                        <a href="FAQs.jsp"><button class="buttonr roundbutton" style= " width: 100px; height:60px; float: left;"">FAQ</button></a>
		</div>
</div>
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

  <li><a href="AdminChangePass.jsp">Change Password</a></li>
  <li><a href="Logout">Logout</a></li>
</ul>
        <%
           Class.forName("com.mysql.jdbc.Driver");
           Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
            PreparedStatement pst = con.prepareStatement("select * from missingpeople_details where U_ID=?");
            pst.setString(1,request.getParameter("Uid"));
            ResultSet rs = pst.executeQuery();
            PreparedStatement ps = con.prepareStatement("select * from missingpeople_appearance where U_ID=?");
            ps.setString(1,request.getParameter("Uid"));
            ResultSet r = ps.executeQuery();
            r.next();rs.next();
            %>
            <form method="post">
                <fieldset>
                    <legend><b>Personal Details</b></legend>
                    <table>
                        <tr>
                            <td>
                                <b><centre>NAME   :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Name")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>NICKNAME   :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Nickname")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <%
                            PreparedStatement lol = con.prepareStatement("select Name from gender where Number = ?");
                            lol.setInt(1,rs.getInt("MP_Gender"));
                            ResultSet olo = lol.executeQuery();
                            olo.next();
                            %>
                            <td>
                                <b><centre>GENDER   :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= olo.getString("Name")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>DATE OF BIRTH :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getDate("MP_DOB")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>FATHER'S  NAME :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Fname")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>MOTHER'S  NAME :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Mname")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>GUARDIAN'S  NAME   :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Gname")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>GUARDIAN RELATION   :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Grelation")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre> LANGUAGE SPOKEN :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_LangSpoken")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>MOTHER TONGUE:</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_MTongue")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <%
                               PreparedStatement joe = con.prepareStatement("select Name from religion where Number=?");
                                                joe.setInt(1,rs.getInt("MP_Religion"));
                                                ResultSet i = joe.executeQuery();
                                                i.next();
                            %>
                            <td>
                                <b><centre>RELIGION :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= i.getString("Name") %></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>REASON OF MISSING:</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_ReasonMissing")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>DATE OF MISSING  :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getDate("MP_DOM")%></centre></b>    
                            </td>
                        </tr>
                    </table>
                   </fieldset>
                  <fieldset>
                    <legend><b>LOCATION</b></legend>
                    <table>
                        <tr>
                            <td>
                                <b><centre>PLACE FROM WHERE IT IS MISSING:</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getString("MP_Address")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <%
                             
                     pst=con.prepareStatement("select S_Name from states where Number=?");
                     pst.setString(1,String.valueOf(rs.getInt("MP_State")));
                     ResultSet rs1=pst.executeQuery();
                     rs1.next();
                    %> 
                    
                           
                            <td>
                                <b><centre>STATE  :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs1.getString("S_Name")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>PINCODE :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getInt("MP_Pincode")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>MOBILE NUMBER :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getLong("MP_MobNo")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>ALTERNATE NUMBER :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getLong("MP_AlternateNo")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>LANDLINE :</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getLong("MP_LandlineNo")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>DATE THEY REPORT US:</centre></b>   
                            </td>
                            <td>
                                <b><centre><%= rs.getDate("MP_ReportDate")%></centre></b>    
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset>
                    <legend><b>Appearance Details</b></legend>
                    <table>
                    <tr>
                            <td>
                                <b><centre>Hair Type</centre></b>   
                            </td>
                            <td>
                                <%
                                pst=con.prepareStatement("select H_Types from hair_type where Number=?;");
                                pst.setInt(1,r.getInt("MP_HairType"));
                               ResultSet monica = pst.executeQuery();
                               monica.next();
                                %>
                                <b><centre><%= monica.getString("H_Types")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Hair Colour</centre></b>   
                            </td>
                            <td>
                                <%
                                pst=con.prepareStatement("select HC_Type from hair_colour where Number=?;");
                                pst.setInt(1,r.getInt("MP_HairColour"));
                                ResultSet chandler = pst.executeQuery();
                                chandler.next();
                                %>
                                <b><centre><%= chandler.getString("HC_Type") %></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Hair Type</centre></b>   
                            </td>
                            <td>
                                <%
                                 pst=con.prepareStatement("select EB_Type from eyebrows_type where Number=?;");
                                 pst.setInt(1,r.getInt("MP_EyebrowsType"));
                                 ResultSet ross = pst.executeQuery();
                                 ross.next();
                                %>
                                <b><centre><%= ross.getString("EB_Type") %></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Hair Type</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_EyesType")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Teeth</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_Teeth")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Shape Face</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_ShapeFace")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Complexion</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_Complexion")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Body Build</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_BodyBuild")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Identification Mark 1</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenMark1")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Identification Part 1</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenPart1")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Identification Location 1</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenLoc1")%></centre></b>    
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <b><centre>Identification Mark 2</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenMark2")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Identification Part 2</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenPart2")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Identification Location 2</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_IdenLoc2")%></centre></b>    
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b><centre>Disability</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_Disabilities")%></centre></b>    
                            </td>
                        </tr>
                                               <tr>
                            <td>
                                <b><centre>If Others</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getString("MP_IfOther")%></centre></b>    
                            </td>
                        </tr>
                                                <tr>
                            <td>
                                <b><centre>Weight</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><centre><%= r.getInt("MP_Weight")%></centre></b>    
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <b><centre>Height</centre></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><center><%= r.getInt("MP_HeightFeet")%>feet<%= r.getString("MP_HeightInches") %>inches</center></b>    
                            </td>
                        </tr>
                                               <tr>
                            <td>
                                <b><center>Mentally Disturbed</center></b>   
                            </td>
                            <td>
                                <%
                                %>
                                <b><center><%= r.getString("MP_MentallyChallenged")%></center></b>    
                            </td>
                                               </tr>
                        
                    </table>
                            
                </fieldset>
            </form>
               <div class = "footer" >
		<p>&#169 Copyright 2018 Help4U.com.<br>All Rights Rserved.<br>
		Powered By Enhance Technologies and St.Angelo's</p>
</div>             
    </body>
    
</html>
