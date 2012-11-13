
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
	<cfloop list="#attributes.task_id#" index="ii">
		<cfif isnumeric(ii)>
			<cfset variables.task_id=listappend(variables.task_id,ii)>
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

<cfset counter=0>

<cfquery name="task_list" datasource="#application.datasources.main#">
SELECT 1 AS constant, Task.due_date, Task.task_id,
	Task.name AS task_name, COALESCE(Task.description, 'No description provided.') AS task_description,
	COALESCE(Task.budgeted_hours,0) AS time_budgeted, Task.status_id, 
	Task_Details.task_id, Task_Details.time_used, Task_Details.task_icon, 
	Task_Details.percent_time_used, Task_Details.task_owner, Task_Details.task_owner_full,
	(CASE WHEN Task.status_id IN (4,10) THEN Task_Details.task_status || ' by ' || Emp_Contact.lname ELSE Task_Details.task_status END) AS task_status,
	(Customer.description || '-' || Project.description) AS project_name, priority
FROM Task, Team, Emp_Contact, Project, Customer,
	(SELECT Path.task_id, COALESCE(Recorded_Hours.hours_used,0) AS time_used, Path.class_name AS task_icon, 
		(COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
		REF_Status.status AS task_status, Emp_Contact.name AS task_owner, (Emp_Contact.lname || ', ' || Emp_Contact.name) AS task_owner_full,
		priority
	FROM Task, REF_Status, Team, Emp_Contact,
		(SELECT Valid_Tasks.task_id, REF_Icon.class_name, priority
			FROM
			<cfif len(attributes.notes)>(SELECT Notes.task_id, priority
			FROM Notes,
				</cfif>(SELECT Task.task_id, REF_Priority.description AS priority
				FROM Task
					INNER JOIN REF_Priority on Task.priority_id=REF_Priority.priority_id, Team
				WHERE Team.task_id=Task.task_id
					AND Team.active_ind=1<cfif listlen(attributes.task_id)>
					AND Task.task_id IN (#attributes.task_id#)</cfif><cfif listlen(attributes.task_name)>
					AND (<cfloop list="#attributes.task_name#" index="ii">
						<cfset counter=incrementvalue(counter)>LOWER(Task.name) LIKE '%#lcase(ii)#%'<cfif counter NEQ listlen(attributes.task_name)> OR </cfif>
					</cfloop>
					)</cfif><cfif listlen(attributes.description)>
					AND (<cfloop list="#attributes.description#" index="ii"><cfset counter=incrementvalue(counter)>LOWER(Task.description) LIKE '%#lcase(ii)#%'<cfif counter NEQ listlen(attributes.description)> OR </cfif></cfloop>)</cfif><cfif len(attributes.task_owner)>
					AND Team.role_id=1
					AND Team.user_account_id IN (#attributes.task_owner#)</cfif><cfif len(attributes.task_source)>
					AND Task.created_by IN (#attributes.task_source#)</cfif><cfif attributes.used_by_search>
					AND Task.project_id IN (#attributes.project_id#)</cfif> /*limit to either user's access or search crietria, whichever is less*/<cfif len(attributes.task_stati)>
					AND Task.status_id IN (#attributes.task_stati#)</cfif><cfif len(attributes.priority_id)>
					AND Task.priority_id IN (#attributes.priority_id#)</cfif><cfif isdate(attributes.date_entered)>
					AND Task.entry_date #preservesinglequotes(variables.date_entered)#</cfif><cfif isdate(attributes.due_date)>
					AND Task.due_date #preservesinglequotes(variables.due_date)#</cfif>
				GROUP BY Task.task_id, REF_Priority.description)<cfif listlen(attributes.notes) NEQ 0><cfset counter=0>
			AS Temporary_Tab
			WHERE Notes.task_id=Temporary_Tab.task_id
				AND Notes.active_ind=1
				AND (
					<cfloop list="#attributes.notes#" index="ii"><cfset counter=incrementvalue(counter)>LOWER(Notes.note) LIKE '%#lcase(ii)#%'<cfif counter NEQ listlen(attributes.notes)> OR </cfif></cfloop>)
			GROUP BY Notes.task_id, priority)</cfif>
		AS Valid_Tasks, Task, REF_Icon
		WHERE Valid_Tasks.task_id=Task.task_id
			AND REF_Icon.icon_id=Task.icon_id)
	AS Path
	LEFT OUTER JOIN (
		SELECT task_id, SUM(hours) AS hours_used
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
		GROUP BY task_id
	) AS Recorded_Hours ON Path.task_id=Recorded_Hours.task_id
	WHERE Task.task_id=Path.task_id
		AND REF_Status.status_id=Task.status_id 
		AND Team.active_ind=1
		AND Team.role_id=1
		AND Task.task_id=Team.task_id 
		AND Emp_Contact.user_account_id=Team.user_account_id)
AS Task_Details
WHERE Project.customer_id=Customer.customer_id
	AND Task_Details.task_id=Team.task_id
	AND Team.active_ind=1
	AND Team.role_id=3
	AND Task.project_id=Project.project_id 
	AND Task.task_id=Task_Details.task_id
	AND Emp_Contact.user_account_id=Team.user_account_id<cfif variables.use_customer_criteria>
	AND Customer.customer_id IN (#attributes.customer_id#) /*if the user specifies customer criteria, limit the results to just those customers*/</cfif>
<cfif isdefined("session.workstream_task_list_order")>ORDER BY #session.workstream_task_list_order#</cfif>
LIMIT 500
</cfquery>
</cfsilent>
