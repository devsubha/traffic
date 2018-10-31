<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pondicherry Traffic Police Web Application</title>
 <!-- Main CSS --> 
        <link rel="stylesheet" href="cssadmin/style.css">
		<style type="text/css">
		table {width:90px;padding:15px;font-size:12px;}
		tr {background-color:#aeb1b7;border-width:1px;padding:5px;}
		th {background-color:#ffffff;border-width: 2px; height:50px;padding:5px;}
		td{border-width: 2px;border-color: solid black;padding:5px;}
		tr:nth-child(odd) {background-color: #f2f2f2;}
		tr:hover{background-color: #ffffff;}
		#iq {color : #e68a00;font-weight:bold;}
		</style>
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
</head>
<body>
<body class="mt-0">
<% HttpSession ses=request.getSession(false);
String s=(String)ses.getAttribute("name");
if(s==null)
{
		response.sendRedirect("login.html");	
}
%>

        <!-- Main navigation -->
        <nav class="navbar navbar-expand-md fixed-top navbar-dark bg-primary">
            <div class="container">
                
                <!-- Company name shown on mobile -->
                <a href="#"> <img class="logo-img" src="1200px-Emblem_of_India.svg.png" width="50" height="60"></a>
                <a class="navbar-brand" href="#"><span>PTP</span>WebApp</a>

                <!-- Mobile menu toggle -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main navigation items -->
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mr-auto justify-content-end">
                        <li class="nav-item active">
                                <a class="nav-link" href="Index1.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>

                      <!--    <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Offences</a>
                                    <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href="examples.html">Accident</a>
                                          <a class="dropdown-item" href="three-column.html">Over Speed</a>
                                          <a class="dropdown-item" href="one-column.html">Triples</a>
                                          <a class="dropdown-item"  href="text.html">Wrong Parking</a>
                                          <a class="dropdown-item" href="examples.html">Stop Line Voilation</a>
                                          <a class="dropdown-item"  href="text.html">Hindrance to traffic flow</a>
                                          <a class="dropdown-item" href="three-column.html">Use of Mobile Phone</a>
                                          <a class="dropdown-item" href="one-column.html">Number Plate Missing</a>
                                          <a class="dropdown-item"  href="text.html">Number Plate Mislead</a>
                                    </div>
                         </li>-->
                        <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><% out.print("hello! "); %><span id="iq"><% out.print(s); %></span> <span class="sr-only">(current)</span></a>
                       			<div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href="Profile.jsp">Profile</a>
                                          <a class="dropdown-item" href="sessiondes.jsp">Logout</a>
                                </div>
                        </li>
                        

                        <li class="nav-item">
                                <a class="nav-link" href="SearchOffender.jsp">Search</a>
                        </li>

						<li class="nav-item">
                                <a class="nav-link" href="AddOffence.jsp"><span id="iq">+</span>Offence</a>
                        </li>
                        
                        <li class="nav-item">
                                <a class="nav-link" href="Addbooth.jsp"><span id="iq">+</span>Traffic Circle</a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>


        <!-- Jumbtron / Slider -->
        <div class="jumbotron-wrap">
            <div class="container">
                <div class="jumbotron jumbotron-narrow">
                    <center><h1 class="text-center">Pondicherry Traffic Police</h1></center>
                   <!--<center><img src="images/ppolice.jpg"></center>-->
                </div>
            </div>
        </div>

        <!-- Main content area -->
        <main class="container">
            <div class="row">

                
                <!-- Main content -->
                <div class="col-sm-8">
                    
                    <article>
                    <%@ page import="java.sql.*,dbconnection.getdb" %><!--to importing pakage its a descriptive tag -->
 <%try
	{
		
		Connection con=getdb.getConnection();//cONNECTION IS A class
		PreparedStatement ps=con.prepareStatement("select * from OFFENCE order by OFFENCE_DATE asc");
		
		ResultSet rs=ps.executeQuery();
		
	%>
                    <div class="table-responsive">
                   
                        <table class="table">
                             <tr>
		<th>OFFENCE ID</th>
		<th>OFFENCE DATE</th>
		<th>OFFENCE LOCATION</th>
		<th>OFFENCE TYPE</th>
		<th>OFFENCE DETAILS</th>
		<th>FINE AMT</th>
		<th>PAY STATUS</th>
		<th>OFFENCE ISSUER</th>
		<th>DRIVER NAME</th>
		<th>DRIVER MOBILE</th>
			</tr>
                            <%while(rs.next())
		{%>
			<tr><td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><%=rs.getString(8) %></td>
			<td><%=rs.getString(9) %></td>
			<td><%=rs.getString(10) %></td>
			</tr>
		<% }%>
		
	
                        </table>
                        </div>
                        
                       <% }
	catch(Exception e)
	{
		out.print(e);
	} %>
                        
                    </article>
                       
                </div>

            </div> 
        </main>


        <!-- Footer -->
        <footer class="footer">
            <div class="footer-lists">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <ul>
                                <li><h4>Important Links</h4></li>
                                <li><a href="http://www.police.puducherry.gov.in/">Puducherry Police</a></li>
                                <li><a href="http://law.puducherry.gov.in/index.htm">Puducherry Law Department</a></li>
                                <li><a href="https://www.py.gov.in/">Government of Puducherry</a></li>
                                <li><a href="https://parivahan.gov.in/parivahan/">Vahan </a></li>
                            </ul>
                        </div>
                        <div class="col-sm">
                            <ul>
                                <li><h4>Puducherry Police Units</h4></li>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Search</a></li>
                                <li><a href="#">+Offence</a></li>
                                <li><a href="#">+Traffic Circle</a></li>
                                <li><a href="http://www.police.puducherry.gov.in/Traffic/Traffic%20Awareness%20Videos.htm">Traffic Awareness Videos </a></li>
                                <li><a href="http://www.police.puducherry.gov.in/Photo%20gallery.htm">Gallery</a></li>
                                <!--<li><a href="#">Rutrum nulla a ultrices</a></li>-->
                            </ul>
                        </div>
                        <div class="col-sm">
                            <h4>About the Portal</h4>
                            <p>This is the official website of Traffic Police of Puducherry.
Portal contents are owned by Departments and updated by , , Puducherry, India.
This portal also links to other websites owned by respective Departments/Organisations/Institutions etc. 
Traffic Related Complaints : 1073</p>

                            <p class="social-icons">
                                <a href="https://www.facebook.com/Traffic-Police-Puducherry-807682155921358/"><i class="fa fa-facebook fa-2x"></i></a>
                                <a href="https://twitter.com/PuducheryPolice"><i class="fa fa-twitter fa-2x"></i></a>
                                <a href="https://www.youtube.com/user/PondicherryPolice/videos?view=0&shelf_id=0&sort=dd"><i class="fa fa-youtube fa-2x"></i></a>
                                <!-- a href="#"><i class="fa fa-instagram fa-2x"></i></a>-->
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="footer-bottom">
                    <p class="text-center"><a href="#">Back to top</a></p>
            </div>
            
        </footer>

        <!-- Bootcamp JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    </body>
</body>
</html>