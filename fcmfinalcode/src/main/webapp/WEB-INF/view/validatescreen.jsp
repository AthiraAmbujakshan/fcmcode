<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>
<script src ="webjars/jquery/2.1.1/jquery.min.js"></script>	
<link href ="css/accountsvalidation.css"rel="stylesheet">
</head>
<body>


<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>
	
	<div  id ="flag" style="display:none">
	${flag}
	</div>
	<div class="table" style="display:none;">
	<table id ="idsnotexistsarray">
	

				<c:forEach items="${Optionidsnotindb}" var="Optionidsnotindb">
					<tbody>
						<tr>

							<td>${Optionidsnotindb}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
			
		<table id ="idsexistsarray">
	

				<c:forEach items="${Optionidsindb}" var="Optionidsindb">
					<tbody>
						<tr>

							<td>${Optionidsindb}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
				
		
			<table id ="OPTION">
	

				<c:forEach items="${Option}" var="Option">
					<tbody>
						<tr>

							<td>${Option}</td>

						</tr>
					</tbody>
				</c:forEach>


			</table>
	</div>
	
	
	<div class ="tabs">
	
<button class="tablink" id="defaultOpen" onclick="openPage('customer', this, 'green')">Customer(s)</button>
<button class="tablink" id="openaccount" onclick="openPage('account', this, 'green')" >Account(s)</button>
<button class="tablink" id ="opentransaction"onclick="openPage('transaction', this, 'green')">Transaction(s)</button>
<button class="tablink" id ="opencasetype"onclick="openPage('casetype', this, 'green')">CaseType(s)</button>
	</div>
	
	
	<div id="customer" class="tabcontent">
  
  <p class ="line">Give us the list of Customers you have for DataMigration.On your behalf, we will work on it and update you with a list of customers matching with FCM systems.</p>

<p class ="paracontent">Please specify the list of T24 Customer ID in the below text box with a COMMA delimiter to validate.

<div class ="text_area">
<textarea id="customeridlist"   rows="4" cols="50" required>
 
  </textarea>
  <div class ="searchbtn">
  <button onclick ="fetchCustomerId()">Search</button>
  </div>
  </div>
  <div class ="matchingheading" id = "headingforsecondcustomertextbox"> 
  </div>
<div class ="text_area2" id = "textsuccessforcustomer">
<textarea id="customeridexist"  rows="4" cols="50">
 
  </textarea>

</div>

<div class ="matchingheading" id = "headingforthirdcustomertextbox"> 
  </div>
<div class ="text_area3" id = "textfailforcustomer">
<textarea id="customernotexist"  rows="4" cols="50">
 
  </textarea>

</div>
</div>



<div id="account" class="tabcontent">
  
  <p class ="line">Give us the list of Accounts you have for DataMigration.On your behalf, we will work on it and update you with a list of customers matching with FCM systems.</p>

<p class ="paracontent">Please specify the list of T24 Account ID in the below text box with a COMMA delimiter to validate.
 
<div class ="text_area" >
<textarea id="accountidlist"   rows="4" cols="50" required>
 
  </textarea>
  <div class ="searchbtn">
  <button onclick ="fetchAccountId()">Search</button>
  </div>
  </div>
 
 <div class ="matchingheading" id = "headingforsecondaccounttextbox"> 
  </div>
 <div class ="text_area2" id = "textsuccessforaccount">
<textarea id="accountidexist"  rows="4" cols="50">
 
  </textarea>

</div>

<div class ="matchingheading" id = "headingforthirdaccounttextbox"> 
  </div>
 <div class ="text_area3" id = "textfailforaccount">
<textarea id="accountnotexist"  rows="4" cols="50">
 
  </textarea>

</div>
</div>



<div id="transaction" class="tabcontent">
  
  <p class ="line">Give us the list of Transactions you have for DataMigration.On your behalf, we will work on it and update you with a list of customers matching with FCM systems.</p>

<p class ="paracontent">Please specify the list of T24 Transaction ID in the below text box with a COMMA delimiter to validate.

<div class ="text_area">
<textarea id="transactionidlist"   rows="4" cols="50" required>
 
  </textarea>
  <div class ="searchbtn">
  <button onclick ="fetchTransactionId()" >Search</button>
  </div>
  </div>
  
  <div class ="matchingheading" id= "headingforsecondtransactiontextbox"> 
  </div>
  
  <div class ="text_area2" id ="textsuccessfortransaction">
<textarea id="transactionidexist"   rows="4" cols="50">
 
  </textarea>

</div>

<div class ="matchingheading" id= "headingforthirdtransactiontextbox"> 
  </div>
  
  <div class ="text_area3" id ="textfailfortransaction">
<textarea id="transactionnotexist"   rows="4" cols="50">
 
  </textarea>

</div>
</div>




<div id="casetype" class="tabcontent">
  
  <p class ="line">Give us the list of CaseType name(s) you have for DataMigration.On your behalf, we will work on it and update you with a list of CaseType name(s) matching with FCM systems.</p>

<p class ="paracontent">Please specify the list of  CaseType name(s) in the below text box with a COMMA delimiter to validate.

<div class ="text_area">
<textarea id="casetypeidlist"   rows="4" cols="50" required>
 
  </textarea>
  <div class ="searchbtn">
  <button onclick ="fetchCaseTypeId()" >Search</button>
  </div>
  </div>
  
  <div class ="matchingheading" id= "headingforsecondcasetypetextbox"> 
  </div>
  
  <div class ="text_area2" id ="textsuccessforcasetype">
<textarea id="casetypeidexist"   rows="4" cols="50">
 
  </textarea>

</div>

<div class ="matchingheading" id= "headingforthirdcasetypetextbox"> 
  </div>
  
  <div class ="text_area3" id ="textfailforcasetype">
<textarea id="casetypeidnotexist"   rows="4" cols="50">
 
  </textarea>

</div>
</div>






  <div id="myModal" class="modal" >

		
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				
			</div>
			<div class="modal-body">
		<h4>Alert Message</h4>
		<div id ="popupforvalidationfailed" class ="popupid" >
		</div>
		<div  class ="data" >
		One of the Prerequisites for DataMigration is not met.
		</div>
		
		<div class ="btnheading1">
	  Click [YES] to Quit Application.
	  </div>
	  <div class ="btnheading2" id ="popupmsg">
	  </div>
		</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick ="Yesbtn()">YES</button>
					<button class ="nobtn" onclick ="Nobtn()">NO</button>
				</div>
			</div>
		</div>

	</div> 
	 
	 
	<div id="my_Modal" class="modalfornullcheck" >

		
		<div class="modalcontent">
			<div class="modal-header">
				
			</div>
			<div class="modalbody">
		<h4>Alert Message</h4>
		<div id ="popupfornullcheck" class ="popupidfornullcheck" >
		</div>
		
		</div>
			<div class="modalfooter">
				<div class="footerbtn">
					<button onclick ="OKbtn()">OK</button>
				</div>
			</div>
		</div>

	</div> 
	  
	 
	 
	 
	 
	
	<div class ="backbutton">
	<span class="closescreen">&times;</span>
	</div>
	


	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>
	
	
	
	<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

document.getElementById("defaultOpen").click();



function fetchCustomerId(){
	var option =[];
	var customeridlist = document.getElementById('customeridlist').value;
	if(customeridlist != "" )
		{
		 option.push({optionid:customeridlist.trim()});
		 option.push({option:"CUSTOMER"});
		} 
	
		 
		 console.log(option);
			
			
			$
			.ajax({

				url : "/validateallids",

				type : 'POST',

				data : JSON.stringify(option),

				dataType : "html",

				contentType : 'application/json',

				mimeType : 'application/json',

				success : function(data) {
					
				window.location= "http://localhost:8081/validatedid";

					console.log("done");

				}

			});
	 

}

function fetchAccountId(){
	
	var option =[];
	
	var accountidlist = document.getElementById('accountidlist').value;
	if(accountidlist !="")
		{
		 option.push({optionid:accountidlist.trim()});
		 option.push({option:"ACCOUNT"});
		}
	console.log(option);
	
	
	$
	.ajax({

		url : "/validateallids",

		type : 'POST',

		data : JSON.stringify(option),

		dataType : "html",

		contentType : 'application/json',

		mimeType : 'application/json',

		success : function(data) {
			
			window.location= "http://localhost:8081/validatedid";

			console.log("done");

		}

	});
}
	function fetchTransactionId(){
		var option =[];
		var transactionidlist = document.getElementById('transactionidlist').value;
 if(transactionidlist.value != "")
		{
		
		 option.push({optionid:transactionidlist.trim()});
		 option.push({option:"TRANSACTION"});
		}
	
	console.log(option);
	
	
	$
	.ajax({

		url : "/validateallids",

		type : 'POST',

		data : JSON.stringify(option),

		dataType : "html",

		contentType : 'application/json',

		mimeType : 'application/json',

		success : function(data) {
			
			window.location= "http://localhost:8081/validatedid";

			console.log("done");

		}

	});

}
	
	
	
	
	function fetchCaseTypeId(){
		var option =[];
		var casetypeidlist = document.getElementById('casetypeidlist').value;
 if(casetypeidlist.value != "")
		{
		
		 option.push({optionid:casetypeidlist.trim()});
		 option.push({option:"CASETYPE"});
		}
	
	console.log(option);
	
	
	$
	.ajax({

		url : "/validateallids",

		type : 'POST',

		data : JSON.stringify(option),

		dataType : "html",

		contentType : 'application/json',

		mimeType : 'application/json',

		success : function(data) {
			
			window.location= "http://localhost:8081/validatedid";

			console.log("done");

		}

	});

}	
	
	
	
	
	
	
	var myModal = document.getElementById('myModal');
	var popupforvalidationfailed = document.getElementById('popupforvalidationfailed');
	var idsnotexistsarray = document.getElementById('idsnotexistsarray');
	var OPTION= document.getElementById('OPTION');
	var popupmsg = document.getElementById('popupmsg');
	var flag = document.getElementById('flag');
	var idsexistsarray = document.getElementById('idsexistsarray');
	var headingforsecondcustomertextbox = document.getElementById('headingforsecondcustomertextbox');
	var textsuccessforcustomer= document.getElementById('textsuccessforcustomer');
	 var headingforsecondaccounttextbox = document.getElementById('headingforsecondaccounttextbox');
	 var textsuccessforaccount = document.getElementById('textsuccessforaccount');
	 var headingforsecondtransactiontextbox = document.getElementById('headingforsecondtransactiontextbox'); 
	 var textsuccessfortransaction= document.getElementById('textsuccessfortransaction');
	 var headingforthirdcustomertextbox = document.getElementById('headingforthirdcustomertextbox');
	 var headingforthirdaccounttextbox = document.getElementById('headingforthirdaccounttextbox');
	 var headingforthirdtransactiontextbox = document.getElementById('headingforthirdtransactiontextbox');
	var textfailforcustomer = document.getElementById('textfailforcustomer');
	var textfailforaccount = document.getElementById('textfailforaccount');
	var textfailfortransaction = document.getElementById('textfailfortransaction');

	
   var textsuccessforcasetype= document.getElementById('textsuccessforcasetype');
	var headingforsecondcasetypetextbox = document.getElementById('headingforsecondcasetypetextbox'); 
	var headingforthirdcasetypetextbox = document.getElementById('headingforthirdcasetypetextbox');
	var textfailforcasetype = document.getElementById('textfailforcasetype');
	
	var my_Modal = document.getElementById('my_Modal');
var popupfornullcheck = document.getElementById('popupfornullcheck');
	
	 if(flag.innerHTML == 1)
	{
		 
		 var data ="";
		
		var content ="";
		
		var optiontext="";
		if(OPTION.rows.length !=0)
			{
			for(var i=0; i<OPTION.rows.length; i++)
				{
			optiontext = OPTION.rows[i].cells[0].innerHTML;
			}
			optiontext = optiontext.toLowerCase();
			}
	
		
		
		
		if(idsexistsarray.rows.length != 0)
		{
		for(var i=0; i<idsexistsarray.rows.length; i++)
			{
			
			 data = data + idsexistsarray.rows[i].cells[0].innerHTML+",";
			}
		}
		console.log(optiontext);
		data = data.slice(0,-1);
		console.log(data);
		
		 if(optiontext =="customer")
			{
			 content = "Following Customer(s) look matching with FCM System";
			 
			 headingforsecondcustomertextbox.innerHTML = content;
			 headingforsecondcustomertextbox.style.display ="block";
			 
			 textsuccessforcustomer.style.display ="block";
		document.getElementById('customeridexist').value =data;
			}
		 
		 else if(optiontext =="account")
			{
			 
			 content = "Following Account(s) look matching with FCM System";
			 
			 headingforsecondaccounttextbox.innerHTML = content;
			 headingforsecondaccounttextbox.style.display ="block";
			 
			 textsuccessforaccount.style.display ="block";
		document.getElementById('accountidexist').value =data;
		document.getElementById('openaccount').click();
			}
		 
		 else if(optiontext =="transaction")
			{
			 content = "Following Transaction(s) look matching with FCM System"
				
				 headingforsecondtransactiontextbox.innerHTML = content;
				 headingforsecondtransactiontextbox.style.display ="block"; 
			 
			 
			 textsuccessfortransaction.style.display ="block";
		document.getElementById('transactionidexist').value =data;
		document.getElementById('opentransaction').click();
			}
		 
		 else{
			 
			 content = "Following CaseType(s) look matching with FCM System"
					
				 headingforsecondcasetypetextbox.innerHTML = content;
				 headingforsecondcasetypetextbox.style.display ="block"; 
			 
			 
			 textsuccessforcasetype.style.display ="block";
		document.getElementById('casetypeidexist').value =data;
		document.getElementById('opencasetype').click();	 
			 
			 
			 
			 
		 }
			
		}
		
	 
	 
	 else  if (flag.innerHTML == -1)
	 {
		 
		 var data ="";
		 var existingids="";
			
			var content ="";
			var heading ="";
			
			var optiontext="";
			if(OPTION.rows.length !=0)
				{
				for(var i=0; i<OPTION.rows.length; i++)
					{
				optiontext = OPTION.rows[i].cells[0].innerHTML;
				}
				optiontext = optiontext.toLowerCase();
				}
			console.log(optiontext);
			
			
			
			if(idsnotexistsarray.rows.length != 0 && idsexistsarray.rows.length ==0)
			{
				console.log(idsnotexistsarray.rows.length);
			for(var i=0; i<idsnotexistsarray.rows.length; i++)
				{
				
				 data = data + idsnotexistsarray.rows[i].cells[0].innerHTML+",";
				}
			}
			
			else if(idsnotexistsarray.rows.length != 0 && idsexistsarray.rows.length !=0)
			{
				
			for(var i=0; i<idsnotexistsarray.rows.length; i++)
				{
				
				 data = data + idsnotexistsarray.rows[i].cells[0].innerHTML+",";
				}
			
			for(var i=0; i<idsexistsarray.rows.length; i++)
			{
			
				existingids = existingids + idsexistsarray.rows[i].cells[0].innerHTML+",";
			}
			
			
			}	
			
			
				
			console.log(optiontext);
			existingids = existingids.slice(0,-1);
			data = data.slice(0,-1);
			console.log(data);
			
			 if(optiontext =="customer")
				{
				 if(existingids =="" && data != "")
					 {
				 content = "Following Customer(s) are not matching with FCM System";
				 
				 headingforsecondcustomertextbox.innerHTML = content;
				 headingforsecondcustomertextbox.style.display ="block";
				 
				 textsuccessforcustomer.style.display ="block";
			document.getElementById('customeridexist').value =data;
			popupforvalidationfailed.textContent = "Given list of Customer(s) are not available in FCM System.";
			popupmsg.textContent ="Click [No] to try with other Customer(s).";
			myModal.style.display ="block";
					 }
				 else if(existingids !="" && data != "")
					 {
					 
					 content = "Following Customer(s) look matching with FCM System";
					 
					 headingforsecondcustomertextbox.innerHTML = content;
					 headingforsecondcustomertextbox.style.display ="block";
					 
					 textsuccessforcustomer.style.display ="block";
				document.getElementById('customeridexist').value = existingids;
				popupforvalidationfailed.textContent = "Given list of Customer(s) are not available in FCM System.";
				popupmsg.textContent ="Click [No] to try with other Customer(s).";
				myModal.style.display ="block"; 
					 
				heading ="Following Customer(s) are not matching with FCM System";
				
				 headingforthirdcustomertextbox.innerHTML = heading;
				 headingforthirdcustomertextbox.style.display ="block";
				 
				 
				 textfailforcustomer.style.display ="block";
					document.getElementById('customernotexist').value =data;
					
				
					 }
				}
			 
			 else if(optiontext =="account")
				{
				 if(existingids =="" && data != "")
				 { 
				 content = "Following Account(s) are not matching with FCM System.";
				 
				 headingforsecondaccounttextbox.innerHTML = content;
				 headingforsecondaccounttextbox.style.display ="block";
				 
				 textsuccessforaccount.style.display ="block";
			document.getElementById('accountidexist').value =data;
			document.getElementById('openaccount').click();
			popupforvalidationfailed.textContent ="Given list of Account(s) are not available in FCM System."
				popupmsg.textContent ="Click [No] to try with other Account(s).";
			myModal.style.display ="block";
			
				 }
				 else if(existingids !="" && data != "")
					 
				 { 
               content = "Following Account(s) look matching with FCM System";
					 
					 headingforsecondaccounttextbox.innerHTML = content;
					 headingforsecondaccounttextbox.style.display ="block";
					 
					 textsuccessforaccount.style.display ="block";
				document.getElementById('accountidexist').value = existingids;
				popupforvalidationfailed.textContent = "Given list of Account(s) are not available in FCM System.";
				popupmsg.textContent ="Click [No] to try with other Account(s).";
				myModal.style.display ="block"; 
					 
				heading ="Following Account(s) are not matching with FCM System";
				
				 headingforthirdaccounttextbox.innerHTML = heading;
				 headingforthirdaccounttextbox.style.display ="block";
				 
				 
				 textfailforaccount.style.display ="block";
					document.getElementById('accountnotexist').value =data;
					
					document.getElementById('openaccount').click();
					 }
				}
			 
			 else if(optiontext =="transaction")
				{
				 if(existingids =="" && data != "")
				 { 
				 content = "Following Transaction(s) are not matching with FCM System."
					
					 headingforsecondtransactiontextbox.innerHTML = content;
					 headingforsecondtransactiontextbox.style.display ="block"; 
				 
				 
				 textsuccessfortransaction.style.display ="block";
			document.getElementById('transactionidexist').value =data;
			document.getElementById('opentransaction').click();
			popupforvalidationfailed.textContent = "Given list of Transaction(s) are not available in FCM System.";
			popupmsg.textContent ="Click [No] to try with other Transaction(s).";
			myModal.style.display ="block";
				}
             else if(existingids !="" && data != "")
					 
				 { 
               content = "Following Transaction(s) look matching with FCM System";
					 
					 headingforsecondtransactiontextbox.innerHTML = content;
					 headingforsecondtransactiontextbox.style.display ="block";
					 
					 textsuccessfortransaction.style.display ="block";
				document.getElementById('transactionidexist').value = existingids;
				popupforvalidationfailed.textContent = "Given list of Transaction(s) are not available in FCM System.";
				popupmsg.textContent ="Click [No] to try with other Transaction(s).";
				myModal.style.display ="block"; 
					 
				heading ="Following Transaction(s) are not matching with FCM System";
				
				 headingforthirdtransactiontextbox.innerHTML = heading;
				 headingforthirdtransactiontextbox.style.display ="block";
				 
				 
				 textfailfortransaction.style.display ="block";
					document.getElementById('transactionnotexist').value =data;
					
					document.getElementById('opentransaction').click();
					 }	 
				 
				}		 
		 
			 
			 
			/*--------------------------------------- */
			 else if(optiontext =="casetype")
				{
				 if(existingids =="" && data != "")
				 { 
				 content = "Following CaseType(s) are not matching with FCM System."
					
					 headingforsecondcasetypetextbox.innerHTML = content;
					 headingforsecondcasetypetextbox.style.display ="block"; 
				 
				 
				 textsuccessforcasetype.style.display ="block";
			document.getElementById('casetypeidexist').value =data;
			document.getElementById('opencasetype').click();
			popupforvalidationfailed.textContent = "Given list of CaseType(s) are not available in FCM System.";
			popupmsg.textContent ="Click [No] to try with other CaseType(s).";
			myModal.style.display ="block";
				}
          else if(existingids !="" && data != "")
					 
				 { 
            content = "Following CaseType(s) look matching with FCM System";
					 
					 headingforsecondcasetypetextbox.innerHTML = content;
					 headingforsecondcasetypetextbox.style.display ="block";
					 
					 textsuccessforcasetype.style.display ="block";
				document.getElementById('casetypeidexist').value = existingids;
				popupforvalidationfailed.textContent = "Given list of CaseType(s) are not available in FCM System.";
				popupmsg.textContent ="Click [No] to try with other CaseType(s).";
				myModal.style.display ="block"; 
					 
				heading ="Following CaseType(s) are not matching with FCM System";
				
				 headingforthirdcasetypetextbox.innerHTML = heading;
				 headingforthirdcasetypetextbox.style.display ="block";
				 
				 
				 textfailforcasetype.style.display ="block";
					document.getElementById('casetypeidnotexist').value =data;
					
					document.getElementById('opencasetype').click();
					 }	 
				 
				}	
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
			 
				 
		 
		 
	 }
	 else if (flag.innerHTML == -2)
		 {
		 
		 if(OPTION.rows.length !=0)
			{
			for(var i=0; i<OPTION.rows.length; i++)
				{
			optiontext = OPTION.rows[i].cells[0].innerHTML;
			}
			optiontext = optiontext.toLowerCase();
			}
		console.log(optiontext);
		
		if(optiontext =="customer")
		{
			popupfornullcheck.textContent = "Please enter a valid Customer ID.";
			
			my_Modal.style.display ="block"; 
		 }
		
		else if(optiontext =="transaction")
		{
			popupfornullcheck.textContent = "Please enter a valid Transaction ID.";
		
			my_Modal.style.display ="block"; 
			document.getElementById('opentransaction').click();
		 }
		
		else if(optiontext =="account")
		{
			popupfornullcheck.textContent = "Please enter a valid Account ID.";
			
			my_Modal.style.display ="block"; 
			document.getElementById('openaccount').click();
		 }
	
		else if(optiontext =="casetype")
		{
			popupfornullcheck.textContent = "Please enter a valid Case_Type ID.";
			
			my_Modal.style.display ="block"; 
			document.getElementById('opencasetype').click();
		 }	
		
		
		 }
	
		
		
		var span = document.getElementsByClassName("close")[0];
		span.onclick = function() {
			myModal.style.display = "none";
		}
		var span = document.getElementsByClassName("closescreen")[0];
		span.onclick = function() {
			window.location ="http://localhost:8081/prerequiste"
		}
		
		
		
		
		function Yesbtn(){
			
			
			myModal.style.display = "none";
			
			window.location ="http://localhost:8081/login"
			}
		
		function Nobtn(){
			myModal.style.display = "none";
		}
	function OKbtn(){
		my_Modal.style.display = "none";
	}
		
	</script>
	
</body>
</html>