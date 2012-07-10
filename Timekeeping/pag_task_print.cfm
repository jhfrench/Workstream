
<!--Timekeeping/pag_task_print.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task in an easily printed format.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset var1=200>
<cfset no_banner=1>
</cfsilent>
<cfinclude template="qry_get_task_details_enhanced.cfm">
<cfif get_task_details.recordcount>

	<cfset attributes.project_id=get_task_details.project_id>
	<cfset attributes.active_only=1>

	<cfinclude template="qry_get_task_team.cfm">
	<cfinclude template="qry_convert_source.cfm">
	<cfinclude template="qry_convert_owner.cfm">
	<cfinclude template="qry_convert_qa.cfm">
	<cfinclude template="qry_convert_team_members.cfm">
	<cfinclude template="../common_files/qry_get_associated_files.cfm">
	<cfinclude template="../common_files/qry_get_associated_tasks.cfm">	
	<cfinclude template="qry_time_entry_details.cfm">
	<cfinclude template="qry_qa_entry_details.cfm">
	<cfinclude template="../common_files/qry_get_user_fields.cfm"> 
<table align="center" border="1" bordercolor="#000000" cellpadding="3" cellspacing="0" width="95%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Task:&nbsp; #get_task_details.task_name# (#attributes.task_id#) - as of #Dateformat(now(),"mm/dd/yy")# at #hour(now())#:#minute(now())#" section_color="000000" colspan="7" gutter=0 title_class="HeadTextWhite">
	<cfinclude template="dsp_task_print_table.cfm">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" field_name="task_id" fuseaction="Timekeeping.task_details">
</table>
<cfelse>
<br />&nbsp;<br />&nbsp;<br />&nbsp;<br />&nbsp;
<cfoutput><div align="center" class="HeadText">There are no task details to show for task #attributes.task_id#</div></cfoutput>.
</cfif>

