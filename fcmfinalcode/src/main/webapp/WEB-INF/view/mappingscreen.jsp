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
<link href="css/view_model.css" rel="stylesheet">
<link href="css/mapping8.css" rel="stylesheet">

<script src="js/transformation.js"></script>
<style>
.freemappingbutton{
	margin-left:520px;
	margin-top:-1.75%;
	
}
.header-heading p{
font-size:26px;
}

.backbuttoninmappingscreen{
	
	margin-left:740px;
	margin-top:-1%;
}
.backbuttoninmappingscreen button{
margin-top:-0.5%;
}
.inputtext1{
margin-top:-10px;
}

</style>
</head>
<body>

	<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>



	<div class="mapping_screen" id="screen">
		<form class="uploaddsvfile" action="/uploadfile"
			enctype="multipart/form-data" method="post" id="form">

			<div class="projectdata" >

				<input type="text" value="${projectid}" id ="nameofproject"name="dropdown" style ="display:none;">

			</div>

			<div class="inputtext1">
				<input type="text" name="modulename" class="modulelabel"
					id="module_label" value="${modulename}">

			</div>
			<br /> <label class="delimiterlabel">Delimiter Of The File:</label>
			<input type="text" name="delimiter"> <br /> <br /> <input
				type="file" name="dsvfile" id="myfile" size="50" />


			<button type="submit">Upload</button>
			<div class="backbuttoninmappingscreen">
				  <button type="submit" formaction="/open">Go Back To Select
					Another Module</button>
					<!--  <button onclick ="gobackfun()">Go back to select
					another module</button> -->
			</div>
		</form>

		<div class="freemappingbutton" id="freeze">
			<button onclick="FreezeMapping()">Freeze Mapping</button>
		</div>
		<div class="sourcefieldtablecolumn">
			<table class="sourcefield" id="sourcetable">
				<thead>
					<tr>
						<th>SourceField</th>
					</tr>
				</thead>

				<c:forEach items="${myfile}" var="filelist">
					<tbody>
						<tr>
							<td class="sourcefieldcolumn">${filelist}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			
		</div>

		<!--    ------------------------------------------    -->


		<div class="tablemodifier">


			<table id="destinationtable">

				<thead>
					<tr>

						<th>FCM_TABLE_NAME</th>
						<th>FCM_FIELD_NAME</th>
						<th>FCM_FIELD_TYPE</th>
						<th>FCM_FIELD_SIZE</th>
						<th>FCM_NULL_CONSTRAINTS</th>
						<th>FCM_DATA_DEFAULT</th>
						<th>FCM_COLUMN_ID</th>

					</tr>
				</thead>

				<c:forEach items="${finalList}" var="modulestable1">
					<tbody>
						<tr>

							<td>${modulestable1.TABLE_NAME}</td>


							<td>${modulestable1.COLUMN_NAME}</td>


							<td>${modulestable1.DATA_TYPE}</td>
							<td>${modulestable1.DATA_LENGTH}</td>

							<td>${modulestable1.NULLABLE}</td>

							<td>${modulestable1.DATA_DEFAULT}</td>

							<td>${modulestable1.COLUMN_ID}</td>


						</tr>
					</tbody>
				</c:forEach>


			</table>


		</div>
		<div class="upbutton">
			<button onclick="upFunction()" id="up">UP</button>
		</div>

		<div class="downbutton">
			<button onclick="downFunction()" id="down">DOWN</button>
		</div>
	</div>

	<!--    ------------------------------------------    -->





	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h3>Mapping Confirmation</h3>
			</div>
			<div class="modal-body">
				<p>Are you sure all the source and destination fields are
					mapped?</p>

			</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick="yesbutton()">YES</button>
					<button id="nobtn">NO</button>
				</div>
			</div>
		</div>

	</div>







	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>

	<script>
		var applytransformation = document
				.getElementById('applytransformation');
		var transformationlogicoption = document
				.getElementById('transformationlogicoption');

		highlight_row_dest();

		function highlight_row_dest() {
			var table = document.getElementById('destinationtable');
			var cells = table.getElementsByTagName('td');

			for (var i = 0; i < cells.length; i++) {
				// Take each cell
				var cell = cells[i];
				// do something on onclick event for cell
				cell.onclick = function() {
					// Get the row id where the cell exists
					var rowId = this.parentNode.rowIndex;

					var rowsNotSelected = table.getElementsByTagName('tr');
					for (var row = 0; row < rowsNotSelected.length; row++) {
						rowsNotSelected[row].style.backgroundColor = "";
						rowsNotSelected[row].classList.remove('selected');
					}
					var rowSelected = table.getElementsByTagName('tr')[rowId];
					rowSelected.style.backgroundColor = "yellow";
					rowSelected.className += " selected";

				}
			}

		}

		var span = document.getElementsByClassName("close")[0];

		var nobtn = document.getElementById("nobtn");

		var sourcetable = document.getElementById("sourcetable");
		var transfered_table = document.getElementById("transfered_table");

		span.onclick = function() {
			var modal = document.getElementById("myModal");
			modal.style.display = "none";
		}

		nobtn.onclick = function() {
			var modal = document.getElementById("myModal");
			modal.style.display = "none";
		}

		function yesbutton() {

			
			var modal = document.getElementById("myModal");
			var tabledata = [];

			for (var i = 1; i < sourcetable.rows.length; i++) {

				tabledata.push({
					sourceField : sourcetable.rows[i].cells[0].innerHTML
				});

			}
			
			for (var i = 1; i < destinationtable.rows.length; i++) {

				tabledata.push({
					tableName : destinationtable.rows[i].cells[0].innerHTML
				});

			}
			for (var i = 1; i < destinationtable.rows.length; i++) {

				tabledata
						.push({
							destinationField : destinationtable.rows[i].cells[1].innerHTML
						});

			}

			for (var i = 1; i < destinationtable.rows.length; i++) {

				tabledata
						.push({
							destinationType : destinationtable.rows[i].cells[2].innerHTML
						});

			}

			for (var i = 1; i < destinationtable.rows.length; i++) {

				tabledata
						.push({
							destinationSize : destinationtable.rows[i].cells[3].innerHTML
						});

			}
			tabledata.push({
				modulename : document.getElementById('module_label').value
			});
			tabledata.push({
				projectname : document.getElementById('nameofproject').value
			});
			console.log(tabledata)

			$
					.ajax({

						url : "/listoftablecolumn",

						type : 'POST',

						data : JSON.stringify(tabledata),

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