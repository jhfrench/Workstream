
<!--Timekeeping/qry_get_task_owner.cfm
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
<cfquery name="get_task_owner" datasource="#application.datasources.main#">
SELECT user_account_id
FROM Team
WHERE active_ind=1
	AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND role_id=1 /* owner */
</cfquery>
</cfsilent>