
<!--Timekeeping/qry_update_task_assignment.cfm
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
<cfquery name="update_task_assignment" datasource="#application.datasources.main#">
UPDATE Team
SET active_ind=0
WHERE task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
	AND role_id=<cfqueryparam value="#attributes.role_id#" cfsqltype="cf_sql_integer" />
	AND user_account_id NOT IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />);
<cfif listlen(attributes.user_account_id)>
	INSERT INTO Team(task_id, user_account_id, role_id,
		created_by)
	SELECT <cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />, user_account_id, <cfqueryparam value="#attributes.role_id#" cfsqltype="cf_sql_integer" />,
		<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	FROM User_Account
	WHERE user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)
		/*don't duplicate team assignments*/
		AND user_account_id NOT IN (
			SELECT user_account_id
			FROM Team
			WHERE active_ind=1
				AND task_id=<cfqueryparam value="#attributes.task_id#" cfsqltype="cf_sql_integer" />
				AND role_id=<cfqueryparam value="#attributes.role_id#" cfsqltype="cf_sql_integer" />
				AND user_account_id IN (<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" list="true" />)
		);
</cfif>
</cfquery>
</cfsilent>