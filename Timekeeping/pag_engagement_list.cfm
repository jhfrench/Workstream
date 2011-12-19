
<!--Timekeeping/pag_engagement_list.cfm
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
<cfparam name="attributes.order_by" default="project_end">
<cfinclude template="../common_files/act_client_vars.cfm">
</cfsilent>
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfinclude template="act_engagement_list_order.cfm">
	<cfif isdefined("session.workstream_workstream_user")>
	<cfinclude template="../common_files/qry_engagement_list.cfm">
		<cfinclude template="dsp_dropdowns.cfm">
		<cfinclude template="dsp_engagement_list_header.cfm">
		<cfinclude template="dsp_engagement_list.cfm">
	</cfif>
</table>
<br>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project_order" field_name="order_by" field2_name="reorder" field2_value="1" fuseaction="engagement_list">
	<cfif isdefined("session.workstream_workstream_user")>
		<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project_to_tasks" field_name="project_id" fuseaction="Timekeeping.task_list">
	</cfif>