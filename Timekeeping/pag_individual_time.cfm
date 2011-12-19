
<!--Timekeeping/pag_individual_time.cfm
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
	Revision 1.1  2005/03/09 18:22:42  stetzer
	<>

	Revision 1.2  2001-11-12 12:43:46-05  french
	Moved qry_get_open_tasks.cfm from Timekeeping to common_files.

	Revision 1.1  2001-10-11 10:54:57-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset variables.var1=450>
</cfsilent>
<cfif isdefined("attributes.notes_id")>
	<cfinclude template="qry_reassign_entries.cfm">
</cfif>
<cfif isdefined("attributes.emp_id_task_id")>
	<cfloop list="#attributes.emp_id_task_id#" index="ii">
		<cfset attributes.emp_id=listgetat(ii,1,"|")>
		<cfset attributes.task_id=listgetat(ii,2,"|")>
	</cfloop>
</cfif>
<cfinclude template="../common_files/qry_express_check_date.cfm">
<cfinclude template="qry_get_ind_entry_details.cfm">
<cfinclude template="../common_files/qry_get_task_details.cfm">
<cfinclude template="qry_get_task_accumulated.cfm">
<cfinclude template="../common_files/qry_get_open_tasks.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_edit" field_name="time_entry_id" field_value=0 fuseaction="Timekeeping.time_entry_edit" given_referer="task_list">
<cfform name="time_details" action="index.cfm?fuseaction=Timekeeping.individual_time" method="POST">
<table align="center" border="0" cellpadding="2" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title=" #get_task_details.task_name# time entries" section_color="0000ff" colspan="6" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_task_description_header.cfm">
	<cfinclude template="dsp_task_description.cfm">
<cfif get_task_accumulated.budgeted_hours GT 0>
	<cfinclude template="dsp_time_details_graph.cfm">
</cfif>
<cfif get_ind_entry_details.recordcount>
	<cfinclude template="dsp_ind_entry_details_header.cfm">
	<cfinclude template="dsp_ind_entry_details_row.cfm">
	<cfinclude template="dsp_time_reassign_tasks.cfm">
	<cfinclude template="dsp_time_details_buttons.cfm">
<cfelse>
	<cfinclude template="dsp_no_entries.cfm">
</cfif>
</table>
</cfform>