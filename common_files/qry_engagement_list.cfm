
<!--common_files/qry_engagement_list.cfm
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
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> session.user_account_id: id that identifies user to workstream
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
	--> session.workstream_engagement_list_order: list of query columns to ORDER BY
	--> [attributes.emp_id]: emp_id of the peson whose inbox the user wants to see
	<-- project_code: numeric code of the project/engagement
	<-- project_end: date or string containing targeted completion date for the project/engagement
	<-- project_mission: string containing the desired outcome of the project/engagement
	<-- project_name: name or description of the project/engagement
	<-- task_count: number of tasks associated with the project/engagement that meets the user's specifications (ie on the team, not hidden, not completed)
 --->
<cfquery name="engagement_list" datasource="#application.datasources.main#">
SELECT Project.project_code AS project_code, Project.project_id AS project_id, Project.project_end AS project_end,
	Customers.description + ' - ' + Project.description AS project_name, ISNULL(Project.mission,'No mission specified') AS project_mission,
	COUNT(Task.task_id) AS task_count
FROM Customers, Project, Task, Team, Emp_Contact, Project_Visible_To
WHERE (Project.active_id=<cfif NOT session.workstream_show_closed_engagements>2<cfelse>1 OR project_end IS NOT NULL</cfif>) 
	AND Customers.customers_id=Project.customers_id
	AND Team.emp_id=<cfif isdefined("attributes.emp_id")>#attributes.emp_id#<cfelse>#session.user_account_id#</cfif> 
	AND Project.project_id=Task.Project_id 
	AND Task.task_id=Team.task_id AND Team.Emp_ID=Emp_Contact.Emp_ID 
	AND Project_Visible_To.project_id=Project.project_id 
	AND Project_Visible_To.company_id IN (#session.workstream_company_id#)
	And project.project_type_id <> 3
	AND ((Team.roll_id IN (1,<cfif session.workstream_show_team>4,</cfif>0) 
	AND Task.status_id NOT IN (<cfif NOT session.workstream_show_closed>11,</cfif><cfif NOT session.workstream_show_on_hold>7,</cfif>0)) 
	OR (Team.roll_id=3 AND Task.status_id=4))
GROUP BY Customers.description, Project.project_code, Project.project_id, Project.description, Project.project_end, Project.mission
<cfif isdefined("session.workstream_engagement_list_order")>ORDER BY #session.workstream_engagement_list_order#</cfif>
</cfquery>
</cfsilent>

