
<!--Timekeeping/qry_get_editing_priveleges.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the emp_ids of the people who are allowed to edit a task (the owner, the creator, and the owner's supervisor).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_editing_priveleges" datasource="#application.datasources.main#">
SELECT Task.created_by AS editing_priveleges
FROM Task
WHERE Task.task_id=#attributes.task_id#
UNION ALL
SELECT Team.emp_id
FROM Team
WHERE Team.task_id=#attributes.task_id#
	AND Team.role_id IN (1,5)
UNION ALL
SELECT Link_Employee_Supervisor.supervisor_id
FROM Link_Employee_Supervisor
	INNER JOIN Team ON Link_Employee_Supervisor.user_account_id=Team.emp_id
		AND Link_Employee_Supervisor.active_ind=1
WHERE Team.task_id=#attributes.task_id#
	AND Team.role_id=1
</cfquery>
</cfsilent>
