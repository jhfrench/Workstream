
<!-- Reports/qry_team_select_by_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the active people that work for the companys that you are allowed to see.

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="team_select" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, LEFT(Emp_Contact.name,2) AS f_init, Emp_Contact.name AS name,
	Emp_Contact.emp_id AS emp_id, Link_Company_Emp_Contact.company_id, 
	COALESCE(REF_Company.description,'NA') AS company_name
FROM Emp_Contact, Link_Company_Emp_Contact, REF_Company, Security
WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Link_Company_Emp_Contact.company_id*=REF_Company.company_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Security.disable=0
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND #application.team_changed#=#application.team_changed#
ORDER BY Link_Company_Emp_Contact.company_id, lname, f_init
</cfquery>
</cfsilent>

