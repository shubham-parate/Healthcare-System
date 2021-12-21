<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient</title>
</head>
<body>
<%
PrintWriter pw = response.getWriter();
pw.println("<h1>Wel-Come to Healthcare System</h1><br><hr>");

String  user_first, user_middle,user_last,user_gender,user_mobile,user_add1,user_add2,user_add3,user_email,user_pass;

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
	 
	
	
	 int i=st.executeUpdate("insert into patient values(Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"',Address('"+user_add1+"','"+user_add2+"','"+user_add3+"'),'"+user_email+"','"+user_pass+"')");
	 
	 
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
	<form action="pat_reg" method="post">  
  <div class="container">  
  <center>  <h1> Take Appointment</h1> </center>  
  <hr>  

  <label> Firstname </label>   
<input type="text" name="firstname" placeholder= "Firstname"  required />   <br><br>
<label> Middlename: </label>   
<input type="text" name="middlename" placeholder="Middlename"  required />   <br><br>
<label> Lastname: </label>    
<input type="text" name="lastname" placeholder="Lastname" required />   <br><br>
 
<div>  
<label>   
Gender :  
</label><br>  
<input type="radio" value="Male" name="gender" checked > Male   
<input type="radio" value="Female" name="gender"> Female   
<input type="radio" value="Other" name="gender"> Transgender  
  
</div>  
<label>   <br><br>
Phone :  
</label>  
  <input type="text" name="phone" placeholder="phone no." required>   <br><br>

 <label for="email"><b>Email</b></label>  
 <input type="text" placeholder="Enter Email" name="email" required>  <br><br>
  
    <label for="psw"><b>Doctor Name</b></label>  
    <input type="text" placeholder="Name" name="psw" required>  <br><br>
  
    <label for="psw-repeat"><b>Date</b></label>  
    <input type="text" placeholder="Date" name="date" required>  <br><br>
    
     <label for="psw-repeat"><b>Time</b></label>  
    <input type="text" placeholder="Time" name="time" required>  <br><br>
    
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