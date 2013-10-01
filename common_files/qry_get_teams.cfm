
<!--common_files/qry_get_teams.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select a list of all the companies that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> variables.user_identification: integer that identifies a user
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_teams" datasource="#application.datasources.main#">
SELECT REF_Company.description AS company, REF_Company.company_id
FROM REF_Company
WHERE REF_Company.company_id IN (
		SELECT company_id
		FROM Link_Company_User_Account
		WHERE Link_Company_User_Account.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
		UNION ALL
		SELECT company_id
		FROM Security_Company_Access
		WHERE Security_Company_Access.user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	) Associated_Companies ON REF_Company.company_id=Associated_Companies.company_id
ORDER BY REF_Company.sort_order
</cfquery>