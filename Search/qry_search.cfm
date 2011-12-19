
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
	Revision 1.10  2006/05/31 18:36:05  csy
	task44371 Modified qry to make task search from the home page work

	Revision 1.9  2006-05-10 09:07:54-04  csy
	task 44371  Updated query to allow task search from the home page

	Revision 1.8  2006-05-09 12:00:59-04  csy
	<>

	Revision 1.7  2006-05-03 12:16:50-04  csy
	task42742 Modified code back  so that if a check box is unchecked and item(s) in the corresponding field is/are selected  security is not applied on that field.

	Revision 1.6  2006-04-25 10:07:35-04  french
	Task 42742: Applied security in a way that efficiently uses the data workstream data model (projects are children of customers). Added TOP 500 limitation so that if a user ever neglects to provide criteria for a task search the system won't have to retrieve too many tasks.

	Revision 1.5 2006-04-12 13:00:21-04 csy
	task 42743 Modified code to allow search when a check box is checked and a selection in the associate text box is not made

	Revision 1.4 2006-04-07 12:57:12-04 csy
	task 42742 Modified query to reinforce security

	Revision 1.3 2006-02-13 16:46:32-05 stetzer
	<>

	Revision 1.2 2006-02-13 16:45:36-05 stetzer
	Change Needs Customer Review by in where to IN statement

	Revision 1.1 2005-06-21 10:53:49-04 french
	Modified search query so that it will accept customer criteria. Task 33277

	Revision 1.0 2005-02-15 15:58:29-05 daugherty
	Initial revision
	||
	--> application.datasources.main: string that contains the name of the datasource AS mapped in CF administrator
	--> session.user_account_id: id that identifies user to workstream
	--> session.workstream_show_closed: number that indicates the desire of the user to hide or show tasks which have already been completed; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_on_hold: number that indicates the desire of the user to hide or show tasks which have been put on hold; 1 means include the task, 0 means exclude the task
	--> session.workstream_show_team: number that indicates the desire of the user to hide or show tasks for which they are a member of the task team; 1 means include the task, 0 means exclude the task
	--> session.workstream_task_list_order: list of query columns to ORDER BY
	--> [attributes.emp_id]: emp_id of the peson whose inbox the user wants to see
	<-- billing_code: code which task time will be invoiced to
	<-- date_due: date when task is due
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

<cfif isdefined("attributes.date_entered_box") AND IsDate(attributes.date_entered)>
	<cfswitch expression="#attributes.date_entered_operator#">
		<cfcase value="1">
			<cfset variables.date_entered="< #dateadd('d',1,attributes.date_entered)# /*LESS THAN*/">
		</cfcase>
		<cfcase value="2">
			<cfset variables.date_entered="BETWEEN #createodbcdatetime(attributes.date_entered)# AND #dateadd('d',1,attributes.date_entered)# /*ON SPECIFIED DATE*/">
		</cfcase>
		<cfcase value="3">
			<cfset variables.date_entered="> #createodbcdatetime(attributes.date_entered)# /*GREATER THAN*/">
		</cfcase>
	</cfswitch>
</cfif>

<cfif isdefined("attributes.due_date_box") AND IsDate(attributes.due_date)>
	<cfswitch expression="#attributes.due_date_operator#">
		<cfcase value="1">
			<cfset variables.due_date="< #dateadd('d',1,attributes.due_date)# /*LESS THAN*/">
		</cfcase>
		<cfcase value="2">
			<cfset variables.due_date="BETWEEN #createodbcdatetime(attributes.due_date)# AND #dateadd('d',1,attributes.due_date)# /*ON SPECIFIED DATE*/">
		</cfcase>
		<cfcase value="3">
			<cfset variables.due_date="> #createodbcdatetime(attributes.due_date)# /*GREATER THAN*/">
		</cfcase>
	</cfswitch>
</cfif>

<cfif isdefined("attributes.task_id_box")>
	<cfset variables.task_id="">
	<cfloop list="#attributes.task_id#" index="ii">
		<cfif IsNumeric(ii)>
			<cfset variables.task_id=listappend(variables.task_id,ii)>
		</cfif>
	</cfloop>
	<cfset attributes.task_id=variables.task_id>
</cfif>

<cfif isdefined("attributes.project_id_box") AND len(attributes.project_id)>
	<cfset variables.use_project_criteria=1>
<cfelse>
	<cfset variables.use_project_criteria=0>
</cfif>

<cfif isdefined("attributes.customer_id_box") AND len(attributes.customers_id)>
	<cfset variables.use_customer_criteria=1>
<cfelse>
	<cfset variables.use_customer_criteria=0>
</cfif>

<cfset counter=0>
<cfquery name="task_list" datasource="#application.datasources.main#">
SELECT TOP 500 1 AS constant, Task.due_date AS date_due, Task.task_id AS task_id,
	Task.name AS task_name, ISNULL(Task.description, 'No description provided.') AS task_description,
	ISNULL(Task.budgeted_hours,0) AS time_budgeted, Task.status_id AS status_id, 
	Task_Details.task_id AS task_id, Task_Details.time_used AS time_used, Task_Details.task_icon AS task_icon, 
	Task_Details.percent_time_used AS percent_time_used, Task_Details.task_owner AS task_owner,
	(CASE WHEN Task.status_id IN (4,10) THEN Task_Details.task_status+' by '+Emp_Contact.lname ELSE Task_Details.task_status END) AS task_status,
	(Customers.description+'-'+Project.description) AS project_name, priority
FROM Task, Team, Emp_Contact, Project, Customers,
	(SELECT Path.task_id AS task_id, ISNULL(Recorded_Hours.hours_used,0) AS time_used, Path.path AS task_icon, 
		(ISNULL(CASE WHEN ISNULL(Task.budgeted_hours,0)=0 THEN 0 ELSE (Recorded_Hours.hours_used/Task.budgeted_hours) END,0)*100) AS percent_time_used,
		REF_Status.status AS task_status, Emp_Contact.lname AS task_owner, priority
	FROM Task, REF_Status, Team, Emp_Contact,
		(SELECT Valid_Tasks.task_id AS task_id, CASE WHEN REF_Icon.path='0' THEN 'document.gif' ELSE REF_Icon.path END AS path, priority
			FROM
			<cfif isdefined("attributes.notes_box") AND len(attributes.notes) NEQ 0>(SELECT Notes.task_id, priority
			FROM Notes,
				</cfif>(SELECT Task.task_id, REF_Priority.description AS priority
				FROM Task
					INNER JOIN REF_Priority on Task.priority_id=REF_Priority.priority_id, Team
				WHERE Team.task_id=Task.task_id
				 <cfif attributes.used_by_search>
				   <cfif isdefined("attributes.task_id_box") AND len(attributes.task_id) NEQ 0>
					AND Task.task_id IN (#attributes.task_id#)</cfif>
					<cfelse>
					AND Task.task_id IN(#attributes.task_id#)
					</cfif>
					<cfif isdefined("attributes.task_name_box") AND len(attributes.task_name)>
					AND (<cfloop list="#attributes.task_name#" index="ii"><cfset counter=incrementvalue(counter)>Task.name LIKE '%#ii#%'<cfif counter NEQ listlen(attributes.task_name)> OR </cfif></cfloop>)</cfif><cfif isdefined("attributes.task_owner_box") AND isdefined("attributes.task_owner")>
					AND Team.roll_id=1
					AND Team.emp_id IN (#attributes.task_owner#)</cfif><cfif isdefined("attributes.task_source_box") AND isdefined("attributes.task_source")>
					AND Task.creator IN (#attributes.task_source#)</cfif><cfif attributes.used_by_search>
					AND Task.project_id IN (<cfif variables.use_project_criteria>#attributes.project_id#<cfelse>#attributes.project_id_list#</cfif>)</cfif> /*limit to either user's access or search crietria, whichever is less*/<cfif isdefined("attributes.task_stati_box") AND isdefined("attributes.task_stati")>
					AND Task.status_id IN (#attributes.task_stati#)</cfif><cfif isdefined("attributes.priority_id_box") AND isdefined("attributes.priority_id")>
					AND Task.priority_id IN (#attributes.priority_id#)</cfif><cfif isdefined("variables.date_entered")>
					AND Task.entry_date #PreserveSingleQuotes(variables.date_entered)#</cfif><cfif isdefined("variables.due_date")>
					AND Task.due_date #PreserveSingleQuotes(variables.due_date)#</cfif>
				GROUP BY Task.task_id, REF_Priority.description)<cfif isdefined("attributes.notes_box") AND len(attributes.notes) NEQ 0><cfset counter=0>
			AS Temporary_Tab
			WHERE Notes.task_id=Temporary_Tab.task_id
				AND (<cfloop list="#attributes.notes#" index="ii"><cfset counter=incrementvalue(counter)>Notes.note LIKE '%#ii#%'<cfif counter NEQ listlen(attributes.notes)> OR </cfif></cfloop>)
			GROUP BY Notes.task_id, priority)</cfif>
		AS Valid_Tasks, Task, REF_Icon
		WHERE Valid_Tasks.task_id=Task.task_id AND REF_Icon.icon_id=Task.icon_id)
	AS Path
	LEFT OUTER JOIN
		(SELECT SUM(hours) AS hours_used, task_id AS task_id
		FROM Time_Entry
		GROUP BY task_id)
	AS Recorded_Hours
	ON Path.task_id=Recorded_Hours.task_id
	WHERE Task.task_id=Path.task_id AND REF_Status.status_id=Task.status_id 
		AND Team.roll_id=1 AND Task.task_id=Team.task_id 
		AND Emp_Contact.emp_id=Team.emp_id)
AS Task_Details
WHERE Project.customers_id=Customers.customers_id
	AND Task_Details.task_id=Team.task_id
	AND Task.project_id=Project.project_id 
	AND Task.task_id=Task_Details.task_id
	AND Emp_Contact.emp_id=Team.emp_id
	AND Team.roll_id=3<cfif variables.use_customer_criteria>
	AND Customers.customers_id IN (#attributes.customers_id#) /*if the user specifies customer criteria, limit the results to just those customers*/</cfif>
<cfif isdefined("session.workstream_task_list_order")>ORDER BY #session.workstream_task_list_order#</cfif>
</cfquery>
</cfsilent>
