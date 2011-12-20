
<!--Tools/pag_forceplanner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.force_month" default="#month(now())#">
<cfparam name="attributes.force_year" default="#year(now())#">
<cfset variables.show_submit_button=1>
</cfsilent>
<cfinclude template="act_forceplanner_queries.cfm">
<cfinclude template="act_forceplanner.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfinclude template="dsp_forceplanner_title_bar.cfm">
<cfform name="forceplanner" action="index.cfm?fuseaction=Tools.forceplanner_save" method="POST">
	<cfinclude template="dsp_forceplanner_main_head.cfm">
	<cfinclude template="dsp_forceplanner_assign_rows.cfm">
	<cfinclude template="dsp_forceplanner_sub_head.cfm">
	<cfinclude template="dsp_forceplanner_sub_assigned_row.cfm">
	<cfinclude template="dsp_forceplanner_sub_available_row.cfm">
	<cfinclude template="dsp_forceplanner_sub_capacity_row.cfm">
</cfform>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details" target="task_details">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_project" field_name="project_id" fuseaction="Customers.edit_engagement" target="edit_engagement">
</table>