package kit;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class search_phar
 */
@WebServlet("/search_phar")
public class search_phar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search_phar() {
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
		
		try{ 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","cse","sgp");
			 Statement st=con.createStatement();
			 
			 String roll_no=request.getParameter("rno");
			 
			 String sqlQuery="select d.license_no, d.name.fname , d.name.mname , d.name.lname , d.gender, d.phone, d.address.street , d.address.city , d.address.pincode , d.email, d.pass from pharms d where license_no = "+roll_no+"" ;
			 
			 
			 ResultSet rs=st.executeQuery(sqlQuery);
			
			 int flag=0;
			 
			 while(rs.next())
			 {
				 flag=1;
				 pw.println("<br>  "+rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+" "+rs.getString(8)+" "+rs.getString(9)+" "+rs.getString(10)+" "+rs.getString(11));
			 }
			 
			 if(flag==0)
			 {
				 pw.println("Data not found for roll number = "+roll_no);
			 }
			
			
				st.close();
				con.close();
		}
		
		catch(Exception e){ System.out.println(e);}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
