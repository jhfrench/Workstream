
<!--Tools/pag_forceplanner_save.cfm
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
Revision 1.1  2005/12/20 20:22:44  french
Minor modifications to line up the columns on the output and to speed up the output. Task 38852

Revision 1.0  2005-02-15 16:01:40-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:16-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfset variables.show_submit_button=0>
<cfset variables.task_assigned=0>
<cfset variables.task_remainder=0>
</cfsilent>
<cfinclude template="act_forceplanner_queries.cfm">
<cfinclude template="act_forceplanner_save.cfm">
<cfinclude template="act_forceplanner.cfm">
<cfform name="forceplanner" action="index.cfm?fuseaction=Tools.forceplanner_save" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="772862" section_title="&nbsp;#session.workstream_company_name# ForcePlanner" colspan="#variables.colspan+1#" gutter=1>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
	<cfinclude template="dsp_forceplanner_save_rows.cfm">
	<cfinclude template="dsp_forceplanner_sub_head.cfm">
	<cfinclude template="dsp_forceplanner_sub_assigned_row_save.cfm">
	<cfinclude template="dsp_forceplanner_sub_available_row.cfm">
	<cfinclude template="dsp_forceplanner_sub_capacity_row_save.cfm">
</table>
</cfform>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_project" field_name="project_id" fuseaction="Customers.edit_engagement" target="edit_engagement">

