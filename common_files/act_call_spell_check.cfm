
<!--common_files/act_call_spell_check.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I use javascript to call a small child window that display the spell check entry form.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.dir_level" default="#request.dir_level#">
</cfsilent>
<cf_htmlhead>
<cfoutput>
<script language="JavaScript">
<!--
function OpenWLWindow(arg, arg1){
<cfloop list="notes,task_details,task_name" index="ii">
if (arg == "#ii#")
	{window.open('index.cfm?fuseaction=common_files.spell_entry&formname=#ii#',"#ii#","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=No,copyhistory=0,width=500,height=320");}
</cfloop>
  }
//-->
</script>
</cfoutput>
</cf_htmlhead>

