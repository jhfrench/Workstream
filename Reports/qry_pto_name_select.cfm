
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
SELECT user_account_id
FROM Supervisor 
WHERE supervisor_user_account_id=#emp_id#
</cfquery>
<cfmodule template="../common_files/act_set_all_option.cfm" business_function_id="635">
<cfquery name="REFname" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
FROM Emp_Contact, Link_Company_Emp_Contact
WHERE Emp_Contact.emp_id = Link_Company_Emp_Contact.emp_id
	AND Emp_contact_type=1
	AND <cfif get_all_option.all_option>
		Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#) 
	<cfelse>
		(emp_contact.emp_id=#session.user_account_id#<cfif subordinates.recordcount> OR emp_contact.emp_id IN (#valuelist(subordinates.emp_id)#)</cfif>)
	</cfif>
GROUP BY Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname
ORDER BY lname, name
</cfquery>

