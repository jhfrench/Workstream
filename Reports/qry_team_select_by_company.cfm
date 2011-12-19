
<!-- Reports/qry_team_select_by_company.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the active people that work for the companys that you are allowed to see.

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:14:49  stetzer
	<>

	Revision 1.1  2002-04-11 14:25:09-04  french
	Made change to also show second initial of employee.

	Revision 1.0  2001-11-27 12:26:59-05  long
	created file

	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="team_select" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS lname, LEFT(Emp_Contact.name,2) AS f_init, Emp_Contact.name AS name,
	Emp_Contact.emp_id AS emp_id, Company.company, 
	ISNULL(REF_Company.company,'NA') AS company_name
FROM Emp_Contact, Company, REF_Company, Security
WHERE Emp_Contact.emp_id=Company.emp_id
	AND Company.company*=REF_Company.company_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Security.disable=0
	AND Company.company IN (#session.workstream_company_select_list#)
	AND #application.team_changed#=#application.team_changed#
ORDER BY Company.company, lname, f_init
</cfquery>
</cfsilent>

