
<!--Directory/qry_company_entry.cfm
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
<cfquery name="company_entry" datasource="#application.datasources.main#">
INSERT INTO Link_Emp_Contact_Employer (emp_id, company_id)
VALUES(#variables.emp_id#, #attributes.company_id#)
</cfquery>

