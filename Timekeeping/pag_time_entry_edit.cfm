
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
	--> [attributes.given_referer]: number that corresponds to a Time_Entry.time_entry_id
	--> [attributes.time_entry_id]: number that corresponds to a Time_Entry.time_entry_id
	<-- attributes.given_referer: number set from attributes.cftreeitemkey if it exists, otherwise from attributes.time_entry_id, corresponds to a Time_Entry.time_entry_id
 --->
</cfsilent>
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfif isdefined("attributes.method")>
	<cfinclude template="act_upload_time_entry_edits.cfm">
</cfif>
<cfinclude template="../common_files/qry_get_valid_projects.cfm">
<cfinclude template="../common_files/qry_get_ref_notes_type.cfm">
<cfinclude template="qry_get_time_entry_details.cfm">
<cfinclude template="dsp_time_entry_edit.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="note_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="return_to_referer" field_name="task_id" fuseaction="#attributes.given_referer#">