
<!--Timekeeping/dsp_task_new_col_right.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project or engagement the task is assigned to
 --->
<cfset alt="See more projects.">
<cfset msg="Please choose a project code.">
</cfsilent>

<script language="JavaScript" type="text/javascript">
<!--
function checkTheDescription(arg){
	if (arg == "to_inbox"){
		document.task_details.to_inbox.value = 1
	}else if (arg == "to_edit"){
		document.task_details.to_edit.value = 1
		}	
	var theValue = document.task_details.task_details.value;
	document.task_details.task_details.value = myTrim(theValue);
	if(!document.task_details.task_details.value.length){
		alert("Please insert a task description");
		return false;
	}
	else {
		if (_CF_checktask_details(document.task_details)){
		document.task_details.submit();
		}
	}		
}

function myTrim(inputString) {
// Removes leading and trailing spaces from the passed string. Also removes
// consecutive spaces and replaces it with one space. If something besides
// a string is passed in (null, custom object, etc.) then return the input.
var carriageReturn = new RegExp("\r");

//alert("-->" + carriageReturn.test(inputString) + "<--" + "-->" + inputString.length + "<--");
//if (typeof inputString != "string") { 
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
	//alert("Point 2 -->" + ch + "  " + retValue);
}

while (retValue.indexOf("  ") != -1) { // Note that there are two spaces in the string - look for multiple spaces within the string
   retValue = retValue.substring(0, retValue.indexOf("  ")) + retValue.substring(retValue.indexOf("  ")+1, retValue.length); // Again, there are two spaces in each of the strings
	}

}				
return retValue;
}


//-->
</SCRIPT>
<cfoutput>
<table border="0" cellpadding="0" cellspacing="2">
	<tr bordercolor="##ffffff">
		<td class="SubHeadText" valign="baseline">
			Task Name <img src="#request.dir_level##application.application_specific_settings.image_dir#popup_icon.gif" valign="bottom" width="14" height="12" alt="See pre-defined task names." border="0"  onclick="OpenPreTaskWindow('task_name');" tabindex="<cfset tabindex=incrementvalue(tabindex)>#incrementvalue(tabindex)#"><!--- <cfset tabindex=incrementvalue(tabindex)> <img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" valign="bottom" width="15" height="15" alt="Check spelling for the task name." border="0"  onclick="OpenWLWindow('task_name');" tabindex="#tabindex#"> ---><br />
			<cfinput type="text" name="task_name" value="" required="Yes" message="Please enter a task name." size="70" tabindex="#tabindex#" maxlength="255" class="RegText">
		</td>
	</tr>
	<cfinclude template="dsp_project_select_list.cfm">
	<tr>
		<td class="SubHeadText" valign="top">
			Description<!--- <cfset tabindex=incrementvalue(tabindex)> <img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" valign="bottom" width="15" height="15" alt="Check spelling for the task details." border="0"  onclick="OpenWLWindow('task_details');" tabindex="#tabindex#"> ---><br />
			
			<textarea name="task_details" cols="#variables.cols#" rows="6" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" wrap="soft" class="RegText"></textarea><br />
	</cfoutput>
			<cfinclude template="dsp_associated_files.cfm"><br />
			<cfinclude template="dsp_associated_tasks.cfm">
		</td>
	</tr>
</table>

