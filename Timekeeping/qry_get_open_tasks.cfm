<!--- $issue$: is this template used? --->
<!--Timekeeping/qry_get_open_tasks.cfm
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
	<-- task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_open_tasks" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, Task.task_id AS task_id
FROM Task
	INNER JOIN Link_Project_Company ON Task.project_id = Link_Project_Company.project_id
WHERE Task.status_id NOT IN (7,9,11) /*completed, on hold, prospective*/
	AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
ORDER BY Task.name
</cfquery>
</cfsilent>

