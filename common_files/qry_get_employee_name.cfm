
<!--common_files/qry_get_employee_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve tasks from the timekeeping database based on the environment and needs of the user.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:42:00  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:41-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> application.team_changed: date of the last time emp_contact, security or demographics tables were changed
	--> attributes.emp_id: id that identifies user to workstream
	<-- last_name: string containing the last name of the desired user
	<-- first_name: string containing the last name of the desired user
 --->
<cfquery name="get_employee_name" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname AS last_name, Emp_Contact.name AS first_name
FROM Emp_Contact
WHERE Emp_Contact.emp_id IN (#attributes.emp_id#)
	AND #application.team_changed#=#application.team_changed#
</cfquery>
</cfsilent>
