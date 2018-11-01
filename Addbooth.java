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
 * Servlet implementation class Addbooth
 */
@WebServlet("/Addbooth")
public class Addbooth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addbooth() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String loc=request.getParameter("loc");
		String code=request.getParameter("code");
		String cross=request.getParameter("cross");
		String incharge=request.getParameter("incharge");
		
		PrintWriter out=response.getWriter();
		response.setContentType("Text/html");
		try
		{
			
			Connection con=getdb.getConnection();//cONNECTION IS A class
		//	stmt=(Statement) conn.createStatement();
			//PreparedStatement ps=con.prepareStatement("select * from LIBRARY");
			PreparedStatement ps1=con.prepareStatement("insert into booth(location,pin,crossing,incharge) values(?,?,?,?)");
			//ResultSet rs=ps.executeQuery();
			ps1.setString(1,loc);
			ps1.setString(2,code);
			ps1.setString(3,cross);
			ps1.setString(4,incharge);
			
			int i= ps1.executeUpdate();
			
			if(i>0)
			{
			
			
			response.sendRedirect("Index1.jsp");
			}
			else{
				//response.sendRedirect("Addoffence.java");
				out.print("New Booth not added");
				out.print("<body><p><a href='Addbooth.jsp'>please try again</a></p></body>");
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
