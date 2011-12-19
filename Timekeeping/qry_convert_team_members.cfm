
<!--Timekeeping/qry_convert_team_members.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:23:23  stetzer
<>

Revision 1.1  2001-10-11 10:54:52-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> get_task_details.owner_id: number that uniquely identifies the owner of a task
 --->
<cfquery name="convert_team_members" datasource="#application.datasources.main#">
SELECT name, lname, 4 AS roll_id
FROM Emp_Contact
WHERE emp_id IN (<cfif len(get_task_team.emp_id)>#valuelist(get_task_team.emp_id)#<cfelse>0</cfif>)
</cfquery>
</cfsilent>

