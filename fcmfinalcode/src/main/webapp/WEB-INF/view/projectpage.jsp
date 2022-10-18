<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>

<link href="css/navbar.css" rel="stylesheet">
<link href="css/projectpage.css" rel="stylesheet">
<script src ="js/table.js"></script>
<script src ="webjars/jquery/2.1.1/jquery.min.js"></script>	
<script src ="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <link  rel="stylesheet"
	href="webjars/font-awesome/5.15.4/css/all.min.css">  	


<link href="css/migration_modules.css" rel="stylesheet">
<link href ="css/modulestyle.css" rel="stylesheet">
<link href ="css/module_stylepage.css" rel="stylesheet">
<link href ="css/Projectpage_modules.css" rel="stylesheet">
<link href ="css/moduletablestyle.css" rel="stylesheet">
<link href ="css/mappingpage.css" rel="stylesheet">
<link href ="css/projectpage_css.css" rel="stylesheet">
<style>
.explorerHeading{
margin-left:20px;
}
.moduletable2 td input[type=checkbox]{
    width:16px;
	margin-left :12px;
}
.openedaddmodule{
margin-top:24px;
}

.logo{
margin-left:-85px;
margin-bottom:0;
}
.logo  img{
	
	margin-left:90px;
	

}
.navbar{
background: 	#000040;
}
.heading{

margin-left:-80px;
font-size:26px;

}
.addmodulesforopenedproject {
	margin-top:-4%;
}
.table_modulesforopenproject{
	margin-top:12.5%;
}

.projectname{

top:280px;
height:300px;
width:301px;
bottom:0;
}


</style>
</head>
<body>


	<div>

		<div class="topheaderbar">
		
	
	
		</div>

<nav class="navbar">
		
 <div class ="logo">
  <img src ="images/logo1.PNG" alt="Cognizantlogo" width ="220" height="42">
  </div>
			<div class="heading">FCM DATA MIGRATION</div>
			<div class="logbtn">
				<a href="/redirect">Logout</a>
			</div>

		</nav>
		


 

		<div class="content" id="newprojectpage">

			<h1 class="popheading">Create New Project</h1>

			<br> <br>
			<form  action ="saveproject" method ="POST">
				<br> 
				<label><b>Project Name:</b></label> 
				<input type="text"name="projectname" id="txt">
				<button  type="submit" class="createbtn" >Create</button>
				
			
			</form>

		</div>
		
 		
		



		<div class="sidebar" id="sidebar1">
			

			<nav>
				<ul>
					<li>Project 
					
						<ul class="submenu" id="submenu1">
							<li><a href="#" onclick="popUp()">New Project</a></li>

							<li><a href="#" onclick ="displayOpenprojectpage()">Open Project</a></li>
						</ul></li>
						
						
				</ul>


			</nav>
			
		</div>
		
	



<div class = "projectname">
		<p class="explorerHeading">Project Explorer</p>
		 
		
		<div class ="projectmenu" id ="displayproject" >
		
		<div class ="project_name" id="nameofproject">
	<ul>
	<li class ="arrow" id ="arrowclick">${arrow} ${project.projectname}</li>
  
  <li id ="openedprojectname">${arrow1} ${selectedproject}</li>
  </ul>
  </div>
  
  <div class ="moduleopen">
  <ul>
  <li >${modulearowonopen}${moduleheading}</li>
  </ul>
  </div>
  
  <div class ="modulesforopenproject" id ="tableopenedmodules">
  <table class ="table_modulesforopenproject" id ="showopenedmodulestable">
   <c:forEach items="${modulespresent}" var="modules"  >
 <tr>
	<td>${modules}</td>
  </tr>
   </c:forEach>
   </table>
   
   <table class ="addmodulesforopenedproject"  id ="addmodules_openedproject">
   
   
   </table>
  
   <div class ="openedaddmodule" id ="addmodulesforopenproject">
   <ul>
  <li > <a style="text-decoration:none;" href ="#">${modulearowonopen}${addmodulelink}</a></li>
   </ul>
   </div>
  
 
   
	
  </div>	
 
  
  <div class ="modulelist" id ="modules">
 <ul>
 <li class ="arrow1" id ="arrowclick1"><i class="fas fa-caret-right "> </i>Modules</li>
 
  </ul>
 
  </div>
   
   <div class ="showmodules" id ="show_modules">
  <table id = "existingmoduletable" class ="module_table" >
  
  
  </table>
  
 
  <div class ="modulesub" id ="addmodules">
 <ul>
 
 <li ><a href ="#" >>Add Modules</a></li>
 </ul>
 </div>

 
  
  </div>
	</div>	
	
	</div>
	
  
		
	<div class="openprojectcontent" id="openprojectpage">

			<h1 class="openprojectheading">Select a Project to Open</h1>
			<form action ="open" method ="POST">
<select name = "dropdown" id ="selectdropdown" >


<c:forEach items="${listofproject}" var="project"  >
<option class ="projectdropdown" id ="selectdropdownoption">
${project.projectname}

</option>
</c:forEach>

</select>
		<button  type="submit"  class ="openprojectname" onclick ="openproject()">Open</button>	
	</form>	
		</div>
	
	
		
	
	
	
	<div class="addmodulenewproject" id="addmodulenewprojectpage">

			<h1 class="moduleheading">Add Module</h1>

	<table class ="moduletable" border="1" id ="table1">
	
	<tr>
	<td class ="modulenames">Historical Online Alert</td>
	
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	
	<tr>
	<td class ="modulenames" >Historical CIF Alert</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	<tr>
	<td class ="modulenames">Historical Profile Batch Alert</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	<tr>
	<td class ="modulenames">Historical Cases</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	<tr>
	<td class ="modulenames">Historical Real-Time Profile Alert</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	<tr>
	<td class ="modulenames">Customer Questionnaire</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr>
	<!--  <tr>
	<td class ="modulenames">Auto Skip Alert</td>
	<td class ="selectrows"><input type ="checkbox" name ="checkbtn">
	</tr> -->
	
	
	</table>
	
	
	<div class ="moduleselecticon" onclick ="table1_To_table2()">
	<i class="fa fa-arrow-right "></i>
	
	</div>
	
	<div class ="moduleremoveicon" onclick ="reverse()">
	<i class="fa fa-arrow-left "></i>
	
	</div>
	
	
	<table class ="moduletable2"  border="1" id ="table2">
	
	</table>
	
	<input type ="submit" class="savemodules" value ="Save" onclick="SaveModulesToController()">
	
	</div>
	
	
	
<!--     -------mappingscreen------------------------    -->
	
	<div class ="mappingscreen" id ="mapping_screen">
	
	
	
	
	
	<form class ="migrationmodule" action ="fetch" method ="GET">
	<div class ="inputproject">
	<Label>Project Name:</Label>
	<input type = "text"  name ="projectid" id ='selectedprojectname'>
	
	</div>
	<div class ="inputtext">
	<Label>Selected Module:</Label>
	<input type = "text"  name ="modulename" id ='selectedmodulesformapping'>
	</div>
	
	<div class="mappingbtn" >
			<button  type ="submit" >View Data Model</button>
			</div>
			
			<div class = "mapping_button">
			<button type ="submit"  formaction ="/mapping">Proceed With Mapping</button>	
			</div>
			</form>
			
	
			
		
			
	  <div class ="close_modulescreen"  onclick ="closeMapping()">
	  <span class="close">&times;</span>
	 </div>		
			
	
			
	
	</div>
	
	<!--    ------------------------------------------    -->
	
	
	
	






	<!-- ------------------------------------------------ -->
	
	
	
	
	</div>
	
	

<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
		
		
	</jsp:include>


<script>


const projectpage = document.getElementById('newprojectpage');
const databasedisplay = document.getElementById('databasepage');
//const images = document.getElementById("images");
const modules = document.getElementById("modules");
const arrowclick = document.getElementById("arrowclick");
const arrowclick1 = document.getElementById("arrowclick1");
const addmodules = document.getElementById("addmodules");
const openprojectpage=  document.getElementById("openprojectpage");
const displayproject = document.getElementById("displayproject");
//const settingspage = document.getElementById("settingspage");
//const settingspagefornewproject = document.getElementById("settingspagefornewproject");
const showaddedmodulesnames = document.getElementById("showaddedmodulesnames");
const addmodulenewprojectpage = document.getElementById("addmodulenewprojectpage");
var openedmodules = document.getElementById("openedmodules");
const openedaddmodule = document.querySelector(".openedaddmodule");
var existingmoduletable = document.getElementById("existingmoduletable");
var table2 = document.getElementById("table2");
var table1 = document.getElementById("table1")
var  showopenedmodulestable = document.getElementById("showopenedmodulestable");
var addmodules_openprojecttable = document.getElementById("addmodules_openprojecttable");
var showmodules = document.getElementById("show_modules");
var addmodules_openedproject = document.getElementById("addmodules_openedproject");
var module_hpba = document.getElementById("module_hpba")
const mapping_screen =document.getElementById("mapping_screen");
var table_data = document.getElementById("table_data");
var selectedprojectname= document.getElementById("selectedprojectname");
 var nameofproject= document.getElementById("nameofproject");

function closeMapping(){
	
	mapping_screen.style.display ="none";
}

openedaddmodule.addEventListener("click",()=>{
	
	
	addmodulenewprojectpage.style.display ="block";
	showmodules.style.display ="none";
	
	
	 
   for(var i=0; i<showopenedmodulestable.rows.length; i++)
	   {
	   for(j=0; j<table1.rows.length; j++)
	   {
			  if(table1.rows[j].cells[0].innerText == showopenedmodulestable.rows[i].innerText )
				  {
				
				table1.deleteRow(j);
				
				
				  }
			  
		  }
	   
	   }
   
   if(showopenedmodulestable.style.display ="block"){
		
		for(var i=0; i<table2.rows.length; i++){
			var index = table2.rows[i].rowIndex;
			table2.deleteRow(index);
			i--;
		}
		
		
		
		
	}
   if(table1.rows.length ==0){
	   addmodulenewprojectpage.style.display ="none";
   }
    
})



addmodules.addEventListener("click",()=>{
	
	addmodulenewprojectpage.style.display ="block";
	
	
	
	
		
		for(var i=0; i<table2.rows.length; i++){
			var index = table2.rows[i].rowIndex;
			table2.deleteRow(index);
			i--;
		}
	
	
	
	
	if(addmodules_openedproject.style.display ="block")
		{
		addmodules_openedproject.style.display ="none";
		}
	 if(table1.rows.length ==0){
		   addmodulenewprojectpage.style.display ="none";
	   }
	
})







function displayOpenprojectpage(){
	openprojectpage.style.display ="block";
	projectpage.style.display="none";
	 if(displayproject.style.display ="block"){
		 displayproject.style.display ="none"
	 }
	
	modules.style.display="none";
	addmodules.style.display ="none";
	existingmoduletable.style.display ="none";
	
}

arrowclick1.addEventListener("click",()=>{
	
	addmodules.style.display ="block"
	
	
});

arrowclick.addEventListener("click",()=>{


	modules.style.display ="block";
	//settingspagefornewproject.style.display ="block";
});



function popUp(){
	
	
	
	projectpage.style.display="block";
	 //images.style.display ="none";
	 
	 if(displayproject.style.display ="block"){
		 displayproject.style.display ="none";
	 }
}
 function displaysettingspage(){
	 
	 projectpage.style.display="none";
	//databasedisplay.style.display ="block";
	//images.style.display ="block";
	 
	
 }


function SaveModulesToController(){
	 
	 var existingmoduletable = document.getElementById("existingmoduletable");
	 var table2 = document.getElementById("table2");
	 var projectname = document.getElementById("arrowclick").innerHTML;
	 var openedprojectname = document.getElementById("openedprojectname").innerHTML;
		var modules =[];
		for (var i=0; i<table2.rows.length; i++)
		{
			
			
			modules.push({modulename:table2.rows[i].cells[0].innerHTML});
			
		}
		
		var openproject = openedprojectname.split(" ");
		console.log(openproject[1]);
		var text = projectname.split(" ");	
		if(text[1] ===""){
			modules.push({projectname:openproject[1]})
		}
		else{
		modules.push({projectname:text[1]})
		}
		console.log(modules);
		
		$.ajax({

			url:"/addmodules",

		    type: 'POST',

		    data :JSON.stringify(modules),
		   	
		    
		    dataType: "html",          

		    contentType: 'application/json',

		    mimeType: 'application/json',

		    success: function(data){ 
		    	
		        console.log("done");              

		        return false;  
		        } 

		    });

		  
		
		if(existingmoduletable.style.display ="block"){
			 for(var j=0; j<table2.rows.length; j++){
			
			var  newRow = existingmoduletable.insertRow(existingmoduletable.length),
			cell1 =newRow.insertCell(0);
			
			cell1.innerHTML = table2.rows[j].cells[0].innerHTML;
		}
			 
		   var rows = existingmoduletable.getElementsByTagName('tr');
			 for(j=0; j< rows.length; j++) {
			var currentRow = existingmoduletable.rows[j];		
			var createClickHandler = function(row){
				
			return function(){
				
				var cell = row.getElementsByTagName("td")[0];
				var id = cell.innerHTML;
				console.log(id);
			
				
				if(addmodulenewprojectpage.style.display ="block"){
					addmodulenewprojectpage.style.display ="none";
				}
				
				
				mapping_screen.style.display ="block";
				document.getElementById("selectedmodulesformapping").value = cell.innerHTML;
				
				 var x= document.getElementById("nameofproject").innerText;
				 y = x.split(" ");
				selectedprojectname.value = y[1];
				
				
			}
			}
		
			currentRow.onclick= createClickHandler(currentRow);
			
			
			}
		}
		
		if(existingmoduletable.style.display ="none"){
			for(var j=0; j<table2.rows.length; j++){
				
			
			var newRow = addmodules_openedproject.insertRow(addmodules_openedproject.length),
			cell1= newRow.insertCell(0);
			cell1.innerHTML = table2.rows[j].cells[0].innerHTML;
			
			}
			
			var rows = addmodules_openedproject.getElementsByTagName('tr');
			 for(j=0; j< rows.length; j++) {
			var currentRow = addmodules_openedproject.rows[j];		
			var createClickHandler = function(row){
				
			return function(){
				
				var cell = row.getElementsByTagName("td")[0];
				var id = cell.innerHTML;
				
				
				if(addmodulenewprojectpage.style.display ="block"){
					addmodulenewprojectpage.style.display ="none";
				}
            
				mapping_screen.style.display ="block";
				document.getElementById("selectedmodulesformapping").value = cell.innerHTML;
				var x= document.getElementById("nameofproject").innerText;
				 y = x.split(" ");
				selectedprojectname.value = y[1];
				
			}
			}
			
			currentRow.onclick= createClickHandler(currentRow);
			
			
			
			}
			
		
		}
	addmodulenewprojectpage.style.display="none";
	 existingmoduletable.style.display ="block"
	 
}


 
var rows = showopenedmodulestable.getElementsByTagName('tr');
 for(j=0; j< rows.length; j++) {
var currentRow = showopenedmodulestable.rows[j];		
var createClickHandler = function(row){
	
return function(){
	
	var cell = row.getElementsByTagName("td")[0];
	var id = cell.innerHTML;
	console.log(id);
	
	if(addmodulenewprojectpage.style.display ="block"){
		addmodulenewprojectpage.style.display ="none";
	}
	
	mapping_screen.style.display ="block";
	document.getElementById("selectedmodulesformapping").value = cell.innerHTML;
	var x= document.getElementById("nameofproject").innerText;
	 y = x.split(" ");
	selectedprojectname.value = y[1];
	
}
}

currentRow.onclick= createClickHandler(currentRow);

} 
 
 
</script>

</body>
</html>
