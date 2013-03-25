
<!--Timekeeping/qry_get_editing_privileges.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the user_account_ids of the people who are allowed to edit a task (the owner, the creator, and the owner's supervisor).
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
WHERE Task.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Task.created_by=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
UNION ALL
SELECT 1
FROM Team
WHERE Team.active_ind=1
	AND Team.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Team.role_id IN (1,5)
	AND Team.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
UNION ALL
SELECT 1
FROM Link_User_Account_Supervisor
	INNER JOIN Team ON Link_User_Account_Supervisor.user_account_id=Team.user_account_id
		AND Link_User_Account_Supervisor.active_ind=1
WHERE Team.active_ind=1
	AND Team.task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND Team.role_id=1
	AND Team.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>