
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
SELECT task.description as task_description, Task.Name, Task.Project_Code, Emp_Contact.Name+' '+ 
    Emp_Contact.LName as task_owner, Task.Project_id, Task.Task_ID
FROM Task
	INNER JOIN Team ON Task.Task_ID = Team.Task_ID
	INNER JOIN Project ON Task.Project_id = Project.project_id
	INNER JOIN Emp_Contact ON Team.Emp_ID = Emp_Contact.Emp_ID
	INNER JOIN Security ON Emp_Contact.Emp_ID = Security.Emp_ID
WHERE (Task.Complete_Date IS NULL)
	AND Team.Roll_ID = 1
	AND Project.project_id = #attributes.project_id#
	AND Security.disable!=1
   </cfquery>
	<cfset task_id = valuelist(tasks_to_inactive.task_id)>
</cfsilent>
