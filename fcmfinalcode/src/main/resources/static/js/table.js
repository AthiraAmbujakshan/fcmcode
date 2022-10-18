

function table1_To_table2(){
		
		
	var table1 = document.getElementById("table1"),
	   table2 = document.getElementById("table2"),
	   checkboxes = document.getElementsByName("checkbtn");
	for(var i=0;i<checkboxes.length;i++)
	{
		if(checkboxes[i].checked)
		{
			var  newRow = table2.insertRow(table2.length),
			cell1 =newRow.insertCell(0);
			cell2= newRow.insertCell(1);
			
			
			cell1.innerHTML = table1.rows[i].cells[0].innerHTML;
			cell2.innerHTML = "<input type ='checkbox' name ='check_remove'>";
			
			var index = table1.rows[i].rowIndex;
			table1.deleteRow(index);
			i--;
			}
	}
	
	
	
}

function reverse(){
		
		
	var table1 = document.getElementById("table1"),
	   table2 = document.getElementById("table2"),
	   checkboxes = document.getElementsByName("check_remove");
	for(var i=0;i<checkboxes.length;i++)
	{
		if(checkboxes[i].checked)
		{
		var  newRow = table1.insertRow(table1.length),
		cell1 =newRow.insertCell(0);
		cell2= newRow.insertCell(1);
		
		
		cell1.innerHTML = table2.rows[i].cells[0].innerHTML;
		console.log(table2.rows[i].cells[0].innerHTML)
		cell2.innerHTML = "<input type ='checkbox' name ='checkbtn'>";
		
		var index = table2.rows[i].rowIndex;
		table2.deleteRow(index);
		i--;
		}
	}		
	
}


