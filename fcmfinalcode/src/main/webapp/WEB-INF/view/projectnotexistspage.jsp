<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/projectpage.css" rel="stylesheet">
<link href="css/navbar.css" rel="stylesheet">
<link href="css/projectnotexistspage.css" rel="stylesheet">
<link href ="css/databasepagestyle.css" rel="stylesheet">
<script src ="webjars/jquery/2.1.1/jquery.min.js"></script>	
<script src ="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <link  rel="stylesheet"
	href="webjars/font-awesome/5.15.4/css/all.min.css">  
<script src ="js/database_validation.js"></script>
<style>

.content{
display:block;
}
.errormsg{
	padding-top:18px;
	color:red;
	margin-left:150px;
	font-size:16px;
	
}
.databaseimage{
left:1050px;
}

.explorerHeading{
margin-left:20px;
}
.moduletable2 td input[type=checkbox]{
    width:16px;
	margin-left :12px;
}
.openedaddmodule{
margin-top:24px;
}
.content{
	
	margin-top:10px;
	margin-left:30%;
	margin-bottom:10%;
	margin-right:10%;
	height:70vh;
	border-style:groove;

   
}

.copyright{
padding:10px;
}
.logo{
margin-left:-85px;
margin-bottom:0;
}
.logo  img{
	
	margin-left:90px;

}
.navbar{
background:#000040;
}
.heading{

margin-left:-80px;
font-size:26px;

}
.logbtn a{

padding:6px 20px;
}
.addmodulesforopenedproject {
	margin-top:-4%;
}
.table_modulesforopenproject{
	margin-top:12.5%;
}

.projectname{

top:280px;
height:300px;
width:301px;
bottom:0;
}


</style>


</head>
<body>

<div class="topheaderbar">
		
	
	
		</div>

		

<nav class="navbar">
			<div class ="logo">
  <img src ="images/logo1.PNG" alt="Cognizantlogo" width="220" height="42">
  </div>

			<div class="heading">FCM DATA MIGRATION</div>
			<div class="logbtn">
				<a href="/redirect">LogOut</a>
			</div>

		</nav>

 

		<div class="content" id="newprojectpage">

			<h1 class="popheading">Create New Project</h1>

			<br> <br>
			<form  action ="saveproject" method ="POST">
				<br> 
				<label><b>Project Name:</b></label> 
				<input type="text"name="projectname" id="txt">
				<button  type="submit" class="createbtn" >Create</button> 
				
			
			</form>
		
			<div class ="errormsg" id ="errorname">
		${errormsg}
		${errormsg1}
			</div>
		</div>
		
		
		
 	
		
	
		<div class="sidebar" id="sidebar1">
			

			<nav>
				<ul>
					<li>Project 
					
						<ul class="submenu" id="submenu1">
							<li><a href="#" onclick="popUp()">New Project</a></li>

							<li><a href="#" onclick ="open_projectpage()">Open Project</a></li>
						</ul></li>
						
						
				</ul>


			</nav>
		</div>
		<div class = "projectname" >
		<p class="explorerHeading">project Explorer</p>
		
		
	
	</div>	
	
	
	


	
		<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
		
		
	</jsp:include>
		
<script  type ="text/javascript" >



const projectpage = document.getElementById('newprojectpage');



function popUp(){
	
	
	projectpage.style.display="block";
	
}
 

</script>


</body>
</html>

