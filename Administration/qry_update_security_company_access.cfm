
<!--Admin/qry_update_security_company_access.cfm
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
<cfquery name="update_security_company_access" datasource="#application.datasources.main#">
/*wipe out old access*/
DELETE FROM Security_Company_Access
WHERE emp_id=#attributes.emp_id#;

/*insert new access*/
INSERT INTO Security_Company_Access (emp_id, company_id)
SELECT #attributes.emp_id# AS emp_id, company_id
FROM REF_Company
WHERE company_id IN (#attributes.company_id#);
</cfquery>
</cfsilent>

