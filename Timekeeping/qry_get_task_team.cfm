
<!--Timekeeping/qry_get_task_team.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_team" datasource="#application.datasources.main#">
SELECT user_account_id
FROM Team
WHERE active_ind=1
	AND role_id=4 /* team */
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>
