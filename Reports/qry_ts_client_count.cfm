
<!--Reports/qry_ts_client_count.cfm
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
<cfquery name="ts_client_count" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT LEFT(Customer.description,8) AS customer, COUNT(Task.task_id) AS task_count
FROM Task, Project, Customer
WHERE Task.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	AND Task.name LIKE 'TS%'
	AND #attributes.report_last_updated#=#attributes.report_last_updated#
GROUP BY LEFT(Customer.description,8)
ORDER BY task_count DESC
</cfquery>
</cfsilent>

