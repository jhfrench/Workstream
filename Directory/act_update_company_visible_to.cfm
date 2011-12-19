
<!-- Directory/act_update_link_company_emp_contact.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company visible to table.

	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="link_company_emp_contact_delete" datasource="#application.datasources.main#">
DELETE Link_Company_Emp_Contact
WHERE emp_id=#attributes.emp_id#
</cfquery> 
	<cfif LEN(attributes.visable_company)>
<cfloop list="#attributes.visable_company#" index="ii">
	<cfquery name="link_company_emp_contact_entry" datasource="#application.datasources.main#">
		INSERT INTO Link_Company_Emp_Contact(emp_id, company_id)
		VALUES(#attributes.emp_id#, #ii#)
	</cfquery>
</cfloop>
<cfelse>
<cfquery name="link_company_emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_Emp_Contact(emp_id, company_id)
VALUES(#attributes.emp_id#, #attributes.company_id#)
</cfquery>
</cfif>	
 

</cfsilent>
