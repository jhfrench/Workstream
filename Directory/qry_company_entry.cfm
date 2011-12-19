
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
INSERT INTO Company(emp_id, company)
VALUES(#variables.emp_id#, #attributes.company_id#)
</cfquery><!--- 
<cfquery name="company_delete" datasource="#application.datasources.main#">
DELETE Company
WHERE emp_id=#variables.emp_id#
</cfquery> --->

