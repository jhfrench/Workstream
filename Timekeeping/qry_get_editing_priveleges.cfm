
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
	Revision 1.2  2006/03/31 07:47:14  french
	Modified query to use Link_Employee_Supervisor table instead of Demographics table.

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_editing_priveleges" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id AS editing_priveleges
FROM Task, Emp_Contact
WHERE Task.task_id=#attributes.task_id#
	AND Emp_Contact.emp_id=Task.Creator
UNION ALL
SELECT Team.emp_id
FROM Task, Team
WHERE Task.task_id=#attributes.task_id#
	AND Task.task_id=Team.task_id
	AND Team.role_id IN (1,5)
UNION ALL
SELECT Link_Employee_Supervisor.supervisor_id
FROM Link_Employee_Supervisor, Team
WHERE Link_Employee_Supervisor.user_account_id=Team.emp_id
	AND Team.task_id=#attributes.task_id#
	AND Team.role_id=1
	AND Link_Employee_Supervisor.active_ind=1
</cfquery>
</cfsilent>

