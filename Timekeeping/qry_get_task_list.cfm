
<!--Timekeeping/qry_get_task_list.cfm
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
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> variables.user_identification: id that identifies user to workstream
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
	--> session.workstream_task_list_order: list of query columns to ORDER BY
	--> [attributes.user_account_id]: user_account_id of the peson whose inbox the user wants to see
	<-- billing_code: code which task time will be invoiced to
	<-- due_date: date when task is due
	<-- percent_time_used: number showing the amount of time used divided by the amount of time budgeted, shown only if time was budgeted
	<-- project_name: name of project which corresponds to the task
	<-- time_budgeted: amount of time allocated or targeted to complete the task
	<-- task_description: details or description of what is required to complete the task
	<-- task_icon: icon specified for the task
	<-- task_id: unique number that identifies task entry
	<-- task_name: name or title of the task
	<-- task_owner: last name of the person ultimately responsible for succesful task resolution
	<-- task_status: string that indicates the current status of the task
	<-- time_used: total amount of time recorded towards completion of the task
 --->
<cfif isdefined("attributes.ignore_owner")>
	<cfset variables.from_invoice=1>
	<cfset attributes.month=listfirst(attributes.ignore_owner,"|")>
	<cfset attributes.year=listlast(attributes.ignore_owner,"|")>
<cfelse>
	<cfset variables.from_invoice=0>
</cfif>
<cfif isdefined("attributes.user_account_id") AND listlen(attributes.user_account_id,"|") GT 1>
	<cfset attributes.inbox_owner=listlast(attributes.user_account_id,"|")>
	<cfset attributes.user_account_id=listdeleteat(attributes.user_account_id, "2","|")>
</cfif>

<!--- $issue# this task_list_order should no longer be managed by the database --->
<cfset variables.temp_task_list_order=session.workstream_task_list_order>
<cfif isdefined("attributes.user_account_id") AND listlen(attributes.user_account_id) GT 1 AND listfind(variables.temp_task_list_order, "task_owner")>
	<cfset variables.temp_task_list_order=listdeleteat(variables.temp_task_list_order, listfind(variables.temp_task_list_order, "task_owner"))>
</cfif>

<cfquery name="get_task_list" datasource="#application.datasources.main#">
SELECT Task.due_date, Task.task_id, Task.name AS task_name,
	COALESCE(Task.description, 'No description provided.') AS task_description, COALESCE(Task.budgeted_hours,0) AS budgeted_hours, Link_Task_Task_Status.task_status_id,
	REF_Icon.class_name AS task_icon, REF_Priority.description AS priority, REF_Priority.sort_order AS priority_sort,
	COALESCE(Recorded_Hours.used_hours,0) AS used_hours,
	(Customer.description || '-' || Project.description) AS project_name, Task_Owner.first_name AS task_owner, Task_Owner.last_name || ', ' || Task_Owner.first_name AS task_owner_full_name,
	(CASE
		WHEN Link_Task_Task_Status.task_status_id=3 /* QA */ THEN REF_Task_Status.description || ' by ' || COALESCE(Task_Tester.first_name,'unknown')
		WHEN Link_Task_Task_Status.task_status_id=8 /* UAT */ THEN REF_Task_Status.description || ' by ' || COALESCE(Customer.description,'customer')
		ELSE REF_Task_Status.description
	END) AS task_status
FROM Task
	INNER JOIN Project ON Task.project_id=Project.project_id
		AND Project.project_id!=<cfqueryparam value="#application.application_specific_settings.pto_project_id#" cfsqltype="cf_sql_integer" /><cfif isdefined("attributes.project_id")>
		AND Project.project_id IN (<cfqueryparam value="#attributes.project_id#" cfsqltype="cf_sql_integer" list="true" />)</cfif>
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.active_ind=1
		AND Link_Project_Company.company_id IN (<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" list="yes" />)
	INNER JOIN REF_Priority on Task.priority_id=REF_Priority.priority_id
	INNER JOIN REF_Icon ON Task.icon_id=REF_Icon.icon_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
	<cfif variables.from_invoice>INNER<cfelse>LEFT OUTER</cfif> JOIN (
		SELECT task_id, SUM(hours) AS used_hours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1<cfif variables.from_invoice>
			AND EXTRACT(MONTH FROM Time_Entry.work_date)=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.month#" />
			AND EXTRACT(YEAR FROM Time_Entry.work_date)=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.year#" /></cfif>
		GROUP BY task_id
	) AS Recorded_Hours ON Task.task_id=Recorded_Hours.task_id
	INNER JOIN (
		SELECT Team.task_id, Demographics.last_name, Demographics.first_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=1 /* owner */
	) AS Task_Owner ON Task.task_id=Task_Owner.task_id
	LEFT OUTER JOIN (
		SELECT Team.task_id, Demographics.last_name, Demographics.first_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=3 /* QA */
	) AS Task_Tester ON Task.task_id=Task_Tester.task_id
WHERE Task.active_ind=1<cfif NOT variables.from_invoice>
	AND Task.task_id IN (
		SELECT Task.task_id
		FROM Task
			INNER JOIN Team ON Task.task_id=Team.task_id
				AND Team.active_ind=1
				AND Team.user_account_id IN (<cfif isdefined("attributes.user_account_id")><cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.user_account_id#" /><cfelse><cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#" list="yes" /></cfif>)
				AND (
					(
						Team.role_id IN (1<cfif session.workstream_show_team>,4</cfif>) /* owner, team */
							AND Link_Task_Task_Status.task_status_id NOT IN (<cfif NOT session.workstream_show_closed>7,</cfif><cfif NOT session.workstream_show_on_hold>9,</cfif>10) /*completed, on hold, prospective*/
					)
					OR (
					Team.role_id=3 /* QA */
						AND Link_Task_Task_Status.task_status_id=3 /* QA */
					)
				)
	)</cfif>
ORDER BY <cfif isdefined("attributes.user_account_id") AND listlen(attributes.user_account_id) GT 1>task_owner, </cfif>#variables.temp_task_list_order#
LIMIT 500
</cfquery>
</cfsilent>
