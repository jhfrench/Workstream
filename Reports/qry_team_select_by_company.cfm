
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
<cfquery name="get_team_select_by_company" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname AS lname, Emp_Contact.name,
	 Link_Company_Emp_Contact.company_id, COALESCE(REF_Company.description,'NA') AS company_name
FROM Emp_Contact, Link_Company_Emp_Contact, REF_Company, Security
WHERE Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	AND Link_Company_Emp_Contact.company_id*=REF_Company.company_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Security.disable=0
	AND Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#)
	AND #application.team_changed#=#application.team_changed#
ORDER BY Link_Company_Emp_Contact.company_id, Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

