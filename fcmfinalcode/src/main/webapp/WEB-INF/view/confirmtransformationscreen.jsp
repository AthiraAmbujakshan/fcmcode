<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<script src ="webjars/jquery/2.1.1/jquery.min.js"></script>	
<script src ="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <link  rel="stylesheet"
	href="webjars/font-awesome/5.15.4/css/all.min.css">  
<link href="css/confirmtransformation.css" rel="stylesheet">

<style>
.header-heading p{
font-size:26px;
}
.modal{
margin-left:400px;
margin-top: -350px;
}

</style>
</head>
<body>

<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>

<div class="transformation_screen" >
<div  class="tables">
<table id ='sourcefieldtable'>

				<c:forEach items="${sourcefield}" var="sourcefield">
					<tbody>
						<tr>

							<td>${sourcefield}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
			<table  id ='tablenametable'>

				<c:forEach items="${tablename}" var="tablename">
					<tbody>
						<tr>

							<td>${tablename}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
<table  id = destinationfieldtable>

				<c:forEach items="${destinationfield}" var="destinationfield">
					<tbody>
						<tr>

							<td>${destinationfield}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
	<table id ="destinationtypetable" >

				<c:forEach items="${destinationtype}" var="destinationtype">
					<tbody>
						<tr>

							<td>${destinationtype}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>		


<table  id ="destinationsizetable">

				<c:forEach items="${destinationsize}" var="destinationsize">
					<tbody>
						<tr>

							<td>${destinationsize}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>			
<table  id ="transformationlogicstable">

				<c:forEach items="${transformationlogics}" var="transformationlogics">
					<tbody>
						<tr>

							<td>${transformationlogics}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
			
						
<table  id ="defaultValuetable">

				<c:forEach items="${defaultValue}" var="defaultValue">
					<tbody>
						<tr>

							<td>${defaultValue}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
	<table  id ="LoadActionArraytable">

				<c:forEach items="${LoadActionArray}" var="LoadActionArray">
					<tbody>
						<tr>

							<td>${LoadActionArray}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>		
			
		</div>





<div class="transformation">
		<table class="transferedtable" id="transfered_table" style="border-collapse:collapse" >

		</table>

	</div>
	
	
	
	<div class="transformationbtn">
		<button class="transformationlogic" id="applytransformation"
			onclick="confirmTransformation()">Proceed</button>

	</div>
	
	
	<div class="back_button">
		  <button class="back" id="backbutton" onclick="goback()">Back</button> 

	</div>
	
	
				</div>
			
<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h3>User's Final Confirmation</h3>
			</div>
			<div class="modal-body">
				<pre>
The confirmation here will be the last level of user interaction.
Post this communication, we will be communicating with backend system
and save the instructed configurations in FCM.
</pre>


<p>Please confirm with your decision to proceed</p>
			</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick="location.href='/dashboard'">YES</button>
					<button id="nobtn">NO</button>
				</div>
			</div>
		</div>

	</div>
	


	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>
	
	<script>
	
	var transfered_table = document.getElementById('transfered_table');
	var sourcefieldtable = document.getElementById('sourcefieldtable');
	var tablenametable = document.getElementById('tablenametable');
	var destinationfieldtable = document.getElementById('destinationfieldtable');
	var destinationtypetable = document.getElementById('destinationtypetable');
	var destinationsizetable = document.getElementById('destinationsizetable');
	var transformationlogicstable = document.getElementById('transformationlogicstable');
	var defaultValuetable = document.getElementById('defaultValuetable');
	var LoadActionArraytable = document.getElementById('LoadActionArraytable');
	if(transfered_table.rows.length == 0){
		
		
		for (var i=0; i<sourcefieldtable.rows.length; i++)
		{
		
			var  newRow = transfered_table.insertRow(transfered_table.length);
		 cell1=	newRow.insertCell(0);
			cell1.innerHTML = sourcefieldtable.rows[i].cells[0].innerHTML;  
			
		
			cell2=	newRow.insertCell(1);
			cell2.innerHTML = tablenametable.rows[i].cells[0].innerHTML;
			cell2.style.width="10%";
		 
			cell3=	newRow.insertCell(2);
			cell3.innerHTML = destinationfieldtable.rows[i].cells[0].innerHTML; 
			
		
			cell4=	newRow.insertCell(3);
			cell4.innerHTML = destinationtypetable.rows[i].cells[0].innerHTML; 
			
		
			cell5=	newRow.insertCell(4);
			cell5.innerHTML = destinationsizetable.rows[i].cells[0].innerHTML; 
			
			cell6=	newRow.insertCell(5);
			cell6.innerHTML = transformationlogicstable.rows[i].cells[0].innerHTML;
			if(transformationlogicstable.rows[i].cells[0].innerHTML =="")
				{
				cell6.innerHTML= "Not Required";
				}
			
			cell7=	newRow.insertCell(6);
			cell7.innerHTML = defaultValuetable.rows[i].cells[0].innerHTML;
			
			
			cell8=	newRow.insertCell(7);
			cell8.innerHTML = LoadActionArraytable.rows[i].cells[0].innerHTML;
			
			
			}
		
	}
	
	var header = transfered_table.createTHead();
    var row = header.insertRow(0);    
    var cell1 = row.insertCell(0);
   
    cell1.innerHTML = "Source Field";
    
    
    
    cell2=	row.insertCell(1);
		cell2.innerHTML = "Destination Table"; 
		
		cell3=	row.insertCell(2);
		cell3.innerHTML = "Destination Field"; 
		
		cell4=	row.insertCell(3);
		cell4.innerHTML ="Destination Type" ; 
		
		cell5=	row.insertCell(4);
		cell5.innerHTML ="Destination Size" ;
		
		cell6=	row.insertCell(5);
		cell6.innerHTML ="Transformation Logic" ; 
		
		cell7=	row.insertCell(6);
		cell7.innerHTML ="Default Values" ; 
		
		
		cell8=	row.insertCell(7);
		cell8.innerHTML ="Load  Action" ;  
	
		
		
	function confirmTransformation(){
		
	var myModal = document.getElementById('myModal');
	myModal.style.display ="block";
		
	}
	
	var span = document.getElementsByClassName("close")[0];
	var nobtn = document.getElementById('nobtn');
	var myModal = document.getElementById('myModal');
	span.onclick = function() {
		myModal.style.display = "none";
	}
	nobtn.onclick = function() {
		myModal.style.display = "none";
	}

	function goback(){
		
		
		var  transfered_table = document.getElementById('transfered_table');
		 
		var selectedlogic =[];
		
		for (var i=1; i<transfered_table.rows.length; i++)
			{
			selectedlogic.push({transformationLogic:transfered_table.rows[i].cells[5].innerHTML});
			selectedlogic.push({defaultValues:transfered_table.rows[i].cells[6].innerHTML})
			selectedlogic.push({loadAction:transfered_table.rows[i].cells[7].innerHTML})
			}
		
		console.log(selectedlogic);

		$
				.ajax({

					url : "/backtochangelogics",

					type : 'POST',

					data : JSON.stringify(selectedlogic),

					dataType : "html",

					contentType : 'application/json',

					mimeType : 'application/json',

					success : function(data) {

						window.location = "http://localhost:8081/apply_transformation";
						console.log("done");

					}

				});

	}

	
	
	</script>
	



</body>
</html>