<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/forgot_password_1.css" rel="stylesheet">
	
</head>

<body>
	
	<jsp:include page="forgetpassword.jsp">
		<jsp:param name="forgetpassword" value="forgetpasswordscreen" />
	</jsp:include>

		
   
  <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h3>Success!!</h3>
			</div>
			<div class="modal-body">
				<p>Password has been changed successfully.Click 'OK' to continue to Login! </p>

			</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick="okbutton()">OK</button>
					
				</div>
			</div>
		</div>

	</div>
	
    

		
	
<script>
var span = document.getElementsByClassName("close")[0];

span.onclick = function() {
	window.location = location.protocol+"//"+location.host+"/forgetpassword";
	
}

function okbutton(){
	window.location = location.protocol+"//"+location.host+"/login";
}


</script>
</body>
</html>