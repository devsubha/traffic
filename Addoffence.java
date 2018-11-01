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
 * Servlet implementation class Addoffence
 */
@WebServlet("/Addoffence")
public class Addoffence extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addoffence() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String oid=request.getParameter("id");
		String otype=request.getParameter("otype");
		String odetails=request.getParameter("odetails");
		String ofineamt=request.getParameter("ofineamt");
		String orepeatamt=request.getParameter("orepeatamt");
		PrintWriter out=response.getWriter();
		response.setContentType("Text/html");
		try
		{
			
			Connection con=getdb.getConnection();//cONNECTION IS A class
		//	stmt=(Statement) conn.createStatement();
			//PreparedStatement ps=con.prepareStatement("select * from LIBRARY");
			PreparedStatement ps1=con.prepareStatement("insert into addoffence(id,offencetype,details,fineamt,repeatamt) values(?,?,?,?,?)");
			//ResultSet rs=ps.executeQuery();
			ps1.setString(1,oid);
			ps1.setString(2,otype);
			ps1.setString(3,odetails);
			ps1.setString(4,ofineamt);
			ps1.setString(5,orepeatamt);
			int i= ps1.executeUpdate();
			
			if(i>0)
			{
			
			
			response.sendRedirect("Index1.jsp");
			}
			else{
				response.sendRedirect("Addoffence.java");
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
