
<!--Reports/Qry_Pto_name_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the queries that are used in for the PTO report input page.

	||
	Edits:
	$Log$	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="subordinates" datasource="#application.datasources.main#">
SELECT emp_id 
FROM Supervisor 
WHERE sup_id=#emp_id#
</cfquery>
<cfquery name="get_all_option" datasource="#application.datasources.main#">
SELECT ISNULL(all_option, 0) AS all_option
FROM Security_Object_Access
WHERE emp_id = #session.user_account_id# 
	AND object_id = 16
</cfquery>
<cfquery name="REFname" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
FROM Emp_Contact, Security, Link_Emp_Contact_Employer
WHERE Emp_Contact.emp_id = Security.emp_id
	AND Emp_Contact.emp_id = Link_Emp_Contact_Employer.emp_id
	AND security.disable!=1 
	AND security.Disable_PTO!=1
	AND Emp_contact_type=1
	AND <cfif get_all_option.all_option>
		Link_Emp_Contact_Employer.company_id IN (#session.workstream_selected_company_id#) 
	<cfelse>
		(emp_contact.emp_id=#session.user_account_id#<cfif subordinates.recordcount> OR emp_contact.emp_id IN (#valuelist(subordinates.emp_id)#)</cfif>)
	</cfif>
GROUP BY Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname
ORDER BY lname, name
</cfquery>

