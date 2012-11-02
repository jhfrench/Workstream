
<!--Timekeeping/qry_get_editing_privileges.cfm
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
<cfquery name="get_editing_privileges" datasource="#application.datasources.main#">
SELECT 1 AS editing_privilege_ind
FROM Task
WHERE Task.task_id=#attributes.task_id#
	AND Task.created_by=#variables.user_identification#
UNION ALL
SELECT 1
FROM Team
WHERE Team.active_ind=1
	AND Team.task_id=#attributes.task_id#
	AND Team.role_id IN (1,5)
	AND Team.emp_id=#variables.user_identification#
UNION ALL
SELECT 1
FROM Link_Employee_Supervisor
	INNER JOIN Team ON Link_Employee_Supervisor.emp_id=Team.emp_id
		AND Link_Employee_Supervisor.active_ind=1
WHERE Team.active_ind=1
	AND Team.task_id=#attributes.task_id#
	AND Team.role_id=1
	AND Team.emp_id=#variables.user_identification#
</cfquery>
</cfsilent>