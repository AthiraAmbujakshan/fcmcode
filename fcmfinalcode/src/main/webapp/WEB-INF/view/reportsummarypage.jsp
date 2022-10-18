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
<link href="css/reportsummary_screen.css" rel="stylesheet">
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.tablerows {
	margin-top: 300px;
}
.border{
margin-top:-22%;
}
.finalreport{
margin-left:-100px;
}
.exporttopdfbtn{
	margin-left:530px;
 }
 .header-heading p{
font-size:26px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>

	<div class="tablerows">
		<table id="rowsbeforemigration" style="display:none;">
			<c:forEach items="${rows}" var="rows">
			
				<tbody>
					<tr>
						<td>${rows}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
		<table id="rowsaftermigration" style="display:none;">
			<c:forEach items="${rowsaftermigration}" var="rowsaftermigration">
			
				<tbody>
					<tr>
						<td>${rowsaftermigration}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	
	<div>
	<table id="selectedmodulesformigration"  style="display:none;">
			<c:forEach items="${module_selected}" var="module_selected">
			
				<tbody>
					<tr>
						<td>${module_selected}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
		
	<table id="columnrowsfromdsv" style="display:none;">
			<c:forEach items="${valuefieldsize}" var="valuefieldsize">
			
				<tbody>
					<tr>
						<td>${valuefieldsize}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>	
		
	
	</div>
	
	
	
	
	<div class="border">
		  <div class="modulename" >
			<table id="module_namerow"  style="display:none;">
				
					<tbody>
						<tr>
							<td>Historical Online Alert</td>
							</tr>
							<tr>
							<td>Historical CIF Alert</td>
							</tr>
							<tr>
							<td>Historical Profile Batch Alert</td>
							</tr>
							<tr>
							<td>Historical Cases</td>
							</tr>
							<tr>
							<td>Customer Questionnaire</td>
						</tr>
					</tbody>

				
			</table>
		</div> 
		
		<div class="exporttopdfbtn">
			<button class="pdfbtn" onclick ="exporttabletopdf()">Export To PDF</button>
			<button class="excelbtn" onclick="exporttabletoExcel()">Export To Excel</button>
			<button class="closebtn" onclick="closebutton()">Close And Log Out</button>
		</div>
		
		<div class="success">

		<img src="images/thumbs_up_sign_256_1.gif" alt="abc">
		</div>

		

<div class="summarytable">
    <table class = "finalreport" id ="finalmodifiedtable">
    </table>
		</div>
		
	<div >
		<table  id="reporttable" style="display:none;">
</table>
</div>	

	</div>
	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>


	<script>
	
	var rowsbeforemigration = document.getElementById('rowsbeforemigration');
	var reporttable = document.getElementById('reporttable');
	var module_namerow = document.getElementById('module_namerow');
	var selectedmodulesformigration = document.getElementById('selectedmodulesformigration');
	var rowsaftermigration = document.getElementById('rowsaftermigration');
		function closebutton() {

			window.location = "http://localhost:8081/closefcm";
		}
		
		
		
			
			for (var i=0; i<rowsbeforemigration.rows.length; i++)
			{
		var k = rowsaftermigration.rows[i].cells[0].innerHTML - rowsbeforemigration.rows[i].cells[0].innerHTML;	
				var  newRow = reporttable.insertRow(reporttable);
			    cell1=	newRow.insertCell(0);
				cell1.innerHTML = module_namerow.rows[i].cells[0].innerHTML;  
				
			
				cell2=	newRow.insertCell(1);
				cell2.innerHTML = rowsbeforemigration.rows[i].cells[0].innerHTML;
				
				cell3=	newRow.insertCell(2);
				if( k == 0)
					{
				cell3.innerHTML ="Not applicable";
					}
				else {
					cell3.innerHTML =k;
				}
				
				cell4=	newRow.insertCell(3);
				cell4.innerHTML = rowsaftermigration.rows[i].cells[0].innerHTML;
				
				}
			
	
function exporttabletopdf(){
	
	var tablearray =[];
	
	for(var i=0; i<finalmodifiedtable.rows.length; i++){
		
		tablearray.push({tableInformation:finalmodifiedtable.rows[i].cells[0].innerHTML});
		tablearray.push({Noofrowsbeforemigration:finalmodifiedtable.rows[i].cells[1].innerHTML});
		tablearray.push({Noofrowsmigrated:finalmodifiedtable.rows[i].cells[2].innerHTML});
		tablearray.push({Noofrowsaftermigration:finalmodifiedtable.rows[i].cells[3].innerHTML});
	}
	console.log(tablearray);
	$
	.ajax({

		url : "/summarytableinfo",

		type : 'POST',

		data : JSON.stringify(tablearray),

		dataType : "html",

		contentType : 'application/json',

		mimeType : 'application/json',

		success : function(data) {
			window.location = "http://localhost:8081/export/table/pdf";
			console.log("done");

		}

	});
}
		     
	function exporttabletoExcel(){
		var tablearray =[];
		
		for(var i=0; i<finalmodifiedtable.rows.length; i++){
			
			tablearray.push({tableInformation:finalmodifiedtable.rows[i].cells[0].innerHTML});
			tablearray.push({Noofrowsbeforemigration:finalmodifiedtable.rows[i].cells[1].innerHTML});
			tablearray.push({Noofrowsmigrated:finalmodifiedtable.rows[i].cells[2].innerHTML});
			tablearray.push({Noofrowsaftermigration:finalmodifiedtable.rows[i].cells[3].innerHTML});
		}
		console.log(tablearray);
		$
		.ajax({

			url : "/summarytableinfo",

			type : 'POST',

			data : JSON.stringify(tablearray),

			dataType : "html",

			contentType : 'application/json',

			mimeType : 'application/json',

			success : function(data) {
				window.location = "http://localhost:8081/export/table/excel";
				console.log("done");

			}

		});
		
		
		
	}	
	var selectedmodulesformigration = document.getElementById('selectedmodulesformigration');
  var finalmodifiedtable = document.getElementById('finalmodifiedtable');	
	var columnrowsfromdsv = document.getElementById('columnrowsfromdsv');
	for(var k=0; k< reporttable.rows.length; k++)
		{
		console.log(reporttable.rows.length);
		for(var m=0; m< selectedmodulesformigration.rows.length; m++)
			{
		var x= selectedmodulesformigration.rows[m].cells[0].innerHTML;
		
		console.log(reporttable.rows[k].cells[0].innerHTML);
		console.log(x.trim());
		if(reporttable.rows[k].cells[0].innerHTML == x.trim())
			{
			
		    
			var  newRow = finalmodifiedtable.insertRow(finalmodifiedtable);
		    cell1=	newRow.insertCell(0);
			cell1.innerHTML = reporttable.rows[k].cells[0].innerHTML;  
			
			cell2=	newRow.insertCell(1);
			cell2.innerHTML = reporttable.rows[k].cells[1].innerHTML;
			
			cell3=	newRow.insertCell(2);
			cell3.innerHTML = columnrowsfromdsv.rows[m].cells[0].innerHTML;
			
			cell4=	newRow.insertCell(3);
			//cell4.innerHTML = reporttable.rows[k].cells[3].innerHTML;
			cell4.innerHTML= +reporttable.rows[k].cells[1].innerHTML + +columnrowsfromdsv.rows[m].cells[0].innerHTML;  
			
			}
		
	
						
			
			
	
			}
		
		
		
			}
	
	
	
	var header = finalmodifiedtable.createTHead();
	var row = header.insertRow(0);    
	var cell1 = row.insertCell(0);
	cell1.innerHTML = "Table Information";

	var cell2 = row.insertCell(1);
	cell2.innerHTML = "No. of Row(s) Before Migration";

	var cell3 = row.insertCell(2);
	cell3.innerHTML = "No. of Row(s) Migrated";

	var cell4 = row.insertCell(3);
	cell4.innerHTML = "No. of Row(s) After Migration";
		
		
	</script>
</body>
</html>