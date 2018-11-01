package trafficmanagement;

import java.beans.Statement;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbconnection.getdb;
/**
 * Servlet implementation class SuperVisorReg
 */
@WebServlet("/SuperVisorReg")
public class SuperVisorReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuperVisorReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("name");
		String eid=request.getParameter("eid");
		String mobile=request.getParameter("mobile");
		String email=request.getParameter("email");
		String pswrd=request.getParameter("pass");
		PrintWriter out=response.getWriter();
		response.setContentType("Text/html");
		
		try
		{
			
			Connection con=getdb.getConnection();//cONNECTION IS A class
		//	stmt=(Statement) conn.createStatement();
			//PreparedStatement ps=con.prepareStatement("select * from LIBRARY");
			PreparedStatement ps1=con.prepareStatement("insert into supervisorreg(name,id,mobile,email,password) values(?,?,?,?,?)");
			//ResultSet rs=ps.executeQuery();
			ps1.setString(1,name);
			ps1.setString(2,eid);
			ps1.setString(3,mobile);
			ps1.setString(4,email);
			ps1.setString(5,pswrd);
			int i= ps1.executeUpdate();
			
			if(i>0)
			{
			
			/*out.print("inserted data");
			out.print("<body><iframe onload='myFunction()'></iframe></body>");
			out.print("	<script>"
					+ "function myFunction() {var txt;"
					+ "if (confirm('Press a button!')) {alert(location.hostname);} else { txt = 'You pressed Cancel!';}"
							+ "document.getElementById('demo').innerHTML = txt;}"
									+ "</script>");*/
			response.sendRedirect("login.html");
			}
			else{
				response.sendRedirect("Reg.html");
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
