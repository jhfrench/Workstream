
<!--Reports/qry_get_pto_names.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:13:22  stetzer
<>

	||
	END FUSEDOC --->
<cfquery name="get_pto_names" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
FROM Emp_Contact, Security, Link_Emp_Contact_Employer
WHERE Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
	AND Link_Emp_Contact_Employer.emp_id=Security.emp_id
	AND Security.disable!=1 
	AND Security.disable_pto!=1
	AND Emp_Contact.emp_contact_type=1
	AND Link_Emp_Contact_Employer.company_id<cfif variables.all_option> IN (#session.workstream_selected_company_id#)<cfelse>=#session.workstream_company_id#
	AND (Emp_Contact.emp_id=#session.user_account_id#<cfif get_subordinates.recordcount> OR Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#,#session.user_account_id#)</cfif>)
	</cfif>
ORDER BY lname, name
</cfquery>
</cfsilent>

