<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Migration Tool</title>

<link href ="css/view_model.css" rel="stylesheet">
<style>
.header-heading p{
font-size:26px;
}
.backbutton{
margin-top:37px;
}

</style>
</head>
<body>

<jsp:include page="header.jsp">
		<jsp:param name="abc" value="wee" />
		
	</jsp:include>

	
	
	<div class ="mappingscreen1">
	
	
	<form class ="migrationmodule1" action ="/users/export/pdf">
	<div class ="inputtext1" >
	<input type ="text" name ="modulename" class ="text"
	value = "${modulename}" >
	
	</div>
	    <div class ="pdfbutton">
		  <button>Export to PDF</button>
		  </div>
	
	<div class ="excelbutton">
		  <button type ="submit"  formaction ="/users/export/excel">Export to Excel</button>
		  </div>
	
			</form>
			
			<div>
			<form action ="/open" method ="post">
			<div class ="projectdata">
			
	<input type ="text" value ="${projectid}" name="dropdown" style ="display:none;">
	
	</div>
	<div class ="backbutton">
	<button >Go Back To Select Another Module</button>
	</div>	
	</form>
	</div>
	
	<div class ="tablemodifier">
<table>
<thead>
<tr>

<th>FCM_TABLE_NAME</th>
<th>FCM_FIELD_NAME</th>
<th>FCM_FIELD_TYPE</th>
<th>FCM_FIELD_SIZE</th>
<th >FCM_NULL_CONSTRAINTS</th>
<th >FCM_DATA_DEFAULT</th>
<th >FCM_COLUMN_ID</th>

</tr>
</thead>

<c:forEach items="${finalList}" var="modulestable1"  >
<tbody>
 <tr>
 
 <td >${modulestable1.TABLE_NAME}</td>
 
 
	<td >${modulestable1.COLUMN_NAME}</td>
  
  
	<td >${modulestable1.DATA_TYPE}</td>
	 <td>${modulestable1.DATA_LENGTH}</td>
  
	<td >${modulestable1.NULLABLE}</td>
 
	<td >${modulestable1.DATA_DEFAULT}</td>
 
	<td >${modulestable1.COLUMN_ID}</td>
	
   
  </tr>
</tbody>
   </c:forEach>
   
   
 </table>
</div>
	</div>
	
	<jsp:include page="footer.jsp">
		<jsp:param name="footer" value="bootom" />
	</jsp:include>
	









</body>
</html>