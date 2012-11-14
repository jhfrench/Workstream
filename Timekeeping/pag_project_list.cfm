
<!--Timekeeping/pag_project_list.cfm
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
<cfinclude template="../common_files/dsp_dropdowns.cfm">
<cfinclude template="act_project_list_order.cfm">
<cfinclude template="../common_files/qry_project_list.cfm">
<cfset variables.workstream_project_list_order=session.workstream_project_list_order>

<cfinclude template="dsp_project_list.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project_order" field_name="order_by" field2_name="reorder" field2_value="1" fuseaction="Timekeeping.project_list">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project_to_tasks" field_name="project_id" fuseaction="Timekeeping.task_list">