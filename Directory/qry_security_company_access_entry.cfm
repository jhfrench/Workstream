
<!--Directory/qry_Security_Company_Access_entry.cfm
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
	If the admin granted the new user access to multiple companies then 
	grant that access
	--->
<cfif len(attributes.visable_company)>
<cfloop list="#attributes.visable_company#" index="ii">
	<cfquery name="Security_Company_Access_entry" datasource="#application.datasources.main#">
		INSERT INTO Security_Company_Access (emp_id, company_id)
		VALUES (#variables.emp_id#, #ii#)
	</cfquery>
</cfloop>
<cfelse>
<!--- 
	If the admin didn't grant access to anything at all, then grant access to the 
	company that the new employee works for.
 --->
<cfquery name="Security_Company_Access_entry" datasource="#application.datasources.main#">
INSERT INTO Security_Company_Access(emp_id,company_id)
VALUES(#variables.emp_id#,#attributes.company_id#)
</cfquery>
</cfif>
