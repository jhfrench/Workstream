
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
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_teams" datasource="#application.datasources.main#">
SELECT *
FROM (
	SELECT REF_Company.description AS company, REF_Company.company_id AS company_id
	FROM Link_Company_Emp_Contact, REF_Company
	WHERE Link_Company_Emp_Contact.company_id=REF_Company.company_id
		AND Link_Company_Emp_Contact.emp_id=#session.user_account_id#
		AND #application.team_changed#=#application.team_changed#
	UNION ALL
	SELECT REF_Company.description AS company, Security_Company_Access.company_id AS company_id
	FROM Security_Company_Access, REF_Company
	WHERE Security_Company_Access.company_id = REF_Company.company_id
		AND Security_Company_Access.emp_id=#session.user_account_id#
	) AS Elligible_Companies
GROUP BY company, company_id
ORDER BY company
</cfquery>