
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
Revision 1.0  2005/02/15 20:40:59  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:06-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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
	{window.open('#attributes.dir_level#common_files/index.cfm?fuseaction=spell_entry&formname=#ii#',"#ii#","toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=No,copyhistory=0,width=500,height=320");}
</cfloop>
  }
//-->
</script>
</cfoutput>
</cf_htmlhead>

