
<!--Timekeeping/pag_project_timeline.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I initially display a list of Project Timelines that the user can view. If there is only one project timeline then I automatically display that timeline.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_details" field_name="task_id" fuseaction="task_details">
<cfif isdefined("attributes.project_planning_id")>
	<cfinclude template="qry_get_project_timeline_details.cfm">
	<cfinclude template="dsp_project_timeline_details.cfm">

	<cfinclude template="qry_get_project_folder.cfm">
	<cfinclude template="dsp_project_files.cfm">
<cfelse>
	<cfinclude template="qry_get_project_timelines.cfm">
	<cfinclude template="dsp_select_project_timelines.cfm">
</cfif>

<cfif isdefined("attributes.project_planning_id")>
<form id="task_details" action="index.cfm?fuseaction=Timekeeping.act_upload_file" method="post" enctype="multipart/form-data" class="form-inline">
	<label for="file_path">Add File</label>
	<input type="file" name="file_path" id="file_path" value="" size="40" />
	<input type="hidden" name="pass_project_planning_id" value="<cfoutput>#project_planning_id#</cfoutput>" />
	<input type="submit" value="Upload file to server now" class="btn" />
</form>
</cfif>