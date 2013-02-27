
<!--Search/qry_search.cfm
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
	<-- task_qa: last name of the person in charge of performing quality analysis on the tasks
	<-- task_status: string that indicates the current status of the task
	<-- time_used: total amount of time recorded towards completion of the task
 --->

<cfif isdate(attributes.date_entered)>
	<cfswitch expression="#attributes.date_entered_operator#">
		<cfcase value="1">
			<cfset variables.date_entered="< '#dateformat(dateadd('d',1,attributes.date_entered))#' /*LESS THAN*/">
		</cfcase>
		<cfcase value="2">
			<cfset variables.date_entered="BETWEEN '#dateformat(attributes.date_entered)#' AND '#dateformat(dateadd('d',1,attributes.date_entered))#' /*ON SPECIFIED DATE*/">
		</cfcase>
		<cfcase value="3">
			<cfset variables.date_entered="> '#dateformat(attributes.date_entered)#' /*GREATER THAN*/">
		</cfcase>
	</cfswitch>
</cfif>

<cfif isdate(attributes.due_date)>
	<cfswitch expression="#attributes.due_date_operator#">
		<cfcase value="1">
			<cfset variables.due_date="< '#dateformat(dateadd('d',1,attributes.due_date))#' /*LESS THAN*/">
		</cfcase>
		<cfcase value="2">
			<cfset variables.due_date="BETWEEN '#dateformat(attributes.due_date)#' AND '#dateformat(dateadd('d',1,attributes.due_date))#' /*ON SPECIFIED DATE*/">
		</cfcase>
		<cfcase value="3">
			<cfset variables.due_date="> '#dateformat(attributes.due_date)#' /*GREATER THAN*/">
		</cfcase>
	</cfswitch>
</cfif>

<cfif listlen(attributes.task_id) GT 1>
	<cfset variables.task_id="">
	<cfloop list="#attributes.task_id#" index="variables.ii">
		<cfif isnumeric(variables.ii)>
			<cfset variables.task_id=listappend(variables.task_id,variables.ii)>
		</cfif>
	</cfloop>
	<cfset attributes.task_id=variables.task_id>
</cfif>

<cfif NOT listlen(attributes.project_id)>
	<cfif isdefined("attributes.project_id_list")>
		<cfset attributes.project_id=attributes.project_id_list>
	<cfelse>
		<cfinclude template="../common_files/qry_get_search_projects.cfm">
		<cfset attributes.project_id=valuelist(get_search_projects.project_id)>
	</cfif>
</cfif>

<cfif listlen(attributes.customer_id)>
	<cfset variables.use_customer_criteria=1>
<cfelse>
	<cfset variables.use_customer_criteria=0>
</cfif>

<cfset variables.counter=0>

<cfquery name="get_task_list" datasource="#application.datasources.main#">
SELECT Task.due_date, Task.task_id, Task.name AS task_name,
	COALESCE(Task.description, 'No description provided.') AS task_description, COALESCE(Task.budgeted_hours,0) AS budgeted_hours, Link_Task_Task_Status.task_status_id,
	REF_Icon.class_name AS task_icon, REF_Priority.description AS priority, COALESCE(Recorded_Hours.used_hours,0) AS used_hours, 
	(Customer.description || '-' || Project.description) AS project_name, Task_Owner.first_name AS task_owner, Task_Owner.last_name || ', ' || Task_Owner.first_name AS task_owner_full_name,
	(CASE
		WHEN Link_Task_Task_Status.task_status_id=3 /* QA */ THEN REF_Task_Status.description || ' by ' || COALESCE(Task_Tester.first_name,'unknown')
		WHEN Link_Task_Task_Status.task_status_id=8 /* UAT */ THEN REF_Task_Status.description || ' by ' || COALESCE(Customer.description,'customer')
		ELSE REF_Task_Status.description
	END) AS task_status
FROM Task
	INNER JOIN Project ON Task.project_id=Project.project_id 
		AND Project.project_id!=#application.application_specific_settings.pto_project_id#<cfif isdefined("attributes.project_id")>
		AND Project.project_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#" list="true" />)</cfif>
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.active_ind=1
		AND Link_Project_Company.company_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#session.workstream_company_id#" list="yes" />)
	INNER JOIN REF_Priority on Task.priority_id=REF_Priority.priority_id
	INNER JOIN REF_Icon ON Task.icon_id=REF_Icon.icon_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1<cfif len(attributes.task_stati)>
		AND Link_Task_Task_Status.task_status_id IN (#attributes.task_stati#)</cfif>
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
	LEFT OUTER JOIN (
		SELECT task_id, SUM(hours) AS used_hours
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
		GROUP BY task_id
	) AS Recorded_Hours ON Task.task_id=Recorded_Hours.task_id
	INNER JOIN (
		SELECT Team.task_id, Demographics.last_name, Demographics.first_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=1 /* owner */<cfif len(attributes.task_owner)>
			AND Team.user_account_id IN (#attributes.task_owner#)</cfif>
	) AS Task_Owner ON Task.task_id=Task_Owner.task_id
	LEFT OUTER JOIN (
		SELECT Team.task_id, Demographics.last_name, Demographics.first_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=3 /* QA */
	) AS Task_Tester ON Task.task_id=Task_Tester.task_id<cfif len(attributes.notes)>
	INNER JOIN (
		SELECT task_id
		FROM Notes
		WHERE Notes.active_ind=1
			AND (1=0<cfloop list="#attributes.notes#" index="variables.notes_ii">
				OR LOWER(Notes.note) LIKE '%#lcase(variables.notes_ii)#%'</cfloop>)
		GROUP BY task_id
	) AS Notes ON Task.task_id=Notes.task_id</cfif>
WHERE 1=1<cfif listlen(attributes.task_id)>
	AND Task.task_id IN (#attributes.task_id#)</cfif><cfif listlen(attributes.task_name)>
	AND (1=0<cfloop list="#attributes.task_name#" index="variables.task_name_ii">
		OR LOWER(Task.name) LIKE '%#lcase(variables.task_name_ii)#%'</cfloop>
	)</cfif><cfif listlen(attributes.description)>
	AND (1=0<cfloop list="#attributes.description#" index="variables.description_ii">
		OR LOWER(Task.description) LIKE '%#lcase(variables.description_ii)#%'</cfloop>)</cfif><cfif len(attributes.task_source)>
	AND Task.created_by IN (#attributes.task_source#)</cfif><cfif attributes.used_by_search_ind>
	AND Task.project_id IN (#attributes.project_id#)</cfif> /*limit to either user's access or search crietria, whichever is less*/<cfif len(attributes.priority_id)>
	AND Task.priority_id IN (#attributes.priority_id#)</cfif><cfif isdate(attributes.date_entered)>
	AND Task.entry_date #preservesinglequotes(variables.date_entered)#</cfif><cfif isdate(attributes.due_date)>
	AND Task.due_date #preservesinglequotes(variables.due_date)#</cfif><cfif isdefined("variables.temp_task_list_order")>
ORDER BY <cfif isdefined("attributes.user_account_id") AND listlen(attributes.user_account_id) GT 1>task_owner, </cfif>#variables.temp_task_list_order#</cfif>
LIMIT 500
</cfquery>
</cfsilent>
