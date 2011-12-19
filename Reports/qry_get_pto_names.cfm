
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
FROM Emp_Contact, Security, Company
WHERE Emp_Contact.emp_id=Security.emp_id
	AND Emp_Contact.emp_id=Company.emp_id
	AND Company.emp_id=Security.emp_id
	AND Security.disable!=1 
	AND Security.disable_pto!=1
	AND Emp_Contact.emp_contact_type=1
	AND Company.company<cfif variables.all_option> IN (#session.workstream_company_select_list#)<cfelse>=#session.workstream_company_id#
	AND (Emp_Contact.emp_id=#session.user_account_id#<cfif get_subordinates.recordcount> OR Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#,#session.user_account_id#)</cfif>)
	</cfif>
ORDER BY lname, name
</cfquery>
</cfsilent>

