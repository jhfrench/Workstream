
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
	Revision 1.0  2005/02/15 20:46:51  daugherty
	Initial revision

	Revision 1.3  2001-10-16 17:07:29-04  french
	Finishing first implementation of employee entry function.

	Revision 1.2  2001-10-16 15:00:11-04  french
	Initial revision.

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

