
<!--Report/qry_get_supervisor_info.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that get the supervisor information for the manager hours report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_supervisor_info" datasource="#application.datasources.main#">
SELECT Demographics.pin AS sup_pin, Emp_Contact.emp_id AS sup_id, 
	REF_Company.company AS sup_comapny, 
	Emp_Contact.name AS sup_name, Emp_Contact.lname AS sup_lname,
	ISNULL(Security_Object_Access.all_option,0) AS all_option
FROM Emp_Contact, Demographics_Ngauge Demographics, Company,
	Security, REF_Company, Security_Object_Access
WHERE Emp_Contact.emp_id=Demographics.emp_id
	AND Emp_Contact.emp_id=Company.emp_id
	AND Emp_Contact.emp_id=Security.emp_id
	AND Company.company=REF_Company.company_ID
	AND Security_Object_Access.emp_id=Emp_Contact.emp_id
	AND Security_Object_Access.object_id=#variables.object_id#
	AND Security.disable!=1
	AND Emp_Contact.emp_id=#session.user_account_id#
	AND Demographics.effective_to IS NULL
</cfquery>
</cfsilent>
