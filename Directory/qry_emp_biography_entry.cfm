
<!--Directory/qry_emp_biography_entry.cfm
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
	Revision 1.0  2005/02/15 20:46:54  daugherty
	Initial revision

	Revision 1.1  2001-10-30 11:35:44-05  french
	Initial query writing.

	Revision 1.0  2001-10-16 17:05:50-04  french
	Initial revision

	||
	Variables:
 --->
<cfif len(attributes.biography)>
<cfquery name="emp_biography_entry" datasource="#application.datasources.main#">
INSERT INTO Emp_Biography(emp_id,biography)
VALUES(#variables.emp_id#,'#StripCR(ParagraphFormat(attributes.biography))#')
</cfquery><!--- 
<cfquery name="emp_biography_delete" datasource="#application.datasources.main#">
DELETE Emp_Biography
WHERE emp_id=#variables.emp_id#
</cfquery> --->
</cfif>
</cfsilent>

