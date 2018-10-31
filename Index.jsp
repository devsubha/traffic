<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pondicherry Traffic Police Web Application</title>
        <!-- Main CSS --> 
        <link rel="stylesheet" href="cssadmin/style.css">
	    <style type="text/css">
		table {width:40%;padding:15px;}
		tr {background-color:#aeb1b7;border-width:1px;padding:5px;}
		th {background-color:#ffffff;border-width: 2px; height-50px;padding:5px;}
		td{border-width: 2px;border-color: solid black;padding:5px;}
		tr:nth-child(odd) {background-color: #f2f2f2;}
		tr:hover{background-color: #ffffff;}
		#iq {color : #e68a00;font-weight:bold;}
		</style>
        <!-- Font Awesome -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
</head>
<body>
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
              <!--  <a href="#"> <img class="logo-img" src="images/ppolice.jpg" width="70" height="60" ALT="align box"></a> --> 
                <a class="navbar-brand" href="#"><span>PTP</span>WebApp</a>

                <!-- Mobile menu toggle -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Main navigation items -->
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav mr-auto justify-content-end">
                    	 <li class="nav-item active">
                                <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link" href="index.html"><% out.print("hello! "); %><span id="iq"><% out.print(s); %></span> <span class="sr-only">(current)</span></a>
                        </li>

                       <!--  <li class="nav-item dropdown active">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Offences</a>
                                     <div class="dropdown-menu navbar-dark bg-primary">
                                          <a class="dropdown-item" href="#">Accident</a>
                                          <a class="dropdown-item" href="#">Over Speed</a>
                                          <a class="dropdown-item" href="#">Triples</a>
                                          <a class="dropdown-item" href="#l">Wrong Parking</a>
                                          <a class="dropdown-item" href="#">Stop Line Voilation</a>
                                          <a class="dropdown-item" href="#">Hindrance to traffic flow</a>
                                          <a class="dropdown-item" href="#">Use of Mobile Phone</a>
                                          <a class="dropdown-item" href="#">Number Plate Missing</a>
                                          <a class="dropdown-item" href="#">Number Plate Mislead</a>
                                    </div>
                        </li>-->
                       

                        <li class="nav-item">
                                <a class="nav-link" href="#">Higher Authorities</a>
                        </li>

                        <li class="nav-item">
                                <a class="nav-link" href="#">Job Assing</a>
                        </li>
                        
                       <!--   <li class="nav-item">
                                <a class="nav-link" href="IndexVTamil.jsp">தமிழ்</a>
                        </li>-->

                        <li class="nav-item">
                                <a class="nav-link" href="#">Logout</a>
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
                   <!-- <center><img src="images/ppolice.jpg"></center>-->
                </div>
            </div>
        </div>

        <!-- Main content area -->
        <%@ page import="java.sql.*,dbconnection.getdb" %><!--to importing pakage its a descriptive tag -->
 <%try
	{
		
		Connection con=getdb.getConnection();//cONNECTION IS A class
		PreparedStatement ps=con.prepareStatement("select * from OFFENCE");
		//PreparedStatement ps1=con.prepareStatement("insert into LIBRARY('SERIALID','NAME','AGE')values('101','sam','45')");
		ResultSet rs=ps.executeQuery();
		//ResultSet rs1=ps1.executeUpdate();
	%>
	<div class="container">
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
		</div>
	<% }
	catch(Exception e)
	{
		out.print(e);
	} %>
        <div class="card-container">
            <div class="container">
					



               <!--   <div class="padded-box row">
                    <div class="col-md-4">
                        <div class="card text-center">
                          <!--<img class="card-img-top" src="images/111354-car-accidents.png" alt="Card image cap">
                          <div class="card-body">
                           <!--  <p class="card-text">Profile</p> -->
                           <!--   <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                           	<p class="card-text">Profile</p>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Click here</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                          <!--<img class="card-img-top" src="images/pic2.jpg" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">Higher Authorities</p>
                             
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Click here</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                         <!-- <img class="card-img-top" src="images/pic3.jpg" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">Job Assing</p>
                             
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Click here</a>
                          </div>
                        </div>
                    </div>
                </div>
                                
                <div class="padded-box row">
                    <div class="col-md-4">
                        <div class="card text-center">
                         <!-- <img class="card-img-top" src="images/111063-signals-set-s.png" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">WRONG PARKING</p>
                            <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                         <!-- <img class="card-img-top" src="images/111063-signals-set-P.png" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">STOP LINE VIOLATION</p>
                             <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                        <!--  <img class="card-img-top" src="images/111298-poi-public-places-light.png" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">HINDRANCE OF TRAFFIC FLOW</p>
                             <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>
                </div>
                
                <div class="padded-box row">
                    <div class="col-md-4">
                        <div class="card text-center">
                        <!--  <img class="card-img-top" src="images/479565035-1024x1024.jpg" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">USE OF MOBILE PHONE</p>
                            <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                        <!--  <img class="card-img-top" src="images/pic2.jpg" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">NUMBER PLATE MISSING</p>
                             <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card text-center">
                        <!--  <img class="card-img-top" src="images/pic3.jpg" alt="Card image cap">
                          <div class="card-body">
                            <p class="card-text">NUMBER PLATE TAMPERING</p>
                             <a href="SearchOffender.jsp" class="btn btn-primary">Check Past Cases</a>
                              <a href="OnlineChallan.jsp" class="btn btn-secondary">Generate Online Challan</a>
                          </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>    
        
        <!-- Footer -->
        <footer class="footer">
            <div class="footer-lists">
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <ul>
                                <li><h4>Proin accumsan</h4></li>
                                <li><a href="#">Rutrum nulla a ultrices</a></li>
                                <li><a href="#">Blandit elementum</a></li>
                                <li><a href="#">Proin placerat accumsan</a></li>
                                <li><a href="#">Morbi hendrerit libero </a></li>
                                <li><a href="#">Curabitur sit amet tellus</a></li>
                            </ul>
                        </div>
                        <div class="col-sm">
                            <ul>
                                <li><h4>Condimentum</h4></li>
                                <li><a href="#">Curabitur sit amet tellus</a></li>
                                <li><a href="#">Morbi hendrerit libero </a></li>
                                <li><a href="#">Proin placerat accumsan</a></li>
                                <li><a href="#">Rutrum nulla a ultrices</a></li>
                                <li><a href="#">Cras dictum</a></li>
                            </ul>
                        </div>   
                        <div class="col-sm">
                            <ul>
                                <li><h4>Suspendisse</h4></li>
                                <li><a href="#">Morbi hendrerit libero </a></li>
                                <li><a href="#">Proin placerat accumsan</a></li>
                                <li><a href="#">Rutrum nulla a ultrices</a></li>
                                <li><a href="#">Curabitur sit amet tellus</a></li>
                                <li><a href="#">Donec in ligula nisl.</a></li>
                            </ul>
                        </div>
                        <div class="col-sm">
                            <h4>Suspendisse</h4>
                            <p>Integer mattis blandit turpis, quis rutrum est. Maecenas quis arcu vel felis lobortis iaculis fringilla at ligula. Nunc dignissim porttitor dolor eget porta.</p>

                            <p class="social-icons">
                                <a href="#"><i class="fa fa-facebook fa-2x"></i></a>
                                <a href="#"><i class="fa fa-twitter fa-2x"></i></a>
                                <a href="#"><i class="fa fa-youtube fa-2x"></i></a>
                                <a href="#"><i class="fa fa-instagram fa-2x"></i></a>
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
        <script src="js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

    </body>
</html>