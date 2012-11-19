
<!--Tools/pag_invoice_notes_drill_down.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfset attributes.user_account_id=ListFirst(attributes.user_account_id_project,"|")>
<cfset attributes.project_id=listlast(attributes.user_account_id_project,"|")>
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
</cfsilent>
<cfinclude template="../common_files/qry_get_demographics.cfm">
<cfinclude template="qry_invoice_notes_drill_down.cfm">
<cfinclude template="dsp_invoice_notes_drill_down.cfm">

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="note_to_task" field_name="task_id" fuseaction="Timekeeping.task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="time_entry_edit" field_name="time_entry_id" fuseaction="Timekeeping.time_entry_edit">