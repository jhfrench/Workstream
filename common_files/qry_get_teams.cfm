
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
Revision 1.0  2005/02/15 20:42:08  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:38-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_teams" datasource="#application.datasources.main#">
SELECT *
FROM
	(SELECT REF_Companies.company AS company, REF_Companies.company_id AS company_id
	FROM Company, REF_Companies
	WHERE Company.company=REF_Companies.company_id
		AND Company.emp_id=#session.user_account_id#
		AND #application.team_changed#=#application.team_changed#
	UNION ALL
	SELECT REF_companies.company AS company, Company_Visible_To.company_id AS company_id
	FROM Company_Visible_To, REF_companies
	WHERE Company_Visible_To.company_id = REF_companies.company_id
		AND Company_Visible_To.emp_id=#session.user_account_id#)
AS Elligible_Companies
GROUP BY company, company_id
ORDER BY company
</cfquery>

