
<!--Reports/qry_get_pto_names.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_pto_names" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id
FROM Emp_Contact
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
WHERE Emp_Contact.emp_contact_type=1
	AND Link_Company_Emp_Contact.company_id<cfif variables.all_option> IN (#session.workstream_selected_company_id#)<cfelse>=#session.workstream_company_id#
	AND (Emp_Contact.emp_id=#variables.user_identification#<cfif get_subordinates.recordcount> OR Emp_Contact.emp_id IN (#valuelist(get_subordinates.emp_id)#,#variables.user_identification#)</cfif>)
	</cfif>
ORDER BY lname, name
</cfquery>
</cfsilent>

