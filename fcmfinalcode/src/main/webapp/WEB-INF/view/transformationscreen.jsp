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
<link href="css/transformation_2.css" rel="stylesheet">
<link href="css/transformationerror.css" rel="stylesheet">
<link href="css/helptext.css" rel="stylesheet">
<script src="js/transformation.js"></script>
<style>
.modal{
margin-top: -350px;
margin-left: 400px;
}
.content{
overflow-y:scroll;
}
.header-heading p{
font-size:26px;
}
.messagebox{
position: absolute; 
  z-index: 1; 
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
			
			
		<table  id ='lookupnametable'>

				<c:forEach items="${lookupnamearray}" var="lookupnamearray">
					<tbody>
						<tr>

							<td>${lookupnamearray}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
			
	<table  id ='lookupvaluetable'>

				<c:forEach items="${lookupvaluearray}" var="lookupvaluearray">
					<tbody>
						<tr>

							<td>${lookupvaluearray}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
		<table  id ='lookupdesctable'>

				<c:forEach items="${lookupdescarray}" var="lookupdescarray">
					<tbody>
						<tr>

							<td>${lookupdescarray}</td>

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
			
	
			
			
			<table  id ="defaultvaluetable">

				<c:forEach items="${defaultValue}" var="defaultValue">
					<tbody>
						<tr>

							<td>${defaultValue}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
			
		<table  id ="defaultvaluetablebeforeproceed">

				<c:forEach items="${defaultvaluesbeforeproceed}" var="defaultvaluesbeforeproceed">
					<tbody>
						<tr>

							<td>${defaultvaluesbeforeproceed}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
	<table  id ="loadActiontablebeforeproceed">

				<c:forEach items="${loadActionbeforeproceed}" var="loadActionbeforeproceed">
					<tbody>
						<tr>

							<td>${loadActionbeforeproceed}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
	<table  id ="transformationlogicsuccess">

				<c:forEach items="${transformationlogics}" var="transformationlogics">
					<tbody>
						<tr>

							<td>${transformationlogics}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>		
			
			<table  id ="transformationlogicwithexception">

				<c:forEach items="${transformationlogicerror}" var="transformationlogicerror">
					<tbody>
						<tr>

							<td>${transformationlogicerror}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
					
		<table  id ="LoadActionwithexception">

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
			onclick="ApplyTransformation()">Apply Transformation</button>

	</div>
	
	
	<!-- --lookupscreen -->
	
	<div class="lookup_btn">
		  <button class="lookup" id="definelookup" onclick="lookuptable()">Define
			Lookup</button> 

	</div>
	
	
	<div class="lookupscreen" id='lookup_screen'>
		<div class="lookup-content">


			<div class="lookup-header">

				<h4>Data Migration Tool- Define Lookup</h4>

				<span class="minimisebtn" id="min"> <i
					class="fa fa-window-minimize"></i>
				</span> 
				<span class="maximisebtn" id="max">[] 

				</span> 
				<span class="closebtn" id="closelookup"> &times;</span>
			</div>

			<div class="lookup-tablebtn">

				<button class="addbtn" onclick="addRow()">Add Row</button>
				<button class="deletebtn" onclick="deleteRow()">Delete Row</button>
				<button class="updatebtn" onclick="UpdateRow()">Update Row</button>
			</div>

			<div class="lookup-body">
				<div class="content">
					<table class="looktable" id="look_up_table" >
						<thead>
							<tr >
								<th style="width: 5%"  ><input type="checkbox"
									id="selectmultiple" onclick="selectAllRows(this)"></th>
								<th>LOOKUPNAME</th>
								<th>LOOKUPVALUE</th>
								<th>LOOKUPDESCRIPTION</th>
							</tr>
						</thead>

					</table>
				</div>
			</div>


		</div>
	</div>

	
	
</div>

<!-- -------helptext -->
	
	<div class="tooltip" id ="helpbox">
	<i class="fas fa-question-circle">
	<!-- <span class ="tooltiptext" id ="help">Help</span> -->
	</i>
	</div>
	
	<div class="messagebox" id ="descriptionbox">
	<span class="closemsgbox">&times;</span>
	<div class="description">
	<h3>Description for Transformation Logics</h3>
	<h5>Auto Generated-</h5> 
	<p>The next unique value for this particular column field in the database will be given as input for field.
	</p>
	
	<h5>Retrieve From Query-</h5> 
	<p>The result after executing the query in the respective default value column will be given as the input for the field.
	</p>
	
	
	<h5>Lookup-</h5> 
	<p> Define Lookup by clicking on the 'Define lookup' button and adding the 3 entries as follows.
	<br>
	 LOOKUPNAME - Name to be used in the default value column.
	 <br>
	 LOOKUPVALUE - Value available in the file for that particular field.
	 <br>
     LOOKUPDESCRIPTION - Value to be replaced with the file value.
     <br>
     Now provide the LOOKUPNAME in the default value Column
	</p>
	
	<h5>Same As-</h5> 
	<p> In the DEFAULT VALUES column provide the name of the field whose value you want to be replaced for the selected field.
	</p>
	
	
	<h5>Maximum-</h5> 
	<p>  Fetches the maximum value for the selected field from the database.
	</p>
	
	<h5>Maximum+1-</h5> 
	<p>Fetches the maximum value for the selected field from the database and add 1 to that and that value is assigned for this particular field.
	</p>
	
	<h5>User Defined Value-</h5> 
	<p>The value provided in the DEFAULT VALUES column will directly be passed as the value for that particular field.
	</p>
	
	
	<h5>Not Required-</h5> 
	<p>The data from the file for this particular field will directly be inserted as the field value.
	</p>
	 
	 
	 <p><b>In case no transformation logic is selected for a particular field then by default it will be taken as "Not Required".</b>
	 </p>
	 
	 <h5>Load Action-</h5>
	 <p>
	If you want to either(insert/update)  for a particular table ,choose the load action for the first field of that table and the same operation will be performed for all the fields of that particular table.
	</p>
	
	</div>
	</div>
	
<!-- ------------------------------------------ -->
<!-- -popup for error -->
<div id="myModal" class="modal" style="display:none;">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				
				<h3>Error Message</h3>
			</div>
			<div class="modal-body">
				<p>Entered Transformation logics results in NumberFormat Exception </p>
<p>Please click on "OK" and make the required changes</p>
			</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick ="okbutton()">OK</button>
					
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
var defaultvaluetablebeforeproceed = document.getElementById('defaultvaluetablebeforeproceed');
var loadActiontablebeforeproceed = document.getElementById('loadActiontablebeforeproceed');
var transformationlogicwithexception =document.getElementById('transformationlogicwithexception');
var LoadActionwithexception= document.getElementById('LoadActionwithexception');
var defaultValueerrorwithexception = document.getElementById('defaultValueerrorwithexception');
var helpbox = document.getElementById('helpbox');
var descriptionbox = document.getElementById('descriptionbox');
var transformationlogicsuccess= document.getElementById('transformationlogicsuccess');
var defaultvaluetable = document.getElementById('defaultvaluetable');
var lookupnametable = document.getElementById('lookupnametable');
var lookupvaluetable = document.getElementById('lookupvaluetable');
var lookupdesctable = document.getElementById('lookupdesctable');
var look_up_table= document.getElementById('look_up_table');
var logic =[];
helpbox.addEventListener("click",()=>{
	descriptionbox.style.display ="block";
	
});



var closemsgbox = document.getElementsByClassName("closemsgbox")[0];

closemsgbox.onclick = function() {
	descriptionbox.style.display = "none";
}

var transformationcolumn = [];	

	function okbutton(){
		var myModal = document.getElementById('myModal');
		myModal.style.display ="none";
	}
	
	

	if(transfered_table.rows.length == 0){
		
		
		
		for (var i=0; i<sourcefieldtable.rows.length; i++)
		{
		
			var  newRow = transfered_table.insertRow(transfered_table.length);
		 cell1=	newRow.insertCell(0);
			cell1.innerHTML = sourcefieldtable.rows[i].cells[0].innerHTML;  
			
		
			cell2=	newRow.insertCell(1);
			cell2.innerHTML = tablenametable.rows[i].cells[0].innerHTML;
			cell2.style.width="20%";
		 
			cell3=	newRow.insertCell(2);
			cell3.innerHTML = destinationfieldtable.rows[i].cells[0].innerHTML; 
			
		
			cell4=	newRow.insertCell(3);
			cell4.innerHTML = destinationtypetable.rows[i].cells[0].innerHTML; 
			
		
			cell5=	newRow.insertCell(4);
			cell5.innerHTML = destinationsizetable.rows[i].cells[0].innerHTML; 
			
			
		
			cell6=	newRow.insertCell(5);

			
	if( transformationlogicwithexception.rows.length==0 && transformationlogicsuccess.rows.length ==0)
		{
	
		
				cell6.innerHTML = "<select id ='sel' onchange ='changelogic()'><option value ='option1' selected disabled hidden></option><option value ='option2'>Auto Generated</option><option value ='option3'>Retrieve from Query </option>"+ 
				"<option value ='option4'>Lookup </option>" + 
				
				"<option value ='option5'>User defined value  </option>"+ 
				"<option value ='option6'>Same As   </option>"+
				"<option value ='option7'>Maximum()  </option>"+
				"<option value ='option8'>Maximum()+1   </option>"+  
				"<option value ='option9'>Not Required  </option>"+
				
				
				"</select>"; 
		}
	
	else if(transformationlogicsuccess.rows.length !=0){
		

		  cell6.innerHTML = "<select id ='sel' onchange ='changelogic()'>"+
			"<option value ='option1'>"+transformationlogicsuccess.rows[i].cells[0].innerHTML+"</option>"+
			"<option value ='option2'>Auto Generated</option>"+ 
			"<option value ='option3'>Retrieve from Query</option>" + 
			"<option value ='option4'>Lookup</option>"+ 
			"<option value ='option5'>User defined value</option>"+
			"<option value ='option6'>Same as</option>"+
			"<option value ='option7'>Maximum()</option>"+  
			"<option value ='option8'>Maximum()+1</option>"+
			"<option value ='option9'>Not Required</option>"+
			"</select>";
	  }
		
	else if(transformationlogicwithexception.rows.length !=0){
		var myModal = document.getElementById('myModal');
		myModal.style.display ="block";
		
		cell6.innerHTML = "<select id ='sel' onchange ='changelogic()'><option value ='option1'>"+transformationlogicwithexception.rows[i].cells[0].innerHTML+"</option><option value ='option9'>Auto Generated </option><option value ='option2'>Retrieve from Query </option>"+ 
		"<option value ='option3'>Lookup </option>" + 
		
		"<option value ='option4'>User defined value  </option>"+ 
		"<option value ='option5'>Same As   </option>"+
		"<option value ='option6'>Maximum()  </option>"+
		"<option value ='option7'>Maximum()+1   </option>"+  
		"<option value ='option8'>Not Required  </option>"+
		
		
		"</select>"; 
		
			
		
	}
	
			
			cell7=	newRow.insertCell(6);
			
	if(defaultvaluetablebeforeproceed.rows.length ===0 &&  defaultvaluetable.rows.length ===0)
		{
			cell7.innerHTML = "<input  name='selectquery' type =text >" ;
			cell7.style.width="40%";
		}
	else if(defaultvaluetable.rows.length !=0){
		cell7.innerHTML = '<input  name="selectquery" type = "text" value ="' +defaultvaluetable.rows[i].cells[0].innerHTML +'">' ;
		cell7.style.width="40%";
	}
	
	
	else {
		cell7.innerHTML = '<input  name="selectquery" type = "text" value ="'+defaultvaluetablebeforeproceed.rows[i].cells[0].innerHTML+'">' ;
		
		cell7.style.width="40%";
	}
			cell8=	newRow.insertCell(7)
	if(loadActiontablebeforeproceed.rows.length === 0 && LoadActionwithexception.rows.length ===0)
		{
			
			cell8.innerHTML = "<select  id ='loadaction'><option value ='none' selected disabled hidden>"+
			"</option><option value ='free'>Insert into FCM</option>"+
			"<option value ='update'>Update FCM</option></select>"; 
		
			}
		
		else if(LoadActionwithexception.rows.length !=0)
			{
			cell8.innerHTML = "<select  id ='loadaction'><option value ='option1'>"+LoadActionwithexception.rows[i].cells[0].innerHTML+
			"</option><option value ='free'>Insert into FCM</option>"+
			"<option value ='update'>Update FCM</option></select>"; 
			}
	else 
		{
		
		
		cell8.innerHTML = "<select  id ='loadaction'><option value ='option1'>"+loadActiontablebeforeproceed.rows[i].cells[0].innerHTML+
		"</option><option value ='free'>Insert into FCM</option>"+
		"<option value ='update'>Update FCM</option></select>"; 
		}
		
	}
	
		var  look_up_table = document.getElementById('look_up_table');
		    if(look_up_table.rows.length ==1)
			
			{                        
		    	

			if(lookupnametable.rows.length !=0)
				{
			
				for( var k=0; k<lookupnametable.rows.length; k++)
					{
				var  newRow = look_up_table.insertRow(look_up_table.length);
				  cell1=	newRow.insertCell(0);
				  cell1.innerHTML = "<input type ='checkbox' name ='checkrow'>";
				  cell2=	newRow.insertCell(1);
					cell2.innerHTML = '<input type ="text" name ="lookupname" value ="'+lookupnametable.rows[k].cells[0].innerHTML+'" >';
					
					
					cell3=	newRow.insertCell(2);
					
					cell3.innerHTML ='<input type ="text" name ="lookupvalue" value ="'+lookupvaluetable.rows[k].cells[0].innerHTML+'" >';
				
					cell4=	newRow.insertCell(3);
					cell4.innerHTML = '<input type ="text" name ="lookupdesc" value ="'+lookupdesctable.rows[k].cells[0].innerHTML+'" >';
				
				}
			
			
			}
		                  
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
	
		
		var closelookup = document.getElementById('closelookup');	
		
		closelookup.addEventListener("click",()=>{
			 
			
			lookup_screen.style.display ="none";
			
			
			 
		});
		
		
		
		function ApplyTransformation() {
  
	

			var transfered_table = document.getElementById('transfered_table');

			for (var j = 1; j < transfered_table.rows.length; j++) {
		
				
				
		
			var sel = document.getElementById('sel');
			
				for (var i = 0; i < sel.options.length; i++) {
					var  selectedoption = "";

					if (sel.options[i].selected === true) {

						selectedoption = sel.options[i].text;
						
						console.log(selectedoption);
		
						

						transformationcolumn.push({
							transformationLogic : selectedoption
						});
							
					}
       
					transfered_table.rows[j].cells[5].innerHTML  = selectedoption;		
    	   }
			}
		

			var defaultcolumn = document.getElementsByName("selectquery");

			for (var i = 0; i < defaultcolumn.length; i++) {

				transformationcolumn.push({
					defaultValues : defaultcolumn[i].value
				});
			}

			var lookupnamecol = document.getElementsByName("lookupname");

			for (var i = 0; i < lookupnamecol.length; i++) {

				transformationcolumn.push({
					lookupname : lookupnamecol[i].value
				});
			}

			var lookupvaluecol = document.getElementsByName("lookupvalue");

			for (var i = 0; i < lookupvaluecol.length; i++) {

				transformationcolumn.push({
					lookupvalue : lookupvaluecol[i].value
				});
			}

			var lookupdesccol = document.getElementsByName("lookupdesc");

			for (var i = 0; i < lookupdesccol.length; i++) {

				transformationcolumn.push({
					lookupdesc : lookupdesccol[i].value
				});
			}

			for (var j = 1; j < transfered_table.rows.length; j++) {

				var loadaction = document.getElementById('loadaction');
				
				for (var i = 0; i < loadaction.options.length; i++) {
					var selectedloadoption = "";

					if (loadaction.options[i].selected === true) {

						selectedloadoption = loadaction.options[i].text;
						console.log(selectedloadoption);

						transformationcolumn.push({
							loadAction : selectedloadoption
						});
						
					}

					transfered_table.rows[j].cells[7].innerHTML  = selectedoption;		

				}
				}	
				

			
			console.log(transformationcolumn);

			$
					.ajax({

						url : "/transformationlogic",

						type : 'POST',

						data : JSON.stringify(transformationcolumn),

						dataType : "html",

						contentType : 'application/json',

						mimeType : 'application/json',

						success : function(data) {

							window.location = "http://localhost:8081/confirmtransformation";
							console.log("done");

						}

					});

			
		}	
	
function changelogic(){
	
	
	var transfered_table = document.getElementById('transfered_table');

	for (var j = 1; j < transfered_table.rows.length; j++) {
   var sel = document.getElementById('sel');
   
		for (var i = 0; i < sel.options.length; i++) {
			var  selectedoption = "";

			if (sel.options[i].selected === true) {

				selectedoption = sel.options[i].text;
				
				console.log(selectedoption);

				

				logic.push({
					transformationLogic : selectedoption
				});
					
			}

			transfered_table.rows[j].cells[5].innerHTML  = "";
			
   }	
	}
	
	
	var defaultcolumn = document.getElementsByName("selectquery");

	for (var i = 0; i < defaultcolumn.length; i++) {

		logic.push({
			defaultValues : defaultcolumn[i].value
		});
	}
	
	
	var lookupnamecol = document.getElementsByName("lookupname");

	for (var i = 0; i < lookupnamecol.length; i++) {

		logic.push({
			lookupname : lookupnamecol[i].value
		});
	}

	var lookupvaluecol = document.getElementsByName("lookupvalue");

	for (var i = 0; i < lookupvaluecol.length; i++) {

		logic.push({
			lookupvalue : lookupvaluecol[i].value
		});
	}

	var lookupdesccol = document.getElementsByName("lookupdesc");

	for (var i = 0; i < lookupdesccol.length; i++) {

		logic.push({
			lookupdesc : lookupdesccol[i].value
		});
	}
	
	for (var j = 1; j < transfered_table.rows.length; j++) {

		var loadaction = document.getElementById('loadaction');
		
		for (var i = 0; i < loadaction.options.length; i++) {
			var selectedloadoption = "";

			if (loadaction.options[i].selected === true) {

				selectedloadoption = loadaction.options[i].text;
				console.log(selectedloadoption);

				logic.push({
					loadAction : selectedloadoption
				});
				
			}

			transfered_table.rows[j].cells[7].innerHTML  = selectedoption;		

		}
		}	
		

console.log(logic);


$
.ajax({

	url : "/transformationlogic",

	type : 'POST',

	data : JSON.stringify(logic),

	dataType : "html",

	contentType : 'application/json',

	mimeType : 'application/json',

	success : function(data) {

		window.location = "http://localhost:8081/apply_transformation";
		console.log("done");

	},
	error : OnError
	});

}
function OnError(){
	
	console.log(logic);
	

	$
	.ajax({

		url : "/transformationerror",

		type : 'POST',

		data : JSON.stringify(logic),

		dataType : "html",

		contentType : 'application/json',

		mimeType : 'application/json',

		success : function(data) {

			window.location = "http://localhost:8081/apply_transformation";
			console.log("done");

		
			

		}

	});
	
	
	
}
	var lookup_screen= document.getElementById('lookup_screen');
jQuery(document).ready(function($){
	  $(document).on('click', '.minimisebtn', function(){
	    $(this).closest('.lookup-content').find('.lookup-tablebtn').slideUp();
	    $(this).closest('.lookup-content').find('.lookup-body').slideUp();
	    $(this).closest('.lookup-content').animate({'left':-190,'bottom':-70});
	    lookup_screen.style.border="none"; 
	  });
	 

	  
	  $(document).on('click', '.maximisebtn', function(){
	    $(this).closest('.lookup-content').find('.lookup-tablebtn').slideDown();
	    $(this).closest('.lookup-content').find('.lookup-body').slideDown();
	    
	    $(this).closest('.lookup-content').animate({'left':'0','bottom':'270'});
	    lookup_screen.style.border="groove"; 
	  });
	  
	 
	});
	

	

	
	</script>
</body>
</html>