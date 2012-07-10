
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
	--> attributes.reassign_hours: list, delimited by |, that contains the emp_id of an employee and the task_id of a task
 --->
<cfloop list="#attributes.reassign_hours#" index="ii">
	<cfinclude template="qry_reassign_hours.cfm">
</cfloop>
</cfsilent>