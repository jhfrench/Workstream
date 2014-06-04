
<!--common_files/act_call_change_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I show a list of projects
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.dir_level" default="">
</cfsilent>
<cf_htmlhead>
<cfoutput>
<script language="JavaScript">
<!--
	function OpenCEWindow(arg, arg1){
	<cfloop list="project_id" index="ii">
	if (arg == "#ii#")
	{
		document.forms[0].#ii#.value = window.showModalDialog('#attributes.dir_level#common_files/index.cfm?fuseaction=project_list&formname=#ii#&company_select_list=#session.workstream_selected_company_id#&date=#dateformat(now(), "mm/dd/yyyy")#&hour=#hour(now())#&minute=#minute(now())#',"#ii#","center=yes;dialogWidth=350pt;dialogHeight=400pt");
	}
	</cfloop>
	  }
//-->
</script>
</cfoutput>
</cf_htmlhead>
