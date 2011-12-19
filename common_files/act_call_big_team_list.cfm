
<!--common_files/act_call_big_team_list.cfm
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
Revision 1.0  2005/02/15 20:40:58  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:06-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfparam name="attributes.dir_level" default="#request.dir_level#">
</cfsilent>
<cfoutput>
<script language="JavaScript">
<!--
function OpenTeamWindow(arg, arg1){
<cfloop list="task_owner,task_qa" index="ii">
if (arg == "#ii#")
{
	document.forms[0].#ii#.value = window.showModalDialog('#attributes.dir_level#common_files/index.cfm?fuseaction=team_list&formname=#ii#&company_select_list=#session.workstream_company_select_list#',"#ii#","center=yes;dialogWidth=350pt;dialogHeight=400pt");
}
</cfloop>
  }
//-->
</script>
</cfoutput>