<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor</title>
</head>
<body>
<%
PrintWriter pw = response.getWriter();
pw.println("<h1>Wel-Come to Healthcare System</h1><br><hr>");

String user_id, user_first, user_middle,user_last,user_gender,user_mobile,user_add1,user_add2,user_add3,user_email,user_pass;
user_id = request.getParameter("ad_id");
user_first = request.getParameter("firstname");
user_middle = request.getParameter("middlename");
user_last = request.getParameter("lastname");
user_gender = request.getParameter("gender");
user_mobile = request.getParameter("phone");
user_add1 = request.getParameter("street");
user_add2 = request.getParameter("city");
user_add3 = request.getParameter("pincode");
user_email = request.getParameter("email");
user_pass = request.getParameter("psw");

try{ 
	
	
	
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
	 Statement st=con.createStatement();
	 
	
	
	 int i=st.executeUpdate("insert into doctors values('"+user_id+"',Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"',Address('"+user_add1+"','"+user_add2+"','"+user_add3+"'),'"+user_email+"','"+user_pass+"')");
	 
	 
	//pw.println("<h2>Inserted rows are="+i);
	
                                                                                                      
	if(i==1)
	{
		pw.println("\n<h2>You have Successfully Register");
	}
	else
	{
		pw.println("Your Data is not Inserted");
	}
	%>
	<hr>
			
			<h3>Show Appointment<a href="view_appo">Click Here</a> </h3>
		


	<hr>
	<form action="dr_op_lab.jsp" method="post">  
  <div class="container">  
  <center>  <h1>Add Prescription </h1> </center>  
  <hr>  
  <label> Patient ID </label>
<input type="text" name="ad_id" placeholder= "Patient ID" required /><br> <br>
  <label> Firstname </label>   
<input type="text" name="firstname" placeholder= "Firstname"  required />   <br> <br>
<label> Middlename: </label>   
<input type="text" name="middlename" placeholder="Middlename"  required />   <br> <br>
<label> Lastname: </label>    
<input type="text" name="lastname" placeholder="Lastname" required />   <br> <br>
<label> Patient Age: </label> 
<input type="text" name="age" placeholder="Age"  required />   <br> <br>
<label> Add Description: </label>    
<textarea  placeholder="Enter Here...." value="Prescription" name="prescription"required>  
</textarea> <br> <br>
<label> Date: </label> 
<input type="text" name="date" placeholder="Date"  required />  <br> <br>
<label> Time: </label>  
<input type="text" name="time" placeholder="Time"  required />  <br> <br>
    <button type="submit" class="registerbtn">Submit</button>    
</form>  
 
	<%
	
		st.close();
		con.close();
}
catch(Exception e){ pw.println("Error Occured!!!");} 
%>





</body>
</html>