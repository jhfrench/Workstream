<!--Tools/qry_get_open_tech_supports.cfm
	Author: Jeromy Ftetzer -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query how many tech support tasks are open at any given time.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="qry_get_open_tech_supports" cachedwithin="#createtimespan(0,0,10,0)#" datasource="#application.datasources.main#">
SELECT COUNT(Task.task_id) AS open_tasks
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
WHERE LOWER(Task.name) LIKE 'ts%'
	AND Task.status_id NOT IN (7,9,10) /*completed, on hold, prospective*/
	AND Team.role_id=1
</cfquery>
</cfsilent>