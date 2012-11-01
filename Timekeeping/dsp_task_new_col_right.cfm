
<!--Timekeeping/dsp_task_new_col_right.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project or engagement the task is assigned to
 --->
</cfsilent>

<script language="JavaScript" type="text/javascript">
<!--
function checkTheDescription(arg){
	if (arg == "to_inbox") {
		document.new_task_form.to_inbox.value = 1
	}
	else if (arg == "to_edit") {
		document.new_task_form.to_edit.value = 1
	}
	var theValue = document.new_task_form.task_details.value;
	document.new_task_form.task_details.value = myTrim(theValue);
	if(!document.new_task_form.task_details.value.length){
		alert("Please insert a task description");
		return false;
	}
	else {
		if (_CF_checknew_task_form(document.new_task_form)){
		document.new_task_form.submit();
		}
	}
}

function myTrim(inputString) {
// Removes leading and trailing spaces from the passed string. Also removes
// consecutive spaces and replaces it with one space. If something besides
// a string is passed in (null, custom object, etc.) then return the input.
var carriageReturn = new RegExp("\r");

//alert("-->" + carriageReturn.test(inputString) + "<--" + "-->" + inputString.length + "<--");
//if (typeof inputString!="string") { 
//	return inputString;
//	}
var retValue = inputString;
while (retValue.substring(0, 1) == " " || carriageReturn.test(retValue.substring(0, 1)) || retValue.substring(retValue.length-1, 1) == " " || carriageReturn.test(retValue.substring(retValue.length-3, retValue.length-1))) {
var ch = retValue.substring(0, 1);
while (ch == " ") { // Check for spaces at the beginning of the string
   retValue = retValue.substring(1, retValue.length);
   ch = retValue.substring(0, 1);
	}
while (carriageReturn.test(ch)) {// Check for carriage returns at the beginning of the string
//alert(carriageReturn.test(retValue) + " start");
retValue = retValue.substring(2, retValue.length);
//alert(retValue);
ch = retValue.substring(0, 1);
}

ch = retValue.substring(retValue.length-1, 1);
while (ch == " ") { // Check for spaces at the end of the string
   retValue = retValue.substring(0, retValue.length-1);
   ch = retValue.substring(retValue.length-1, retValue.length);
	}
ch = retValue.substring(retValue.length-3, retValue.length-1);
//alert("Point 1 -->" + ch);
while (carriageReturn.test(ch)) { // Check for carriage returns at the end of the string
  // alert(carriageReturn.test(retValue) + " end");
retValue = retValue.substring(0, retValue.length-2);
   ch = retValue.substring(retValue.length-3, retValue.length-1);
	//alert("Point 2 -->" + ch + " " + retValue);
}

while (retValue.indexOf(" ")!=-1) { // Note that there are two spaces in the string - look for multiple spaces within the string
   retValue = retValue.substring(0, retValue.indexOf(" ")) + retValue.substring(retValue.indexOf(" ")+1, retValue.length); // Again, there are two spaces in each of the strings
	}

}
return retValue;
}


//-->
</script>
<cfoutput>
<div class="row-fluid">
	<div class="span12">
		<label for="task_name">Task Name <i class="icon-share" title="See pre-defined task names." onclick="OpenPreTaskWindow('task_name');"></i></label>
		<cfinput type="text" name="task_name" id="task_name" value="" required="yes" message="Please enter a task name." size="70" maxlength="255" class="span12">
	</div>
</div>
<cfinclude template="dsp_project_select_list.cfm">
<div class="row-fluid">
	<div classs="span12">
		<label for="task_details">Description</label>
		<textarea name="task_details" id="task_details" cols="#variables.cols#" rows="6" wrap="soft" class="span12"></textarea>
	</div>
</div>
</cfoutput>