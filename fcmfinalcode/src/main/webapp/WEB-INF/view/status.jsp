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
	<link href="css/statuspage.css" rel="stylesheet">
<style>
body{
background-image:url("images/image1.jpg");
background-repeat:no repeat;
background-size:cover;
}


</style>
</head>
<body>

<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />

	</jsp:include>
<div class="flagerror" id ="errorflag" style="display:none;">
${flag}

</div>




<svg class ="rect1" >
<g>
  <rect width="180" height="100"  id ="firstrect"
 style="fill:rgb(255,255,255);stroke-width:5;stroke:grey" />
  <text x="10" y="50" font-family="Verdana" font-size="13" fill="black">Reading Source File</text>
  </g>
</svg>

 <div class ="success-checkmark1" id ="firsttick"> 
 <span>
 <i class="fas fa-check-circle"></i>
 </span>
 </div>
 <div class ="line1" >
 <hr id ="line_1">
 
 </div>
 <div class ="rect_2">
 <svg class ="rect2">
<g>
  <rect width="200" height="100" id ="secondrect"
 style="fill:rgb(255,255,255);stroke-width:5;stroke:grey" />
  <text x="10" y="50" font-family="Verdana" font-size="13" fill="black" >Transformation Prerequiste</text>
  </g>
</svg>
</div>
 <div class ="success-checkmark2" id ="secondtick"> 
 <span>
 <i class="fas fa-check-circle"></i>
 </span>
 </div>
 <div class ="line2"  >
 <hr id ="line_2">
 
 </div>
 
 
 
 <div class ="rect_3">
 <svg class ="rect3">
<g>
  <rect width="240" height="100"  id ="thirdrect"
 style="fill:rgb(255,255,255);stroke-width:5;stroke:grey" />
  <text x="10" y="50" font-family="Verdana" font-size="13" fill="black" >Preparing Transformation Logic</text>
  </g>
</svg>
</div>

 <div class ="success-checkmark3" id ="thirdtick"> 
 <span>
 <i class="fas fa-check-circle"></i>
 </span>
 </div>
 
 <div class ="line3"  >
 <hr id ="line_3">
 
 </div>
 <div class ="rect_4">
 <svg class ="rect4">
<g>
  <rect width="200" height="100"  id ="fourthrect"
 style="fill:rgb(255,255,255);stroke-width:5;stroke:grey" />
  <text x="10" y="50" font-family="Verdana" font-size="13" fill="black" >Data Migration In Progress</text>
  </g>
</svg>
</div>
 <div class ="success-checkmark4" id ="fourthtick"> 
 <span>
 <i class="fas fa-check-circle"></i>
 </span>
 </div>
 
 <div class ="line4" >
 <hr id="line_4">
 
 </div>
 
 <div class = rect5>
 
 
  <svg  class = rect_5>
<g>
  <rect width="180" height="100" id ="fifthrect"
 style="fill:rgb(255,255,255);stroke-width:5;stroke:grey" />
  <text x="10" y="50" font-family="Verdana" font-size="13" fill="black" >Data Migration Complete</text>
  </g>
</svg>  
</div>
   <div class ="success-checkmark5" id ="fifthtick"> 
 <span>
 <i class="fas fa-check-circle"></i>
 </span>
 </div> 
 
 
 <div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h3>Decision</h3>
			</div>
			<div class="modal-body">
				<pre>
Data migration process is completed for the selected module.
Want to proceed with other module transformations?
</pre>
<p>Click YES to proceed:NO to summary report</p>

			</div>
			<div class="modal-footer">
				<div class="buttons">
					<button onclick="yesbutton()">YES</button>
					<button id="nobtn"onclick ="nobutton()">NO</button>
				</div>
			</div>
		</div>

	</div>

 
 <div id="errorpopup" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="closebtn">&times;</span>
				<h3>Data Migration Failed</h3>
			</div>
			<div class="modal-body">
				<pre>
Data Migration process failed for the selected Module
please redo the Transformation?
</pre>
<p>Click OK to proceed</p>

			</div>
			<div class="modal-footer">
				<div class="yesbtn">
					<button onclick="navigate()">OK</button>
					
				</div>
			</div>
		</div>

	</div>
 
 
 
 
 <jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>
	
	
	
	<script>
	setTimeout(delayrect1, 2000);
	function delayrect1(){
		var firstrect =document.getElementById('firstrect');
		
		firstrect.style.stroke = "green";
		 document.getElementById('firsttick').style.display ="block";
	}
	
	setTimeout(delayrect2, 4000);
	function delayrect2(){
		var secondrect =document.getElementById('secondrect');
		
		secondrect.style.stroke = "green";
		 document.getElementById('secondtick').style.display ="block";
		 document.getElementById('line_1').style.height="0.5vh";
		 document.getElementById('line_1').style.backgroundColor ="green";
		 
		
	}
	
	setTimeout(delayrect3, 6000);
	function delayrect3(){
		var thirdrect =document.getElementById('thirdrect');
		
		
		thirdrect.style.stroke = "green";
		 document.getElementById('thirdtick').style.display ="block";
		 document.getElementById('line_2').style.height="0.5vh";
		 document.getElementById('line_2').style.backgroundColor ="green";
	}
	
	setTimeout(delayrect4, 8000);
	function delayrect4(){
		var fourthrect =document.getElementById('fourthrect');
		var flag = document.getElementById('errorflag');
		if(flag.innerHTML ==1){
			fourthrect.style.stroke = "red";
			document.getElementById('fourthtick').style.display ="none";
		}
		else{
		fourthrect.style.stroke = "green";
		document.getElementById('fourthtick').style.display ="block";
		}
		 
		 document.getElementById('line_3').style.height="0.5vh";
		 document.getElementById('line_3').style.backgroundColor ="green";
		
	}
	
	setTimeout(delayrect5, 10000);
	function delayrect5(){
		var fifthrect =document.getElementById('fifthrect');
		var flag = document.getElementById('errorflag');
		if(flag.innerHTML ==1){
			//fifthrect.style.stroke = "";
			document.getElementById('fifthtick').style.display ="none";
			document.getElementById('line_4').style.backgroundColor ="grey";
			 var errorpopup = document.getElementById('errorpopup');
				errorpopup.style.display ="block";
		}
		else{
			fifthrect.style.stroke = "green";
			document.getElementById('fifthtick').style.display ="block";
			document.getElementById('line_4').style.backgroundColor ="green";
			 var myModal = document.getElementById('myModal');
				myModal.style.display ="block";
		}
		
		 
		 document.getElementById('line_4').style.height="0.5vh";
		 
		 
		
	}
	

	var span = document.getElementsByClassName("close")[0];
	
	span.onclick = function() {
		myModal.style.display = "none";
	}
	 var closebtn =  document.getElementsByClassName("closebtn")[0];
	 closebtn.onclick = function() {
			errorpopup.style.display = "none";
		}
	
	function nobutton(){
		
		
				window.location = "http://localhost:8081/reportsummary";
				

			}
			
function yesbutton(){
	window.location = "http://localhost:8081/migration";
}
function navigate(){
	
		window.location = "http://localhost:8081/redotransformation";
	
	}
	
	


		
		
		
	
		

			

		
		
	</script>
</body>

</html>