
<!--Customers/pag_open_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="qry_get_open_tasks.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" fuseaction="Timekeeping.task_details" field_name="task_id">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="98%">
	<cfinclude template="dsp_dropdowns.cfm">
	<cfinclude template="dsp_open_tasks_row_header.cfm">
	<cfinclude template="dsp_open_tasks_rows.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="order_by" field_name="order_by" field2_name="reorder" field2_value="1" fuseaction="open_tasks">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" field_name="task_id" fuseaction="Timekeeping.time_details">

