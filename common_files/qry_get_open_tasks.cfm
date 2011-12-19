
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
	Revision 1.1  2006/08/11 10:12:41  french
	Making time reassign work with two-related-selects.

	Revision 1.0  2005-02-15 15:42:03-05  daugherty
	Initial revision

	Revision 1.2  2001-11-13 10:21:40-05  french
	Added 'display' output and ordering logic to correspond to user's ordering preference.

	Revision 1.1  2001-11-12 12:46:57-05  french
	Updating fusedoc.

	Revision 1.0  2001-11-12 12:45:11-05  french
	Moved qry_get_open_tasks.cfm from Timekeeping to common_files.
	
	Revision 1.1  2001-10-11 10:54:46-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- display: string combination of task_id and task_name
	<-- task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- task_name: string that describes the task
 --->
<cfquery name="get_open_tasks" cachedwithin="#createtimespan(0,0,0,30)#" datasource="#application.datasources.main#">
SELECT Task.task_id AS task_id, Project.customers_id, Project.project_id, Task.name AS task_name, 
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>
	CASE WHEN Customers.description != Project.description
		THEN (Project.project_code + ' - ' + Customers.description + ' - ' + CASE WHEN LEN(Project.description) > 50 THEN LEFT(Project.description, 50)+'...' ELSE Project.description END) 
		ELSE (Project.project_code + ' - ' + Project.description)
	END AS project_display,
	CAST(Task.task_id AS VARCHAR(128)) + '-' + Task.name AS task_display
	<cfelse>
	CASE WHEN Customers.description != Project.description
		THEN (Customers.description + ' - ' + CASE WHEN LEN(Project.description) > 50 THEN LEFT(Project.description, 50)+'...' ELSE Project.description END + ' (' + Project.project_code + ')') 
		ELSE (Project.description + ' (' + Project.project_code + ')') 
	END AS project_display,
	Task.name + ' (' + CAST(Task.task_id AS VARCHAR(128)) + ')' AS task_display
	</cfif>
FROM Project_Visible_To, Task, Project, Customers
WHERE Project_Visible_To.project_id=Task.project_id
	AND Task.project_id=Project.project_id
	AND Project.customers_id=Customers.customers_id
	AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)
	AND Task.status_id != 11
ORDER BY project_display, task_display
</cfquery>
</cfsilent>
