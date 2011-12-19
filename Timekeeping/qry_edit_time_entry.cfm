
<!--Timekeeping/qry_edit_time_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the Time_Entry table with the information returned from pag_time_entry_edit.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> [attributes.delete]: boolean that indicates a the specified record should be deleted from the table. If attributes.delete does not exist than the record should be updated with the provided data.
	--> attributes.date: date that the user wishes to update the Time_Entry.date field with.
	--> attributes.hours: number of hours that the user wishes to update the Time_Entry.hours field with.
	--> attributes.time_entry_id: number that corresponds to the identity column of the Time_Entry table.
 --->
<cfquery name="edit_time_entry" datasource="#application.datasources.main#">
<cfif isdefined("attributes.delete")>
DELETE FROM Time_Entry
<cfelse>
UPDATE Time_Entry
SET Date=#CreateODBCDate(attributes.date)#, hours=#attributes.hours#
<cfif isdefined("attributes.project_id")>
, Project_id=#attributes.project_id#
</cfif>
</cfif>
WHERE time_entry_id=#attributes.time_entry_id#
</cfquery>
</cfsilent>

