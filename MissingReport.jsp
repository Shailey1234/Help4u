<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <style>
	body{
		font-family: Arial, Helvetica, sans-serif;
		box-sizing: border-box;
	}
	input[type=text],input[type=number],input[type=email]{
		width: 100%;
		padding: 15px;
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
	select { 
			width: 100%;
		padding: 15px;
		margin: 5px 0 22px 0;
		display: inline-block;
		border-style: solid, solid;
		border-color: #f5f5f5;
		background: #f8f8f8;
		
		}
	
	hr{
		border-top: 2px solid #f1f1f1;
		margin-bottom: 25px;
	}
	button{
		background-color: #38acec;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 50%;
		opacity: 0.9;
	}
	button:hover{
		opacity:1;
	}
	input[type='reset']:hover{
		opacity:1;
	}
	input[type='submit']:hover{
		opacity:1;
	}
	
	input[type='submit']{
		float: right;
		width:100;
		padding: 14px 20px;
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
	
	input[type='reset']{
		width: 30%;
		padding: 14px 20px;
		background-color: #f44336;
		float: left;
	}
	.container{
		padding: 14px;
	}
	.clearfix::after{
		content:"";
		clear: both;
		display:table;
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
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
  
          %>  
        <h1 align="center"><font color="blue">Detailed Report of Missing Person</font></h1>
        <form name="next" action="InserMissing1" method="POST"><table>
         <fieldset>
                <tbody>
                    <tr>
	      <tr><th colspan="4"><b><font size="5" color="blue">Personal Details</font></b></th></tr>
                        <td>Name*</td>
                        <td><input type = "text" name="Name" maxlength="20" required></td></tr>
                    <tr><td>Nickname</td>
                        <td><input type="text" maxlength="10" name="Nickname"></td>
                    </tr>
                    <tr>
                        <td>Gender*</td>
                        <td><select name="gender" required>
                                
                                <option value="1">Male</option>
                                <option value="2">Female</option>
                                <option value="3">Other</option>
                            </select></td></tr>
                        <tr><td>Date of Birth*</td>
                        <td><input type="date" name="dob" required></td>
                    </tr>
                    <tr>
                        <td>Father's Name*</td>
                <td><input type="text" maxlength="30" name="FName" required></td></tr>
                        <tr><td>Mother's Name*</td>
                        <td><input type="text" maxlength="30" name="MName" required></td>
                    </tr>
                    <tr>
                        <td>Guardian's Name*</td>
                        <td><input type="text" maxlength="30" name="GName" required></td></tr>  
                    <tr>
	  <tr>
                        <td>Relationship with Guardian*</td>
                        <td><input type="text" maxlength="20" name="RelGuardian" required></td></tr>  
                    <tr>
                        <td>Languages Spoken*</td>
                        <td><input type="text" maxlength="100" name="LSpoken" required></td></tr>
                       <tr> <td>Mother Tongue*</td>
                        <td><input type="text" maxlength="10" name="MTongue" required></td>
                    </tr>
                    <tr>
                        <td>Religion*</td>
                        <td><select name="Religion">
                               
                                <option value="1">Hinduism</option>
                                <option value="2">Islam</option>
                                <option value="3">Christianity</option>
                                <option value="4">Jainism</option>
                                <option value="5">Buddhism</option>
                                <option value="6">Sikhism</option>
                            </select></td></tr></tr>
                        <tr><td>Reason for Missing*</td>
                            <td><input type="text" maxlength="50" name="ReasonforMissing" required>
                           </td>
						   
                        </tr>
                    <tr><th colspan="4"><b><font size="5" color="blue"> Location</font></b></th></tr>
                    <tr>
                        <td>Address*</td>
                        <td><input type="text" maxlength="90" name="address" required>
                           </td>
                    </tr>
	   <tr>
                      
                 <td><label for ="state"><b>State</b></label></td>
		<td><select name="state">
                    <% 
                    PreparedStatement pst=con.prepareStatement("select * from states");
                    ResultSet rs=pst.executeQuery();
                    while(rs.next())
                    {
                    %>
                    <option value="<%=rs.getInt("Number")%>"><%=rs.getString("S_Name")%></option>
                   <% }%>
                   </select>
                     </td>
                    </tr>
                     <tr>
                        <td>Pincode*</td>
                        <td><input type="number" maxlength="6" name="Pincode" required></td>
                    </tr>
                       <tr> <td>Mobile Number*</td>
                           <td><input type="number" maxlength="10" name="MNumber" required></td>
                    </tr>
                       <tr> <td>Alternate Mobile Number </td>
                           <td><input type="number" maxlength="10" name="ANumber" required></td>
                    </tr>
                       <tr> <td>Landline Number </td>
                        <td><input type="number" maxlength="10" name="LNumber"></td>
                    </tr>
                    <tr>
                        <td>Date Of Missing*</td>
                        <td><input type="date" name="dom" required/></td>
                    </tr>
                </tbody>
            </table>
        
         
            <input type="reset" value="Reset" name="Reset" >
        <input type="submit" value="submit" name="Next">
        </form>
        
        </body>

</html>
