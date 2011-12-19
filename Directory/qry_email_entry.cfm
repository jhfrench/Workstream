
<!--Directory/qry_email_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a demographics record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:53  daugherty
	Initial revision

	Revision 1.0  2001-10-16 17:05:49-04  french
	Initial revision

	||
	Variables:
 --->
<cfloop query="get_email_types">
<cfif len(evaluate("attributes.email_#email_type_id#"))>
<cfquery name="email_entry" datasource="#application.datasources.main#">
INSERT INTO Email(emp_id,email,email_type_id)
VALUES(#variables.emp_id#,'#evaluate("attributes.email_#email_type_id#")#',#email_type_id#)
</cfquery>
</cfif>
</cfloop>
</cfsilent><!--- 
<cfquery name="email_delete" datasource="#application.datasources.main#">
DELETE Email
WHERE emp_id=#variables.emp_id#
</cfquery> --->

