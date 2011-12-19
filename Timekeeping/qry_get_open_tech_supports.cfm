<!--Tools/qry_get_open_tech_supports.cfm
	Author: Jeromy Ftetzer  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query how many tech support tasks are open at any given time.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:24:26  stetzer
	<>

	Revision 1.0  2002-07-22 09:19:28-04  peters
	Initial Revision.

	||
	END FUSEDOC --->
<cfquery name="qry_get_open_tech_supports" cachedwithin="#createtimespan(0,0,10,0)#" datasource="#application.datasources.main#">
SELECT COUNT(Task.task_id) AS open_tasks
FROM Task, Project, Customers, Team, Emp_Contact, REF_Status
WHERE Task.project_id=Project.project_id
	AND Project.root_code=Customers.root_code
	AND Task.task_id=Team.task_id
	AND Team.emp_id=Emp_Contact.emp_id
	AND REF_Status.status_id=Task.status_id
	AND Task.name LIKE 'ts%' 
	AND Task.entry_date >= '11/05/01' 
	AND Project.project_code LIKE '6%' 
	AND Task.status_id NOT IN (11,7) 
	AND Team.roll_id=1	
</cfquery>
</cfsilent>