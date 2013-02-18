
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
	INNER JOIN (
		SELECT company_id
		FROM Link_Company_User_Account
		WHERE Link_Company_User_Account.user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#" />
		UNION ALL
		SELECT company_id
		FROM Security_Company_Access
		WHERE Security_Company_Access.user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#" />
	) Associated_Companies ON REF_Company.company_id=Associated_Companies.company_id
GROUP BY description, company_id
ORDER BY description
</cfquery>