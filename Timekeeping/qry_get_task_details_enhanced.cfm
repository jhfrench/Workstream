
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
	Revision 1.2  2006-11-16 04:16:51  french
	Task 50669: Modified code to make system appear professional again.
	
	Revision 1.1  2001-10-11 10:54:44-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	
	(KL | 9/27/2001) added task_type_id to the select list. 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfif compare(listlast(attributes.fuseaction, '.'),"print_task")>
	<cfset get_print_details=0>
<cfelse>
	<cfset get_print_details=1>
</cfif>
<cfquery name="get_task_details" datasource="#application.datasources.main#">
SELECT Task.task_type_id, Task.task_id AS task_id, Task.name AS task_name, ISNULL(Task.task_read,0) AS task_read, 
	ISNULL(Task.description,'No description recorded for this task.') AS description, 
	Task.entry_date AS date_assigned, Task.due_date AS due_date, Task.complete_date,
	<cfif get_print_details>REF_Status.status<cfelse>Task.status_id</cfif> AS status_id, Task.icon_id AS icon_id,
	ISNULL(Task.creator,0) AS task_creator, ISNULL(Task_Source.emp_id,0) AS task_source,
	<cfif get_print_details>REF_Priority.description<cfelse>Task.priority_id</cfif> AS priority, REF_Status.status AS status,
	ISNULL(Task_Accum.budgeted_hours,0) AS budgeted_hours, Task_Accum.hours_used AS hours_used, 
	Task_Accum.image_width AS image_width, Task_Accum.percent_used AS percent_used,
	Task_Owner.emp_id AS owner_id, Task_QA.emp_id AS qa_id,
	Customers.description AS customer_name, Project.description AS project_name, Project.project_id AS project_id,
	Task.notification_frequency_id, Task_Source.source_name
FROM Task, REF_Status, Project, Customers,<cfif get_print_details> REF_Priority,</cfif>
	(SELECT Task.task_id, Task.budgeted_hours AS budgeted_hours, 
		ISNULL(SUM(Time_Entry.hours),0) AS hours_used, 
		(CASE WHEN ISNULL(Task.budgeted_hours,0)=0 THEN 0 ELSE SUM(Time_Entry.hours)/Task.budgeted_hours*200 END) AS image_width, 
		(CASE WHEN ISNULL(Task.budgeted_hours,0)=0 THEN 0 ELSE SUM(Time_Entry.hours)/Task.budgeted_hours*100 END) AS percent_used
	FROM Time_Entry, Task
	WHERE Task.task_id*=Time_Entry.task_id
		AND Task.task_id=#attributes.task_id#
	GROUP BY Task.task_id, Task.budgeted_hours) AS Task_Accum,
	(SELECT Task.task_id, Team.emp_id AS emp_id, Emp_Contact.lname+', '+Emp_Contact.name AS source_name
	FROM Task, Team, Emp_Contact
	WHERE Task.task_id=Team.task_id
		AND Team.emp_id=Emp_Contact.emp_id
		AND Task.task_id=#attributes.task_id#
		AND Team.roll_id=5) AS Task_Source,
	(SELECT Task.task_id, Team.emp_id AS emp_id
	FROM Task, Team
	WHERE Task.task_id=Team.task_id
		AND Task.task_id=#attributes.task_id#
		AND Team.roll_id=1) AS Task_Owner,
	(SELECT Task.task_id, Team.emp_id AS emp_id
	FROM Task, Team
	WHERE Task.task_id=Team.task_id
		AND Task.task_id=#attributes.task_id#
		AND Team.roll_id=3) AS Task_QA
WHERE Task.task_id=#attributes.task_id#
	AND Task.status_id=REF_Status.status_id
	AND Task.task_id*=Task_Accum.task_id
	AND Task.task_id=Task_Source.task_id
	AND Task.task_id=Task_Owner.task_id
	AND Task.task_id=Task_QA.task_id
	AND Task.project_id=Project.project_id
	AND Project.customers_id=Customers.customers_id
	<cfif get_print_details>AND Task.priority_id=REF_Priority.priority_id
	AND Task.status_id=REF_Status.status_id</cfif>
</cfquery>
</cfsilent>

