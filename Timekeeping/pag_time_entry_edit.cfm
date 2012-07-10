
<!--Timekeeping/pag_time_entry_edit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a page that lets the user edit or delete an existing time entry and its note.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> [attributes.cftreeitemkey]: number returned from the express entry cftree that corresponds to a Time_Entry.time_entry_id
	--> [attributes.referer]: number that corresponds to a Time_Entry.time_entry_id
	--> [attributes.time_entry_id]: number that corresponds to a Time_Entry.time_entry_id
	<-- attributes.referer: number set from attributes.cftreeitemkey if it exists, otherwise from attributes.time_entry_id, corresponds to a Time_Entry.time_entry_id
	<-- request.time_entry_id: number that corresponds to a Time_Entry.time_entry_id
 --->
<cfif isdefined("attributes.cftreeitemkey")>
	<cfset request.time_entry_id=attributes.cftreeitemkey>
<cfelseif isdefined("attributes.time_entry_id")>
	<cfset request.time_entry_id=attributes.time_entry_id>
</cfif>
</cfsilent>
<cfinclude template="../common_files/qry_express_check_date.cfm">
<cfif isdefined("attributes.referer")>
	<cfinclude template="act_upload_time_entry_edits.cfm">
	<cflocation url="index.cfm?fuseaction=#attributes.referer#" addtoken="No">
<cfelse>
	<cfinclude template="qry_entry_type.cfm">
	<cfinclude template="qry_time_entry_edit.cfm">
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="note_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
	<cfform action="index.cfm?fuseaction=Timekeeping.time_entry_edit" name="time_entry_edit" method="POST">
	<table align="center" border="0" cellpadding="1" cellspacing="0">
		<cfinclude template="dsp_time_entry_edit_row.cfm">
		<cfinclude template="dsp_time_entry_edit_buttons.cfm">
	</table>
	</cfform>
</cfif>
