package kit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.io.*;
/**
 * Servlet implementation class ad_reg
 */
@WebServlet("/ad_reg")
public class ad_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ad_reg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		PrintWriter pw = response.getWriter();
		pw.println("<h1>Wel-Come to Healthcare System</h1><br><hr>");
		
		String user_id, user_first, user_middle,user_last,user_gender,user_mobile;
		user_id = request.getParameter("ad_id");
		user_first = request.getParameter("firstname");
		user_middle = request.getParameter("age");
		user_last = request.getParameter("prescription");
		user_gender = request.getParameter("date");
		user_mobile = request.getParameter("time");
	
		
		try{ 
			
			
			
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
			 Statement st=con.createStatement();
			 
			
			
			 int i=st.executeUpdate("insert into pres values('"+user_id+"',Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"',)");
			 
			 
			//pw.println("<h2>Inserted rows are="+i);
			
	                                                                                                          
			if(i==1)
			{
				pw.println("\n<h2>You have Successfully Register");
				
			}
			else
			{
				pw.println("Your Data is not Inserted");
			}
			
			
			
				st.close();
				con.close();
		}
		
		catch(Exception e){ pw.println("Error Occured!!!");} 
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
