
<!--Directory/qry_link_company_emp_contact_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a company record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
</cfsilent>
	<!--- 
	If the admin granted the new user  access to multiple companies then 
	grant that access
	--->
<cfif LEN(attributes.visable_company)>
<cfloop list="#attributes.visable_company#" index="ii">
	<cfquery name="Link_Company_Emp_Contact_entry" datasource="#application.datasources.main#">
		INSERT INTO Link_Company_Emp_Contact(emp_id,company_id)
		VALUES(#variables.emp_id#,#ii#)
	</cfquery>
</cfloop>
<cfelse>
<!--- 
	If the admin didn't grant access to anything at all, then grant access to the 
	company that the new employee works for.
 --->
<cfquery name="Link_Company_Emp_Contact_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Company_Emp_Contact(emp_id,company_id)
VALUES(#variables.emp_id#,#attributes.company_id#)
</cfquery>
</cfif>	
<!--- 
<cfquery name="Link_Company_Emp_Contact_delete" datasource="#application.datasources.main#">
DELETE Link_Company_Emp_Contact
WHERE emp_id=#variables.emp_id#
</cfquery> --->

