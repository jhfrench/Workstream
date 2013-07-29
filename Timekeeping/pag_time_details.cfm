
<!--Timekeeping/pag_time_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfif isdefined("attributes.reassign_hours")>
	<cfinclude template="qry_update_reassign_time_entries.cfm">
</cfif>
<cfinclude template="qry_get_time_details.cfm">
<cfinclude template="qry_get_task_details.cfm">
<cfinclude template="qry_get_task_accumulated.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="individual_time" fuseaction="Timekeeping.individual_time" field_name="user_account_id" field2_name="task_id" field2_value="#attributes.task_id#">
<cfform name="time_details" action="index.cfm?fuseaction=Timekeeping.time_details" method="POST">
<cfinclude template="dsp_task_description.cfm">
<cfif len(get_task_accumulated.budgeted_hours) AND get_task_accumulated.budgeted_hours GT 0>
	<cfinclude template="dsp_time_details_graph.cfm">
</cfif>
<cfif get_time_details.recordcount>
	<cfmodule template="../common_files/qry_get_open_tasks.cfm" exclude_task_id="#attributes.task_id#">
	<cfinclude template="dsp_time_details.cfm">
	<cfinclude template="dsp_time_reassign_tasks.cfm">
<cfelse>
	<cfinclude template="dsp_no_entries.cfm">
</cfif>
</cfform>