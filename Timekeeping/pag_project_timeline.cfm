
<!--Timekeeping/pag_project_timeline.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I initially display a list of Project Timelines that the user can view. If there is only one prject timeline then I automatically display that timeline.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_details" field_name="task_id" fuseaction="task_details">
<cfform name="project_timeline" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<cfif isdefined("attributes.project_planning_id")>
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfinclude template="qry_get_project_timeline_details.cfm">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;#get_project_timeline_details.project_planning_name#" section_color="78A0EB" colspan="8" gutter="0" title_class="HeadText">
	<cfinclude template="dsp_project_timeline_details.cfm">
</table>

<table border="0" cellpadding="1" cellspacing="0" width="60%">
	<cfinclude template="qry_get_project_folder.cfm">
	<cfinclude template="dsp_project_files.cfm">
</table>
<cfelse>
<table align="center" border="0" cellpadding="1" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Choose a Project Timeline" section_color="78A0EB" colspan="3" gutter="0" title_class="HeadText">
	<cfinclude template="qry_get_project_timelines.cfm">
	<cfinclude template="dsp_select_project_timelines.cfm">
</table>
</cfif>
</cfform>

<cfif isdefined("attributes.project_planning_id")>
<form name="task_details" action="index.cfm?fuseaction=Timekeeping.act_upload_file" method="post" enctype="multipart/form-data">
<cfoutput>
<table>
<Tr><Td class="RegText">
Add File:<br />
<input class="RegText" type="file" name="file_path" value="" size="40" >
<br />
<input class="RegText" type="submit" value="Upload file to server now">
<input class="RegText" type="hidden" name="pass_project_planning_id" value="#project_planning_id#">
</td></tr>
</table>
</cfoutput>
</form>
</cfif>