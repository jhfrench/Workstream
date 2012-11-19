
<!--Timekeeping/pag_task_list.cfm
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
<cfparam name="attributes.order_by" default="due_date">
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../common_files/act_task_list_order.cfm">
<cfinclude template="qry_get_task_list.cfm">
<cfinclude template="../common_files/dsp_dropdowns.cfm">
<cfif task_list.recordcount>
<table class="table table-striped table-bordered table-condensed">
	<cfinclude template="../common_files/dsp_task_list_header.cfm">
	<cfinclude template="../common_files/dsp_task_list.cfm">
</table>
<cfelse>
	<div class="alert alert-info">
		You have no tasks that meet your criteria.
	</div>
</cfif>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="order_by" field_name="order_by" field2_name="reorder" field2_value="1" fuseaction="Timekeeping.task_list" processform="true">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" field_name="task_id" fuseaction="Timekeeping.time_details">