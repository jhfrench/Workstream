<!--- $issue$: consolidate with common_files/, Customers/, and Timekeeping/qry_get_open_tasks --->
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
SELECT Task.task_id, Project.customer_id, Project.project_id, Task.name AS task_name,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
	CASE WHEN Customer.description!=Project.description
		THEN (Project.project_code || '-' || Customer.description || '-' || CASE WHEN LENGTH(Project.description) > 50 THEN LEFT(Project.description, 50) || '...' ELSE Project.description END)
		ELSE (Project.project_code || '-' || Project.description)
	END AS project_display,
	CAST(Task.task_id AS VARCHAR(128)) || '-' || Task.name AS task_display
	<cfelse>
	CASE WHEN Customer.description!=Project.description
		THEN (Customer.description || '-' || CASE WHEN LENGTH(Project.description) > 50 THEN LEFT(Project.description, 50) || '...' ELSE Project.description END || ' (' ||  Project.project_code || ')')
		ELSE (Project.description || ' (' ||  Project.project_code || ')')
	END AS project_display,
	Task.name || ' (' || CAST(Task.task_id AS VARCHAR(128)) || ')' AS task_display
	</cfif>
FROM Task
	INNER JOIN (
		SELECT project_id
		FROM Link_Project_Company
		WHERE company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true" />)
		GROUP BY project_id
	) AS Link_Project_Company ON Task.project_id=Link_Project_Company.project_id
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/
WHERE Task.active_ind=1<cfif isdefined("attributes.exclude_task_id")>
		AND Task.task_id NOT IN (<cfqueryparam value="#attributes.exclude_task_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
ORDER BY Customer.sort_order, project_display, task_display
</cfquery>
<cfset caller.get_open_tasks=get_open_tasks>
</cfsilent>
