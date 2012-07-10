
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

