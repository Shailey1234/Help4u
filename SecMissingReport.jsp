<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Document   : details
    Created on : Feb 23, 2018, 5:18:08 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appearance</title>
        <style>
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
	}</style>
    </head>
    <body>
        <%
      
       if((session.getAttribute("Name")==null)&&(session.getAttribute("con")==null))
           {
              response.sendRedirect("Login.jsp");
           }
      
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/help4u","root","vasant.1");
           PreparedStatement pst=null;
  %>

        <h1 align="center">Appearance Details</h1>
        <form name="Details" action="InserMissing2" method="post">
        <table>
            <tbody>
                    <tr>
                        <td>Hair Type *</td>
                        <td><select name="HairType">
                                <%
                                     pst=con.prepareStatement("select * from hair_type;");
                                      ResultSet rs = pst.executeQuery();
                                      
                                      while(rs.next())
                                      {
                                      %>
                                
                                      <option value="<%= rs.getInt("Number") %>"><%= rs.getString("H_Types")%></option>
                                  <% } %>
                            </select></td></tr>
                        <tr><td>Hair Colour *</td>
                        <td><select name="HairColour">
                              <%
                                     pst=con.prepareStatement("select * from hair_colour;");
                                      ResultSet rst = pst.executeQuery();
                                      
                                      while(rst.next())
                                      {
                                      %>
                                
                                      <option value="<%= rst.getInt("Number")%>"><%= rst.getString("HC_Type")%></option>
                                  <% } %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Eye Brows Type *</td>
                        <td><select name="EyeBrowsType">
<%
                                     pst=con.prepareStatement("select * from eyebrows_type ;");
                                      ResultSet r = pst.executeQuery();
                                      
                                      while(r.next())
                                      {
                                      %>
                                
                                      <option value="<%= r.getInt("Number") %>"><%= r.getString("EB_Type")%></option>
                                  <% } %>                           
                            </select></td></tr>
                       <tr> <td>Eyes Type *</td>
                        <td><select name="EyesType">
                               <%
                                     pst=con.prepareStatement("select * from eyes_type;");
                                      ResultSet s = pst.executeQuery();
                                      
                                      while(s.next())
                                      {
                                      %>
                                
                                      <option value="<%= s.getInt("Number") %>"><%= s.getString("E_Type")%></option>
                                  <% } %>
                            </select></td>
                    </tr>
                     <tr>
                        <td>Teeth *</td>
                        <td><select name="Teeth">
                                
                               <% pst=con.prepareStatement("select * from teeth;");
                                      ResultSet result = pst.executeQuery();
                                      
                                      while(result.next())
                                      {
                                      %>
                                
                                      <option value="<%= result.getInt("Number") %>"><%= result.getString("T_Type")%></option>
                                  <% } %>
                            </select></td></tr>
                            <tr><td>Shape of the Face *</td>
                        <td><select name="ShapeoftheFace">
                             <% pst=con.prepareStatement("select * from shape_of_the_face;");
                                      ResultSet result1 = pst.executeQuery();
                                      
                                      while(result1.next())
                                      {
                                      %>
                                
                                      <option value="<%= result1.getInt("Number") %>"><%= result1.getString("SF_Type")%></option>
                                  <% } %>   
                            </select></td>
                    </tr>
                     <tr>
                        <td>Complexion *</td>
                        <td><select name="Complexion">
                            <% pst=con.prepareStatement("select * from complexion;");
                                      ResultSet result2 = pst.executeQuery();
                                      
                                      while(result2.next())
                                      {
                                      %>
                                
                                      <option value="<%= result2.getInt("Number") %>"><%= result2.getString("C_Type")%></option>
                                  <% } %>    
                            </select></td></tr>
                        <tr><td>Body Build *</td>
                        <td><select name="BodyBuild">
                               
                               <% pst=con.prepareStatement("select * from body_build;");
                                      ResultSet result3 = pst.executeQuery();
                                      
                                      while(result3.next())
                                      {
                                      %>
                                
                                      <option value="<%= result3.getInt("Number") %>"><%= result3.getString("BB_Type")%></option>
                                  <% } %>  
                            </select></td>
                    </tr>
                    <tr><th colspan="4"><b><font size="4"> Identification Marks</font></b></th></tr>
                     <tr>
                        <td>Identification Mark1 *</td>
                        <td>type <select name="IdentificationMark1">
                               <% pst=con.prepareStatement("select * from identification_mark;");
                                      ResultSet result4 = pst.executeQuery();
                                      
                                      while(result4.next())
                                      {
                                      %>
                                
                                      <option value="<%= result4.getInt("Number") %>"><%= result4.getString("IDM_Type")%></option>
                                  <% } %>  
                            </select></td>
                        <td>Part <select name="Part1">
                         
                         <% pst=con.prepareStatement("select * from identification_mark_part;");
                                      ResultSet result5 = pst.executeQuery();
                                      
                                      while(result5.next())
                                      {
                                      %>
                                
                                      <option value="<%= result5.getInt("Number") %>"><%= result5.getString("IDMP_Type")%></option>
                                  <% } %>  
                     </select> </td>
                        <td>Location <select name="Location1">
                         <% pst=con.prepareStatement("select * from identification_mark_location;");
                                      ResultSet result6 = pst.executeQuery();
                                      
                                      while(result6.next())
                                      {
                                      %>
                                
                                      <option value="<%= result6.getInt("Number") %>"><%= result6.getString("IDML_Type")%></option>
                                  <% } %>  
                     </select></td>
                     </tr>
                     <tr>
                        <td>Identification Mark2 *</td>
                        <td>type <select name="IdentificationMark2">
                               <% pst=con.prepareStatement("select * from identification_mark;");
                                      result4 = pst.executeQuery();
                                      
                                      while(result4.next())
                                      {
                                      %>
                                
                                      <option value="<%= result4.getInt("Number") %>"><%= result4.getString("IDM_Type")%></option>
                                  <% } %> 
                            </select></td>
                        <td>Part <select name="Part2">
                       
                         <% pst=con.prepareStatement("select * from identification_mark_part;");
                                      result5 = pst.executeQuery();
                                      
                                      while(result5.next())
                                      {
                                      %>
                                
                                      <option value="<%= result5.getInt("Number") %>"><%= result5.getString("IDMP_Type")%></option>
                                  <% } %>   
                     </select> </td>
                        <td>Location <select name="Location2">
                     <% pst=con.prepareStatement("select * from identification_mark_location;");
                                      result6 = pst.executeQuery();
                                      
                                      while(result6.next())
                                      {
                                      %>
                                
                                      <option value="<%= result6.getInt("Number") %>"><%= result6.getString("IDML_Type")%></option>
                                  <% } %>  
                     </select></td>
                     </tr>
                     <tr>
                        <td>Disabilities *</td>
                            <td>type <select name="type">
                                    <% pst=con.prepareStatement("select * from disabilities;");
                                      result1 = pst.executeQuery();
                                      
                                      while(result1.next())
                                      {
                                      %>
                                
                                      <option value="<%= result1.getInt("Number") %>"><%= result1.getString("D_Type")%></option>
                                  <% } %>  
                                </select></td>
                    </tr>
                     <tr>
                        <td>If other</td>
                        <td><textarea name="ifother" maxlength="100" rows="3" cols="33">
                            </textarea></td>
                        <td>Weight *</td>
                        <td><input type="number" maxlength="2" name="weight"/>kg</td>
                    </tr>
                     <tr>
                        <td>Height *</td>
                        <td>
                            <br>
                            <br><select name="Feet" required>
                               
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                            </select> Feet & <select name="inches">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option> Inches
                    </tr>
                     <tr>
                        <td>Mentally Challenged *</td>
                        <td><input type="radio" name="mental" value="Yes"/>Yes</td>
                        <td><input type="radio" name="mental"value="No"/>No</td>
                    </tr>
            </tbody>
        </table>
                  <%
                     /*
                             String page1=null;
                     Enumeration<String>names=request.getParameterNames();
                      while(names.hasMoreElements())
                      {
                        String name=names.nextElement();
                        String value=request.getParameter(name);
                        page1+=name+"="+value+"$";
                      }
                      if(page1.length()>0)
                          page1=page1.substring(1,page1.length()-1);*/
                 
                  %>
                 <!--<input type="hidden" name="page1" value=>-->
                <center><input type="submit" value="Next" /></center>
        </form>
                 
        &nbsp&nbsp&nbsp
    </body>
</html>
