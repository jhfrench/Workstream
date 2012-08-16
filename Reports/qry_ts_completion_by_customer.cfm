
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
SELECT LEFT(Customer.description,8) AS description, AVG(Customer_Completion.completion_turnaround_hours) AS avg_hours
FROM Customer, Project,
	(SELECT Project.customer_id, 
		(DATEDIFF(hour, Task.entry_date, COALESCE(Task.complete_date, 
           CASE WHEN status_id != 7 THEN CURRENT_TIMESTAMP 
           ELSE NULL END))) 
           AS completion_turnaround_hours
	FROM Project, Task
	WHERE Project.project_id=Task.project_id
		AND Task.name LIKE 'TS%')
AS Customer_Completion
WHERE Customer_Completion.customer_id=Customer.customer_id
	AND Customer_Completion.completion_turnaround_hours !=0
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY LEFT(Customer.description,8)
ORDER BY avg_hours
</cfquery>
</cfsilent>