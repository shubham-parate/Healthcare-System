package kit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pat_reg
 */
@WebServlet("/pat_reg")
public class pat_reg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pat_reg() {
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
		
		String  user_first, user_middle,user_last,user_gender,user_mobile,user_add,user_email,user_pass,user_date,user_time;
		
		user_first = request.getParameter("firstname");
		user_middle = request.getParameter("middlename");
		user_last = request.getParameter("lastname");
		user_gender = request.getParameter("gender");
		user_mobile = request.getParameter("phone");
		user_email = request.getParameter("email");
		user_pass = request.getParameter("psw");
		user_date = request.getParameter("date");
		user_time = request.getParameter("time");
		try{ 
			
			
			
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
			 Statement st=con.createStatement();
			 
			
			
			 int i=st.executeUpdate("insert into appointment values(Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_gender+"','"+user_mobile+"','"+user_email+"','"+user_pass+"','"+user_date+"','"+user_time+"')");
			 
			 
			//pw.println("<h2>Inserted rows are="+i);
			
	                                                                                                          
			if(i==1)
			{
				pw.println("\n<h2>You have successfully apply for appointment");
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
