
<!--Reports/qry_ts_completion_by_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves the average TS completion time for each customer.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="ts_completion_by_customer" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT Customer.description, AVG(Customer_Completion.completion_turnaround_hours) AS avg_hours
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
	INNER JOIN (
		SELECT Project.customer_id, (DATEDIFF(hour, Task.entry_date, COALESCE(Task.complete_date, CASE WHEN Task.task_status_id!=7 THEN CURRENT_TIMESTAMP ELSE NULL END))) AS completion_turnaround_hours
		FROM Project
			INNER JOIN Task ON Project.project_id=Task.project_id
		WHERE LOWER(Task.name) LIKE 'ts%'
	) AS Customer_Completion ON Customer.customer_id=Customer_Completion.customer_id
WHERE Customer_Completion.completion_turnaround_hours!=0
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY Customer.description
ORDER BY avg_hours
</cfquery>
</cfsilent>