
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
<cfparam name="attributes.order_by" default="date_due">
</cfsilent>
	<cfinclude template="../common_files/act_client_vars.cfm">
	<cfinclude template="act_task_list_order.cfm">
	<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
		<cfinclude template="qry_task_list.cfm">
		<cfif NOT task_list.recordcount>
			<cfinclude template="dsp_dropdowns.cfm">
			<cfinclude template="dsp_task_list_header.cfm">
		</cfif>
		<cfinclude template="dsp_task_list.cfm">
	</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="order_by" field_name="order_by" field2_name="reorder" field2_value="1" fuseaction="Timekeeping.task_list" processform="true">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" field_name="task_id" fuseaction="Timekeeping.time_details">