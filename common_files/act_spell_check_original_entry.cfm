
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
Revision 1.0  2005/02/15 20:41:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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

