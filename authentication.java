package trafficmanagement;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconnection.getdb;

/**
 * Servlet implementation class authentication
 */
@WebServlet("/authentication")
public class authentication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public authentication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		response.setContentType("Text/html");
		String user=request.getParameter("user");
		String pass=request.getParameter("pass");
		String usr=null;
		String pass1=null;
		String name=null;
		//String empid=null;
		try
		{
			
			Connection con=getdb.getConnection();//cONNECTION IS A class
			PreparedStatement ps=con.prepareStatement("select NAME,ID,PASSWORD from SUPERVISORREG where ID=? and PASSWORD=?");
			
			ps.setString(1,user);
			ps.setString(2,pass);
			
			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				//out.print(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3));
				 name=rs.getString(1);
				 usr=rs.getString(2);
				 pass1=rs.getString(3);
				 
			}
			
			if(user.equals(usr) && pass.equals(pass1))
			{
				HttpSession sess= request.getSession();
				sess.setAttribute("username",usr);
				sess.setAttribute("password",pass1);
				sess.setAttribute("name",name);
				//sess.setAttribute("name",name);
				//sess.invalidate();
				//	sess.wait(5000000);
				//out.print("you are authenticate");
				response.sendRedirect("Index1.jsp");
			}
			else
			{
				//out.print("you are not authenticate");
				//out.print("<body><p><a href='login.html'>please try again</a></p></body>");
				response.sendRedirect("login.html");
			}
		}
		catch(Exception e)
		{
			out.print(e);
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
