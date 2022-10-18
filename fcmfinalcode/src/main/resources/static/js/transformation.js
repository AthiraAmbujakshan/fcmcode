/**
 * 
 */

function upFunction() {

	var desttable1 = document.getElementById('destinationtable');
	var cells = desttable1.getElementsByTagName('td');
	var desttablerows = desttable1.getElementsByTagName('tr');
	for (j = 0; j < desttablerows.length; j++) {
		if (desttablerows[j].style.backgroundColor == "yellow") {
			if (j != 1) {
				var swap = desttablerows[j].innerHTML;
				

				var swaping = desttablerows[j - 1].innerHTML;

				desttablerows[j].innerHTML = "";

				desttablerows[j - 1].innerHTML = "";

				desttablerows[j].innerHTML = swaping;
				desttablerows[j - 1].innerHTML = swap;

				highlight_row_dest();

			}

		}
	}
}

function selectAllRows(source) {

	var checkboxes = document.getElementsByName("checkrow");

	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = source.checked;
	}
	var selectmultiple = document.getElementById('selectmultiple');
	selectmultiple.checked = false;
}

function UpdateRow() {
	var checkboxes = document.getElementsByName("checkrow");
	var look_up_table = document.getElementById('look_up_table');

	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) {
			var look_up_name = document.getElementsByName('lookupname')[i];
			look_up_name.disabled = false;

			var loop_up_value = document.getElementsByName('lookupvalue')[i];
			loop_up_value.disabled = false;

			var loop_up_value = document.getElementsByName('lookupdesc')[i];
			loop_up_value.disabled = false;
		}

	}

}

function deleteRow() {

	var checkboxes = document.getElementsByName("checkrow");
	var look_up_table = document.getElementById('look_up_table');
	for (var i = 0; i < checkboxes.length; i++) {
		if (checkboxes[i].checked) {

			var index = look_up_table.rows[i + 1].rowIndex;

			look_up_table.deleteRow(index);
			i--;
		}
	}

}

function addRow() {
	var look_up_table = document.getElementById('look_up_table')
	var row = look_up_table.insertRow(look_up_table.length);
	var cell1 = row.insertCell(0);
	cell1.innerHTML = "<input type ='checkbox' name ='checkrow'>";

	var cell2 = row.insertCell(1);
	cell2.innerHTML = "<input    type =text name ='lookupname' >";

	var cell3 = row.insertCell(2);
	cell3.innerHTML = "<input   type =text  name ='lookupvalue'>";

	var cell4 = row.insertCell(3);
	cell4.innerHTML = "<input  type =text name ='lookupdesc'>";

	var lookupnamecol = document.getElementsByName("lookupname");
	for (var i = 1; i < lookupnamecol.length; i++) {
		if (lookupnamecol[i - 1].value !== null) {
			var look_up_name = document.getElementsByName('lookupname')[i - 1];
			look_up_name.disabled = true;

		}

	}

	var lookupvaluecol = document.getElementsByName("lookupvalue");

	for (var j = 1; j < lookupvaluecol.length; j++) {

		if (lookupvaluecol[j - 1].value !== null) {
			var loop_up_value = document.getElementsByName('lookupvalue')[j - 1];
			loop_up_value.disabled = true;
		}

	}

	var lookupdesc = document.getElementsByName("lookupdesc");

	for (var k = 1; k < lookupdesc.length; k++) {

		if (lookupdesc[k - 1].value !== null) {
			var loop_up_desc = document.getElementsByName('lookupdesc')[k - 1];
			loop_up_desc.disabled = true;
		}

	}

}

function lookuptable() {
	
	var lookup_screen = document.getElementById('lookup_screen');
	lookup_screen.style.display = "block";
	

	row_select();

}

function row_select() {

	var lookupnamecol = document.getElementsByName("lookupname");
	for (var i = 0; i < lookupnamecol.length; i++) {
		if (lookupnamecol[i].value !== null) {
			var look_up_name = document.getElementsByName('lookupname')[i];
			look_up_name.disabled = true;

		}

	}

	var lookupvaluecol = document.getElementsByName("lookupvalue");

	for (var j = 0; j < lookupvaluecol.length; j++) {

		if (lookupvaluecol[j].value !== null) {
			var loop_up_value = document.getElementsByName('lookupvalue')[j];
			loop_up_value.disabled = true;
		}

	}

	var lookupdesc = document.getElementsByName("lookupdesc");

	for (var k = 0; k < lookupdesc.length; k++) {

		if (lookupdesc[k].value !== null) {
			var loop_up_desc = document.getElementsByName('lookupdesc')[k];
			loop_up_desc.disabled = true;
		}

	}

}

function downFunction() {

	var desttable1 = document.getElementById('destinationtable');

	var desttablerows = desttable1.getElementsByTagName('tr');
	for (j = 0; j < desttablerows.length; j++) {
		if (desttablerows[j].style.backgroundColor == "yellow") {

			if (j != desttablerows.length)
				var swap = desttablerows[j].innerHTML;
			var swaping = desttablerows[j + 1].innerHTML;

			desttablerows[j].innerHTML = "";
			desttablerows[j + 1].innerHTML = "";

			desttablerows[j].innerHTML = swaping;
			desttablerows[j + 1].innerHTML = swap;
			highlight_row_dest();

		}
	}

}

function FreezeMapping() {
	var modal = document.getElementById("myModal");
	modal.style.display = "block";

}
