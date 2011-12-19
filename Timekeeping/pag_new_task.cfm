
<!--Timekeeping/pag_new_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the page that allows the user to specify task details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfparam name="session.workstream_last_loaded" default="#now()#">
<cfif isdefined("attributes.last_loaded") AND session.workstream_last_loaded NEQ attributes.last_loaded>
	<cfinclude template="act_create_new_task.cfm">
	<cfmodule template="act_send_notification.cfm" note_type="new_task" task_id="#attributes.task_id#">
	<cfset session.workstream_last_loaded=attributes.last_loaded>
		<cfif isdefined("attributes.to_inbox") AND len(attributes.to_inbox)>
			<cflocation url="index.cfm?fuseaction=Timekeeping.task_list" addtoken="No">
		<cfelseif isdefined("attributes.to_edit") AND len(attributes.to_edit)>
			<form name="to_edit" action="index.cfm?fuseaction=Timekeeping.task_details" method = "post">
				<input type="hidden" name="task_id" value="<cfoutput>#insert_new_task.task_id#</cfoutput>">
			</form>	
			<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
		    <!--
		    	document.to_edit.submit();
		    //-->
		    </SCRIPT>
		</cfif>
<cfelse>
	<cfinclude template="dsp_no_new_task.cfm">
</cfif>
<cfinclude template="qry_get_priorities.cfm">
<cfinclude template="qry_get_icons.cfm"><!--- 
<cfinclude template="qry_get_notification_frequency.cfm"> --->
<cfinclude template="qry_get_task_stati.cfm">
<iframe src="../common_files/pop_cal/popcjs.htm" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" scrolling="no" frameborder="0" style="border:ridge;visibility:hidden;position:absolute;z-index:65535"></iframe>
<!--- <cfinclude template="../common_files/dsp_pop_calendar.cfm">
<cfmodule template="../common_files/act_calendar.cfm" form_name="task_details" field_name="date_start,due_date"> --->
<cfinclude template="../common_files/qry_get_valid_projects.cfm">
<cfinclude template="../common_files/act_call_big_team_list.cfm">
<cfinclude template="act_call_pre_defined_names.cfm">
<cfinclude template="../common_files/act_call_big_project_list.cfm"><!--- 
<cfinclude template="../common_files/act_call_spell_check.cfm"> --->
<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="task_details" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Create A New Task" section_color="78A0EB" colspan="5" gutter="0" title_class="HeadText#session.workstream_text_size#">
	<cfinclude template="dsp_task_new_table.cfm">
</table>
</cfform>

