
<!--Timekeeping/qry_convert_owner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> get_task_details.owner_id: number that uniquely identifies the owner of a task
 --->
<cfquery name="convert_owner" datasource="#application.datasources.main#">
SELECT name, lname
FROM Emp_Contact
WHERE emp_id = #get_task_details.owner_id#
</cfquery>
</cfsilent>

