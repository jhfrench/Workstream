
<!--Reports/qry_ts_client_count.cfm
	Author: Jeromy F  -->
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
<cfquery name="ts_client_count" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT LEFT(Customers.description,8) AS customer, COUNT(Task.task_id) AS task_count
FROM Task, Project, Customers
WHERE Task.project_id=Project.project_id
	AND Project.customers_id=Customers.customers_id
	AND Task.name LIKE 'TS%'
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY LEFT(Customers.description,8)
ORDER BY task_count DESC
</cfquery>
</cfsilent>

