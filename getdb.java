package dbconnection;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

public class getdb {
	 
	static Connection con=null;
	static String driver="com.ibm.db2.jcc.DB2Driver";
	static String url="jdbc:db2://localhost:50000/TRAFFIC";
	static String user="db2admin";
	static String pass="tiger";
	
	public static Connection getConnection()
	{
		try
		{
			Class.forName(driver);
			con=DriverManager.getConnection(url,user,pass);
			
		}
		catch(Exception e)
		{
			
		
		}
		return con;
	}
}
