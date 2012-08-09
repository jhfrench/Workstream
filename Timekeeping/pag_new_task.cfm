
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
			<script language="JavaScript" type="text/javascript">
		    <!--
		    	document.to_edit.submit();
		    //-->
		    </SCRIPT>
		</cfif>
<cfelse>
	<cfinclude template="dsp_no_new_task.cfm">
</cfif>
<cfinclude template="../common_files/qry_get_priorities.cfm">
<cfinclude template="qry_get_ref_icon.cfm"><!--- 
<cfinclude template="qry_get_notification_frequency.cfm"> --->
<cfinclude template="../common_files/qry_get_task_stati.cfm">
<cfinclude template="../common_files/qry_get_valid_projects.cfm">
<cfinclude template="../common_files/act_call_big_team_list.cfm">
<cfinclude template="act_call_pre_defined_names.cfm">
<cfinclude template="../common_files/act_call_big_project_list.cfm"><!--- 
<cfinclude template="../common_files/act_call_spell_check.cfm"> --->
<cfform action="index.cfm?fuseaction=#attributes.fuseaction#" name="new_task_form" method="POST">
	<h2>Create A New Task</h2>
	<cfinclude template="dsp_task_new_table.cfm">
</cfform>