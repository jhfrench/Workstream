
<!--Timekeeping/qry_update_task_project_id.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task owner.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_project_id" datasource="#application.datasources.main#">
UPDATE Task
SET project_id=#attributes.project_id#
WHERE task_id=#attributes.task_id#

UPDATE Time_Entry
SET project_id=#attributes.project_id#
WHERE task_id=#attributes.task_id#
	AND time_entry_id NOT IN (
		SELECT time_entry_id
		FROM Link_Invoice_Time_Entry
			INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
		WHERE Link_Invoice_Time_Entry.active_ind=1
			AND Invoice.active_ind=1
		GROUP BY time_entry_id
	)
</cfquery>
</cfsilent>

