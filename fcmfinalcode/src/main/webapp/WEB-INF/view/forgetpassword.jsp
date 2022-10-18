<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/forgot_password_1.css" rel="stylesheet">

 

  <link  rel="stylesheet"
	href="webjars/font-awesome/5.15.4/css/all.min.css">  
	<script src ="js/forgetpasswordtoggle.js"></script>


<style>
body {
	background-image: url("images/image1.jpg");
	background-repeat: no repeat;
	background-size: cover;
}

</style>	
</head>

<body>
	<div>
		<div class="topheaderbar"></div>

		<jsp:include page="header.jsp">
			<jsp:param name="header" value="topbar" />
		</jsp:include>
		
		
		
		<form class="passwordform" action ="forget_password" method ="POST">
		<div class="heading">
				<b>Change Password</b>
			</div>
			
		  	<div class="inputbox1">
				<div class="labelforemail"><label>Email:</label> </div>
				 <input type="email" placeholder="enter  email"
					id="email" name ="email"   /> 
			</div>
			
		
			<div class="inputbox2">
			<div class="labelfornewpassword"><label >Enter New Password:</label> </div>
				<input type="password" placeholder="enter  password"
					id="pswd1" name ="pswd1" /> 
					<span class="eye" onclick="toggle()">
					<i id="hide1" class="fa fa-eye"></i> <i id="hide2"
					class="fa fa-eye-slash"></i>
				</span>
			</div>


			<div class="inputbox3">
		<div class="labelfornewconfirmpassword"><label>Re Enter Password:</label> </div>
				 <input type="password" placeholder="enter  password"
					id="pswd2"  name ="pswd2" /> <span class="eye_1"
					onclick="togglefunction()"> <i id="hide_eye1"
					class="fa fa-eye"></i> <i id="hide_eye2" class="fa fa-eye-slash"></i>
				</span>
			</div> 
			<div >

				<input type="submit" class="btn"  value ="Change password"  />
			</div>
			
			<div  class ="error" id ="messages">
			${errormsg_1}
			${errormsg2}
			${errormsg3}			
			
			</div>
			
		</form>
   
    

		<jsp:include page="footer.jsp">
			<jsp:param name="footer" value="bootom" />
		</jsp:include>
	</div>
	

</body>
</html>