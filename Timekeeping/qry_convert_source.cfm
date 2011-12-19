
<!--Timekeeping/qry_convert_source.cfm
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
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> get_task_details.owner_id: number that uniquely identifies the owner of a task
 --->
<cfquery name="convert_source" datasource="#application.datasources.main#">
SELECT name, lname
FROM Emp_Contact
WHERE emp_id = #get_task_details.task_source#
</cfquery>
</cfsilent>

