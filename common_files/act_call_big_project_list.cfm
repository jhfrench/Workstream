
<!--common_files/act_call_big_project_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I use javascript to call a small child window that displays the list of available projects.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.dir_level" default="#request.dir_level#">
<cfparam name="attributes.project_id" default="0">
</cfsilent>
<cfoutput>
<script language="JavaScript">
<!--
	function OpenProjectWindow(arg, arg1){
	<cfloop list="project_id" index="ii">
	if (arg == "#ii#")
	{
		var temp = document.forms[0].#ii#.value;
		document.forms[0].#ii#.value = window.showModalDialog('index.cfm?fuseaction=common_files.project_list&formname=#ii#&company_select_list=#session.workstream_selected_company_id#&date=#dateformat(now(),"mm/dd/yy")#&hour=#hour(now())#&minute=#minute(now())#&project_id=#attributes.project_id#',"#ii#","center=yes;dialogWidth=700pt;dialogHeight=350pt");
	if (document.forms[0].#ii#.value == 'undefined'
			||
			document.forms[0].#ii#.value.length == 0
		)
		
		{
			document.forms[0].#ii#.value = temp;
		}
		
	}
	</cfloop>
	  }
//-->
</script>
</cfoutput>

