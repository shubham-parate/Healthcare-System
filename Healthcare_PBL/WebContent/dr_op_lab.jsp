<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
PrintWriter pw = response.getWriter();
pw.println("<h1>Wel-Come to Healthcare System</h1><br><hr>");

String user_id, user_first, user_middle,user_last,user_gender,user_mobile,user_email,user_pass;
user_id = request.getParameter("ad_id");
user_first = request.getParameter("firstname");
user_middle = request.getParameter("middlename");
user_last = request.getParameter("lastname");
user_gender = request.getParameter("age");
user_mobile = request.getParameter("prescription");
user_email = request.getParameter("date");
user_pass = request.getParameter("time");

try{ 
	
	
	
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
	 Statement st=con.createStatement();
	 
	
	
	 int i=st.executeUpdate("insert into pres values('"+user_id+"',Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"','"+user_email+"','"+user_pass+"')");
	 
	 
	//pw.println("<h2>Inserted rows are="+i);
	
                                                                                                      
	if(i==1)
	{
		pw.println("\n<h2>You have successfully entered prescription");
	}
	else
	{
		pw.println("Your Data is not Inserted");
	}
	%>
	<hr>
	<form action="dr_pres" method="post">  
  <div class="container">  
  <center>  <h1>Add Lab Test </h1> </center>  
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
<label> Add Test: </label>    
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