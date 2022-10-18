<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html >
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/login_page.css" rel="stylesheet">
<script src="js/loginpassword.js"></script>
<link rel="stylesheet" href="webjars/font-awesome/5.15.4/css/all.min.css">
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



	<form class="loginform" method="post" action="/nextpage">


		<div class="inputbox">
			<br> <br> <label><b>Email</b></label> <br> <input
				type='email' placeholder="Enter Email" name="email" required />
		</div>

		<div class="inputbox">
			<label><b>Password</b></label> <br> <input type="password"
				placeholder="Enter Password" id="pass" name="password" required />
			<span class="eye" onclick="toggle()"> <i id="hide1"
				class="fa fa-eye"></i> <i id="hide2" class="fa fa-eye-slash"></i>
			</span>
		</div>


		<input type="submit" class="btn" value ="Login" >

		<div class="wronguser">${errormsg}${errormsgemail}</div>

		<br> <br>
		<div class=" userforgetdetails">
			<a href="/newuser" style="text-decoration: none;">New User
				Registration</a> <a href="/forgetpassword" style="padding: 50px;">Forget
				Password?</a>

		</div>

	</form>

	<div class="writeup">

		<p class="textwriteup">Standalone tool designed to migrate the
			data from legacy AML system to FCM system, with in-built data
			transformation options. It also helps the legacy system to generate
			relevant data by understanding FCM modules independently.</p>


	</div>

	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>

</body>
</html>



