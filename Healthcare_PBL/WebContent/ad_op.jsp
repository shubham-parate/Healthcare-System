<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
	
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
	 
	 int i=st.executeUpdate("insert into admins values('"+user_id+"',Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"',Address('"+user_add1+"','"+user_add2+"','"+user_add3+"'),'"+user_email+"','"+user_pass+"')");
	 
	 
	 
	 
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
			<form action="search_dr" method="post">
				<br>Search Doctor:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Search" >				
			</form>
			<form action="search_labt" method="post">
				<br>Search Lab Technician:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Search" >				
			</form>
			<form action="search_phar" method="post">
				<br>Search Pharmacist:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Search" >				
			</form>
			<form action="search_pat" method="post">
				<br>Search Patient:<br>
				<br>Enter ID:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Search" >				
			</form>
			<form action="delete_dr" method="post">
				<br>Delete Doctor:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Delete" >				
			</form>
			<form action="delete_labt" method="post">
				<br>Delete Lab Technician:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Delete" >				
			</form>
			<form action="delete_phar" method="post">
				<br>Delete Pharmacist:<br>
				<br>Enter License No:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Delete" >				
			</form>
			<form action="delete_pat" method="post">
				<br>Delete Patient:<br>
				<br>Enter Id:<br>
				<input type="text" name="rno" >				
				<input type="submit" value="Delete" >				
			</form>
		<h3>To get All Doctor Information <a href="show_dr">Click Here</a></h3>
		<h3>To get All Patient Information <a href="show_pat">Click Here</a> </h3>
		<h3>To get All Lab Technician Information <a href="show_labt">Click Here</a></h3>
		<h3>To get All Pharmacist Information <a href="show_phar">Click Here</a></h3>
	
	<%
		st.close();
		con.close();
}

catch(Exception e){ pw.println("Error Occured!!!");} 
%>

			
			
			
			
		
</body>
</html>