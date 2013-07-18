
<!--Reports/qry_get_tech_support_client_count.cfm
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
<cfquery name="get_tech_support_client_count" cachedwithin="#createtimespan(attributes.report_cached_within)#" datasource="#application.datasources.main#">
SELECT LEFT(Customer.description,8) AS customer, COUNT(Task.task_id) AS task_count
FROM Task, Project, Customer
WHERE Task.project_id=Project.project_id
	AND Project.customer_id=Customer.customer_id
	AND LOWER(Task.name) LIKE 'ts%'
GROUP BY LEFT(Customer.description,8)
ORDER BY task_count DESC
</cfquery>
</cfsilent>