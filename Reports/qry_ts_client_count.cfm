
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
	Revision 1.1  2005/03/09 18:14:51  stetzer
	<>

	Revision 1.2  2002-02-25 17:25:03-05  french
	Ordering by descending.

	Revision 1.1  2002-02-25 17:22:40-05  french
	Stipulated the order for displaying results.

	Revision 1.0  2002-01-07 10:37:41-05  french
	Creating tech support report.

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

