
<!--common_files/act_spell_check_original_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I set a javascript variable called message to the value of the message passed in from the calling page (task details, for example).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cf_htmlhead>
<cfoutput>
<SCRIPT LANGUAGE="JavaScript">
	function ReturnForm() { 
		var dispVal
		document.spell.message.value = opener.document.task_details.#formname#.value;
	}
</SCRIPT>
</cfoutput>
</cf_htmlhead>

