
<!--Directory/qry_emp_contact_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a emp_contact record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:55  daugherty
	Initial revision

	Revision 1.3  2002-03-08 16:35:48-05  long
	changed a select max(x)  to select @@identity

	Revision 1.2  2001-10-16 17:07:30-04  french
	Finishing first implementation of employee entry function.

	Revision 1.1  2001-10-11 12:18:08-04  long
	Added FuseDoc
	||
	Variables:
 --->
</cfsilent>
<cfquery name="emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO Emp_Contact (name, mi, lname,
	credentials, emp_contact_type)
VALUES('#attributes.name#', '#attributes.mi#', '#attributes.lname#',
	'#attributes.credentials#', #emp_contact_type#)
</cfquery>
<cfquery name="max_emp_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('Emp_Contact') AS emp_id
</cfquery>
<cfset variables.emp_id=max_emp_id.emp_id>
<cfset attributes.emp_id=variables.emp_id><!--- 
<cfquery name="emp_contact_delete" datasource="#application.datasources.main#">
DELETE Emp_Contact
WHERE emp_id=#variables.emp_id#
</cfquery> --->

