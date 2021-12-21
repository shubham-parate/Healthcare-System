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
 * Servlet implementation class dr_pres
 */
@WebServlet("/dr_pres")
public class dr_pres extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dr_pres() {
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
		
		String user_id, user_first, user_middle,user_last,user_age,user_prescription,user_date,user_time;
		user_id = request.getParameter("ad_id");
		user_first = request.getParameter("firstname");
		user_middle = request.getParameter("middlename");
		user_last = request.getParameter("lastname");
		user_age = request.getParameter("age");
		user_prescription = request.getParameter("prescription");
		user_date = request.getParameter("date");
		user_time = request.getParameter("time");
	
		
		try{ 
			
			
			
			 Class.forName("oracle.jdbc.driver.OracleDriver");
			 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
			 Statement st=con.createStatement();
			 
			
			
			 int i=st.executeUpdate("insert into labtest values('"+user_id+"',Fullname('"+user_first+"','"+user_middle+"','"+user_last+"'),'"+user_age+"','"+user_prescription+"','"+user_date+"','"+user_time+"')");
			 
			 
			//pw.println("<h2>Inserted rows are="+i);
			
	                                                                                                          
			if(i==1)
			{
				pw.println("\n<h2>You have successfully entered test");
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
