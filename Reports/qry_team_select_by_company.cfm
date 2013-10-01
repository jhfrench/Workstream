
<!-- Reports/qry_team_select_by_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the active people that work for the companies that you are allowed to see.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_team_select_by_company" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.last_name, Demographics.first_name,
	 Link_Company_User_Account.company_id, COALESCE(REF_Company.description,'NA') AS company_name
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id=REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
WHERE Employee.active_ind=1
	AND <cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />
ORDER BY REF_Company.sort_order, Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>

