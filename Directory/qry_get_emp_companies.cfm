
<!--Directory/qry_get_emp_companies.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	<-- company: string containing the name of any company the employee is associated with
 --->
<cfquery name="get_emp_companies" datasource="#application.datasources.main#">
SELECT REF_Company.description AS company
FROM REF_Company, Link_Company_Emp_Contact
WHERE REF_Company.company_id=Link_Company_Emp_Contact.company_id
	AND Link_Company_Emp_Contact.emp_id=#attributes.emp_id#
ORDER BY REF_Company.description
</cfquery>
</cfsilent>
