<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/new_user_1.css" rel="stylesheet">
<style>

body {
	background-image: url("images/image1.jpg");
	background-repeat: no repeat;
	background-size: cover;
}
</style>
</head>
<body>

	<div class="topheaderbar"></div>

	<jsp:include page="header.jsp">
		<jsp:param name="header" value="topbar" />
	</jsp:include>
	
	<form class ="form" action ="addnewuser" method ="post">
	<div class ="form-head">
	<h2> New User Registration</h2>
	</div>
	
	<div class ="input-box">
	<label><b>First Name:</b></label>
	<input type ="text"  name ="firstname" required/>
	
	<label ><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name:</b></label>
	<input type ="text"  name ="lastname" required/>
	</div>
	
	<div class="input-box">
			
			 <label><b>Email: </b></label> <input type="email" name ="email" required />
		</div>

		<div class="input-box">
			<label><b>Password:</b></label> <input type="password"
			name ="password" required />
	
	</div>
	
	<div  class ="error" id ="messages">
	${errormsg}
	</div>
	
	<div>
	<input type= "submit" class ="btn" value ="Register"/>
	</div>
	
	</form>
	
	
	
	
	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>
	
	
	
	
	
	
	
</body>
</html>