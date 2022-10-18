<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<link href="css/prevalidation.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>

<div >
<br>
<br>
<p>Greetings of the Day!!</p>
<p>Thanks for helping us to continue servicing you with a secure connectivity.we stand behind 
to make this Migration Process more easier with fair recommendations.</p>
<p> To avoid failures while DataMigration progress, we need to bear some confirmation as part of prerequisites</p>
<div class = "subcontent">
<p>1. All the Customer(s) from the legacy system (irrespective of Active Inactive status) should have been made available in FCM before proceeding with this Migration.</p>
<p>2. All the Account(s) and Transaction(s) from the legacy system (irrespective of Orphans Adopt category) should be available in FCM before proceeding with this Migration.</p>
<p>3. FCM User interface should have been brought down, so that no users can access FCM UI whale migration is in progress. This is to aviod any unnecessary delay in DB Transactions.</p>
<p>4. Any FCM level Configurations like Mandator Creation, FCM Segement Creation, Case Type Creations and other necessary configuration if any, should be configured before Proceeding.</p>
</div>
<br>

<p>Click on [Validate] to check in FCM System, Click on [Ok Proceed] to continue if all the prerequisites are met. Click [Cancel] if any workaround is pending.</p>

</div>

<div class ="buttons">
<button class ="btn1" onclick ="validatescreen()">Validate</button>
<button class ="btn2" onclick ="Proceed()">Ok,Proceed</button>
<button class ="btn3"onclick ="Cancel()">Cancel</button>


</div>

<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>



<script>
function Proceed(){
	
	window.location = "http://localhost:8081/proceedtoprojectscreen";
}
function validatescreen(){
	window.location = "http://localhost:8081/proceedtovalidation";
}
function Cancel(){
	window.location = "http://localhost:8081/login";
}

</script>
</body>
</html>