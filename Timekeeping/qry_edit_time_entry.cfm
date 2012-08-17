
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
	--> attributes.date: date that the user wishes to update the Time_Entry.work_date field with.
	--> attributes.hours: number of hours that the user wishes to update the Time_Entry.hours field with.
	--> attributes.time_entry_id: number that corresponds to the identity column of the Time_Entry table.
 --->
</cfsilent>
<cfquery name="edit_time_entry" datasource="#application.datasources.main#">
UPDATE Time_Entry
SET active_ind=0
WHERE time_entry_id=#attributes.time_entry_id#
	AND time_entry_id NOT IN (SELECT time_entry_id FROM Link_Invoice_Time_Entry WHERE active_ind=1) /*don't update or delete invoiced time*/;
<cfif isdefined("attributes.method") AND comparenocase(attributes.method,"delete this entry")>
INSERT INTO Time_Entry (emp_id, work_date, hours,
	project_id, task_id, notes_id)
SELECT #session.user_account_id#, '#dateformat(attributes.date,"yyyy-mm-dd")#', #attributes.hours#,
	<cfif isdefined("attributes.project_id")>#attributes.project_id#<cfelse>project_id</cfif>, task_id, CURRVAL('Notes_notes_id_SEQ')
FROM Time_Entry
WHERE time_entry_id=#attributes.time_entry_id#
	AND time_entry_id NOT IN (SELECT time_entry_id FROM Link_Invoice_Time_Entry WHERE active_ind=1) /*don't update or delete invoiced time*/
</cfif>
</cfquery>

