
<!--Timekeeping/qry_update_task_owner.cfm
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
<cfquery name="update_task_owner" datasource="#application.datasources.main#">
<cfif NOT comparenocase(listlast(attributes.fuseaction, '.'),"new_task")>
INSERT INTO Team (task_id, emp_id, role_id)
VALUES (#attributes.task_id#, #attributes.task_owner#, 1)
<cfelse>
UPDATE Team
SET emp_id=#attributes.task_owner#
WHERE task_id=#attributes.task_id#
	AND role_id=1
</cfif>
</cfquery>
</cfsilent>

