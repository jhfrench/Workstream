
<!--Timekeeping/qry_get_team_members.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the team members for a given task. Currently used by Timekeeping/dsp_project_timeline_details.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	(9/11/12 | JF) This template is used by Timekeeping/dsp_project_timeline_details.cfm.
	 || 
	END FUSEDOC --->
<cfquery name="get_team_members" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, Demographics.user_account_id
FROM Team
	INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Team.active_ind=1
	AND Team.task_id=<cfqueryparam value="#task_id#" cfsqltype="cf_sql_integer" />
GROUP BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
ORDER BY Demographics.last_name, Demographics.first_name, Demographics.user_account_id
</cfquery>
</cfsilent>