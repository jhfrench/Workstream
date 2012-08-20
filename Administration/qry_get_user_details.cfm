
<!--Admin/qry_get_user_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="get_user_details" datasource="#application.datasources.main#">
SELECT Emp_Contact.emp_id, Emp_Contact.lname, Emp_Contact.name,
	 Link_Company_Emp_Contact.company_id, COALESCE(REF_Company.description,'NA') AS company_name Email.email
FROM Emp_Contact
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	LEFT OUTER JOIN REF_Company ON Link_Company_Emp_Contact.company_id=REF_Company.company_id
	LEFT OUTER JOIN Email ON Emp_Contact.emp_id=Email.emp_id
		AND Email.email_type_id = 1
WHERE Emp_Contact.emp_id=<cfif isdefined("attributes.emp_id")>#attributes.emp_id#<cfelse>#session.user_account_id#</cfif>
ORDER BY Link_Company_Emp_Contact.company_id, lname, name, email_type_id
</cfquery>
</cfsilent>

