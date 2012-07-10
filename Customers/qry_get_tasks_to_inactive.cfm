
<!--Customers/qry_get_tasks_to_inactive.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="tasks_to_inactive" datasource="#application.datasources.main#">
SELECT task.description as task_description, Task.Name, Task.project_code, Emp_Contact.Name||' '|| 
    Emp_Contact.LName as task_owner, Task.project_id, Task.Task_ID
FROM Task
	INNER JOIN Team ON Task.Task_ID = Team.Task_ID
	INNER JOIN Project ON Task.project_id = Project.project_id
	INNER JOIN Emp_Contact ON Team.emp_id = Emp_Contact.emp_id
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
WHERE (Task.Complete_Date IS NULL)
	AND Team.role_id = 1
	AND Project.project_id = #attributes.project_id#
	AND Security.disable!=1
   </cfquery>
	<cfset task_id = valuelist(tasks_to_inactive.task_id)>
</cfsilent>
