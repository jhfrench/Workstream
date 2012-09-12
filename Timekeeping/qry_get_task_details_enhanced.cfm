
<!--Timekeeping/qry_get_task_details_enhanced.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve nearly all details about a task, including dates, hours budgeted, description, name,project, owner and QA.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_details" datasource="#application.datasources.main#">
SELECT Task.task_id, Task.task_type_id, Task.name AS task_name,
	COALESCE(Task.task_read_ind,0) AS task_read_ind, COALESCE(Task.description,'No description recorded for this task.') AS description, Task.entry_date AS date_assigned,
	Task.due_date, Task.complete_date, Task.status_id,
	Task.icon_id, COALESCE(Task.created_by,0) AS created_by, COALESCE(Task_Source.emp_id,0) AS task_source,
	Task.priority_id AS priority, REF_Status.status, COALESCE(Task.budgeted_hours,0) AS budgeted_hours, 
	Time_Used.hours_used,
	CASE
		WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0
		ELSE Time_Used.hours_used/Task.budgeted_hours*200
	END AS image_width, 
	CASE
		WHEN COALESCE(Task.budgeted_hours,0)=0 THEN 0
		ELSE Time_Used.hours_used/Task.budgeted_hours*100
	END AS percent_used,
	Task_Owner.emp_id AS owner_id, Task_QA.emp_id AS qa_id, Customer.description AS customer_name,
	Project.description AS project_name, Project.project_id, Task.notification_frequency_id,
	Task_Source.source_name
FROM Task
	INNER JOIN REF_Status ON Task.status_id=REF_Status.status_id
	INNER JOIN Project ON Task.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	LEFT OUTER JOIN (
		SELECT #attributes.task_id# AS task_id, SUM(Time_Entry.hours) AS hours_used
		FROM Time_Entry
		WHERE active_ind=1
			AND task_id=#attributes.task_id#
	) AS Time_Used ON Task.task_id=Time_Used.task_id
	INNER JOIN (
		SELECT Team.task_id, Team.emp_id, Emp_Contact.lname || ', ' || Emp_Contact.name AS source_name
		FROM Team
			INNER JOIN Emp_Contact ON Team.emp_id=Emp_Contact.emp_id
		WHERE Team.active_ind=1
			AND Team.role_id=5
			AND Team.task_id=#attributes.task_id#
	) AS Task_Source ON Task.task_id=Task_Source.task_id
	INNER JOIN (
		SELECT task_id, emp_id
		FROM Team
		WHERE active_ind=1
			AND role_id=1
			AND task_id=#attributes.task_id#
	) AS Task_Owner ON Task.task_id=Task_Owner.task_id
	INNER JOIN (
		SELECT task_id, emp_id
		FROM Team
		WHERE active_ind=1
			AND role_id=3
			AND task_id=#attributes.task_id#
	) AS Task_QA ON Task.task_id=Task_QA.task_id
WHERE Task.task_id=#attributes.task_id#
</cfquery>
</cfsilent>

