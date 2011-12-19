
<!--Admin/qry_update_link_company_emp_contact.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the modeul_access field of the User_Profile table.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="update_Link_Company_Emp_Contact" datasource="#application.datasources.main#">
/*wipe out old access*/
DELETE Link_Company_Emp_Contact
WHERE emp_id=#attributes.emp_id#

/*insert new access*/
INSERT INTO Link_Company_Emp_Contact (emp_id, company_id)
SELECT #attributes.emp_id# AS emp_id, company_id
FROM REF_Company
WHERE company_id IN (#attributes.company_id#)
</cfquery>
</cfsilent>

