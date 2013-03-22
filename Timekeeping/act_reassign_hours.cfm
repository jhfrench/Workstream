
<!--Timekeeping/act_reassign_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I reassign hours.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> attributes.reassign_hours: list, delimited by |, that contains the user_account_id of an employee and the task_id of a task
 --->
<cfinclude template="qry_update_reassign_time_entries.cfm">
</cfsilent>