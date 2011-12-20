
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset variables.var1=450>
</cfsilent>
<cfinclude template="../common_files/qry_express_check_date.cfm">
<cfif isdefined("attributes.reassign_hours")>
	<cfinclude template="act_reassign_hours.cfm">
</cfif>
<cfinclude template="qry_get_time_details.cfm">
<cfinclude template="../common_files/qry_get_task_details.cfm">
<cfinclude template="qry_get_task_accumulated.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_to_ind" field_name="emp_id_task_id" field_value=0 fuseaction="Timekeeping.individual_time">
<cfform name="time_details" action="index.cfm?fuseaction=Timekeeping.time_details" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title=" #get_task_details.task_name# time entries" section_color="78A0EB" colspan="5" title_class="HeadTextWhite">
	<cfinclude template="dsp_task_description_header.cfm">
	<cfinclude template="dsp_task_description.cfm">
<cfif len(get_task_accumulated.budgeted_hours) AND get_task_accumulated.budgeted_hours GT 0>
	<cfinclude template="dsp_time_details_graph.cfm">
</cfif>
<cfif get_time_details.recordcount>
	<cfinclude template="../common_files/qry_get_open_tasks.cfm">
	<cfinclude template="dsp_time_details_header.cfm">
	<cfinclude template="dsp_time_details_row.cfm">
	<cfinclude template="dsp_time_reassign_tasks.cfm">
	<cfinclude template="dsp_time_details_buttons.cfm">
<cfelse>
	<cfinclude template="dsp_no_entries.cfm">
</cfif>
</table>
</cfform>

