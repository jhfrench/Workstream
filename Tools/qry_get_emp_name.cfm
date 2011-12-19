
<!--Tools/qry_get_emp_name.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the modules that a user is allowed to see.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:01:59  daugherty
	Initial revision

	Revision 1.0  2002-02-19 14:54:26-05  french
	Creating drill-down to the notes level from the invoice tool.

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	END FUSEDOC --->
<cfquery name="get_emp_name" datasource="#application.datasources.main#">
SELECT lname + ', ' + name AS name
FROM Emp_Contact
WHERE emp_id=#attributes.emp_id#
</cfquery>
</cfsilent>
