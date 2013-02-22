<!--- $issue$: consolidate with common_files/, Customers/, and Timekeeping/qry_get_open_tasks --->
<!--Customers/qry_get_open_tasks.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfparam name="attributes.project_id" default="0">
<!--- <cfoutput>
<pre>
</pre>
</cfoutput> --->
<cfquery name="get_open_tasks" datasource="#application.datasources.main#">
SELECT Task.task_id, Task.name AS task_name, Task.due_date,
	COALESCE(Task.description, 'No description provided.') AS task_description, COALESCE(Task.budgeted_hours,0) AS time_budgeted, Link_Task_Task_Status.task_status_id,
	(CASE WHEN Link_Task_Task_Status.task_status_id=3 /* QA */ THEN REF_Task_Status.description || ' by ' || QA.last_name ELSE REF_Task_Status.status END) AS task_status, Owner.last_name AS task_owner,
	(Customer.description || '-' || Project.description) AS project_name, Project.project_code<!--- $issue$: poor alias --->, REF_Priority.description AS priority,
	CASE WHEN REF_Icon.path='0' THEN 'document.gif' ELSE REF_Icon.path END AS task_icon, COALESCE(Recorded_Hours.used_hours,0) AS time_used, (COALESCE(CASE WHEN COALESCE(Task.budgeted_hours,0) = 0 THEN 0 ELSE (Recorded_Hours.used_hours/Task.budgeted_hours) END,0)*100) AS percent_time_used
FROM Task
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.company_id IN (#session.workstream_company_id#)
	INNER JOIN REF_Priority ON Task.priority_id=REF_Priority.priority_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
		AND Link_Task_Task_Status.task_status_id!=7 /*exclude closed tasks*/
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
	INNER JOIN (
		SELECT Team.task_id, Team.user_account_id, Demographics.last_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=1
	) AS Owner ON Task.task_id=Owner.task_id
	INNER JOIN (
		SELECT Team.task_id, Team.user_account_id, Demographics.last_name
		FROM Team
			INNER JOIN Demographics ON Team.user_account_id=Demographics.user_account_id
				AND Demographics.active_ind=1
		WHERE Team.active_ind=1
			AND Team.role_id=3
	) AS QA ON Task.task_id=QA.task_id
	INNER JOIN REF_Icon ON Task.icon_id=REF_Icon.icon_id
	LEFT OUTER JOIN (
		SELECT task_id, SUM(hours) AS used_hours
		FROM Time_Entry
		WHERE active_ind=1
		GROUP BY task_id
	) AS Recorded_Hours ON Task.task_id=Recorded_Hours.task_id
WHERE Project.project_id=#attributes.project_id#<cfif isdefined("session.workstream_task_list_order")>
ORDER BY #session.workstream_task_list_order#</cfif>
</cfquery>
