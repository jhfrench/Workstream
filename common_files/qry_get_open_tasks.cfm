
<!--common_files/qry_get_open_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the task name and id of any task that is not closed.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- display: string combination of task_id and task_name
	<-- task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- task_name: string that describes the task
 --->
<cfquery name="get_open_tasks" cachedwithin="#createtimespan(0,0,0,30)#" datasource="#application.datasources.main#">
SELECT Task.task_id AS task_id, Project.customer_id, Project.project_id, Task.name AS task_name, 
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
	CASE WHEN Customer.description != Project.description
		THEN (Project.project_code + ' - ' + Customer.description + ' - ' + CASE WHEN LEN(Project.description) > 50 THEN LEFT(Project.description, 50)+'...' ELSE Project.description END) 
		ELSE (Project.project_code + ' - ' + Project.description)
	END AS project_display,
	CAST(Task.task_id AS VARCHAR(128)) + '-' + Task.name AS task_display
	<cfelse>
	CASE WHEN Customer.description != Project.description
		THEN (Customer.description + ' - ' + CASE WHEN LEN(Project.description) > 50 THEN LEFT(Project.description, 50)+'...' ELSE Project.description END + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	END AS project_display,
	Task.name + ' (' + CAST(Task.task_id AS VARCHAR(128)) + ')' AS task_display
	</cfif>
FROM Link_Project_Company, Task, Project, Customer
WHERE Link_Project_Company.project_id=Task.project_id
	AND Task.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	AND Link_Project_Company.company_id IN (#session.workstream_company_select_list#)
	AND Task.status_id != 11
ORDER BY project_display, task_display
</cfquery>
</cfsilent>
