
<!--common_files/act_call_change_engagement.cfm
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
Revision 1.1  2005/03/09 18:19:45  stetzer
<>

Revision 1.1  2001-10-11 10:55:22-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfparam name="attributes.dir_level" default="#request.dir_level#">
</cfsilent>
<cf_htmlhead>
<cfoutput>
<script language="JavaScript">
<!--
	function OpenCEWindow(arg, arg1){
	<cfloop list="project_id" index="ii">
	if (arg == "#ii#")
	{
		document.forms[0].#ii#.value = window.showModalDialog('#attributes.dir_level#common_files/index.cfm?fuseaction=project_list&formname=#ii#&company_select_list=#session.workstream_company_select_list#&date=#DateFormat(now(),"mm/dd/yy")#&hour=#hour(now())#&minute=#minute(now())#',"#ii#","center=yes;dialogWidth=350pt;dialogHeight=400pt");
	}
	</cfloop>
	  }
//-->
</script>
</cfoutput>
</cf_htmlhead>
