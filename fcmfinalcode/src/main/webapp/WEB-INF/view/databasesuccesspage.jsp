<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>

<script src ="webjars/jquery/2.1.1/jquery.min.js"></script>	
<script src ="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <link  rel="stylesheet"
	href="webjars/font-awesome/5.15.4/css/all.min.css"> 
	
	<link href ="css/database_configure.css" rel="stylesheet">
	
</head>
<body>

<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>

<div class ="databaseimage" id ="images">
 
 <img src ="images/FCM5.jpeg" class ="image" > 
</div>
<div class ="settingscontent" id ="databasepage">

<h2 class ="databasesettings">Database Settings</h2>


<form class ='databaseform' action="/validatedatabaseconnection" method ="post">

				<div>
					<label ><b>Choose Database</b></label>
					<select  name ="databasename" id ="database" onchange= "clearform()">
					<option value ="option1">Oracle</option>
					<option value ="option2">SQL</option>
					<option value ="option3">PostgreSQL</option>
					</select>
				
				</div>




				<div>
					<label ><b>DB Host Name: &nbsp;</b></label>
					<input type="text" name ="hostName"  id ="hostName" required />
				</div>


				<div>
					<label ><b>DB User Name: &nbsp;</b></label>
					<input type="text" name ="userName"id='userName' required />
				</div>


				<div>
					<label><b>DB Password: &nbsp;</b></label> 
					<input type="password" name ="dBpassword"id='dBpassword' required />
				</div>


<div>
					<label ><b>Database Name: &nbsp;</b></label>
					<input type='text' name ="dbName"id='databaseName' required />
				</div>

				<div>
					<label><b>DB Port Number: &nbsp;</b></label>
					<input type='text' name ="dbPortNumber" id='db_PortNumber' required />
			</div>
			
		<div>
		<button type ="submit"  class ="submitbtn" >Validate Connection</button>
		
		</div>	
			




</form> 
</div> 

	

<div id="myModal" class="modal" style="display:block;">

		 
		<div class="modal-content">
			<div class="modal-header">
				<span class="closepopup" onclick  ="closepopup()">&times;</span>
			
			</div>
			<div class="modal-body">
				<p>Connection Successfull</p>

			</div>
			<div class="modal-footer">
				<div class="buttons" >
					<button onclick="Okbutton()">OK</button>
		
				</div>
			</div>
		</div>

	</div> 




<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>

<script>

function closepopup(){
	var myModal = document.getElementById('myModal');
	myModal.style.display ="none";
	
}
function Okbutton(){
	window.location = "http://localhost:8081/prerequiste";
}
function clearform(){
	document.getElementById('hostName').value ="";
	document.getElementById('userName').value ="";
	document.getElementById('dBpassword').value ="";
	document.getElementById('databaseName').value ="";
	document.getElementById('db_PortNumber').value ="";
	
	
	if(document.getElementById('database').value =="option2")
	{
	
	document.getElementById('db_PortNumber').readOnly = true;
	document.getElementById('db_PortNumber').value ="1433";
	}
}

</script>	
	
</body>
</html>