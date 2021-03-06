
<!--common_files/qry_get_date_locked.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve latest date that has been billed for all the projects belonging to the user's companies. The idea is to avoid billing to dates that have already been invoiced.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	(JF | 11/14/12)
	Actually, if we don't have billing history, let's just let the user enter time "up to" 40 days ago.
	 ||
 --->
<cfquery name="get_date_locked" datasource="#application.datasources.main#">
SELECT COALESCE(MAX(Billing_History.created_date), CURRENT_DATE+INTERVAL '-40 days') AS date_locked
FROM Billing_History
	INNER JOIN Link_Project_Company ON Billing_History.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.active_ind=1<cfif isdefined("attributes.project_id")>
		AND Link_Project_Company.project_id=<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" /></cfif><cfif isdefined("attributes.selected_company_id")>
		AND Link_Project_Company.company_id IN (<cfqueryparam value="#attributes.selected_company_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
	INNER JOIN Link_Company_User_Account ON Link_Project_Company.company_id=Link_Company_User_Account.company_id
		AND Link_Company_User_Account.active_ind=1
	INNER JOIN User_Account ON Link_Company_User_Account.user_account_id=User_Account.user_account_id
		AND User_Account.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
WHERE Billing_History.active_ind=1
</cfquery>
</cfsilent>