
<!--Timekeeping/qry_get_team_members.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the rows for the Project Timeline output.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:26:30  stetzer
	<>

	Revision 1.2  2001-10-31 14:04:45-05  french
	Fixing GROUP BY to account for last name change.

	Revision 1.1  2001-10-31 14:03:18-05  french
	Made changes to display last name instead of first name.

	Revision 1.0  2001-10-29 16:27:51-05  french
	File creation.

	||
	END FUSEDOC --->
<cfquery name="get_team_members" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS name, Emp_Contact.emp_id
FROM Team, Emp_Contact
WHERE Team.emp_id=Emp_Contact.emp_id
	AND Team.task_id=#task_id#
GROUP BY Emp_Contact.lname, Emp_Contact.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.emp_id
</cfquery>
</cfsilent>

