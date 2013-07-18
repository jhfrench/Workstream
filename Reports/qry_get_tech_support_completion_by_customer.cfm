
<!--Reports/qry_get_tech_support_completion_by_customer.cfm
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
<cfquery name="get_tech_support_completion_by_customer" cachedwithin="#createtimespan(attributes.report_cached_within)#" datasource="#application.datasources.main#">
SELECT Customer.description, AVG(EXTRACT(EPOCH FROM COALESCE(Task.complete_date, CASE WHEN Link_Task_Task_Status.task_status_id!=7 THEN CURRENT_TIMESTAMP ELSE NULL END)-Task.entry_date)/3600) AS avg_hours
FROM Task
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN Project ON Task.project_id=Project.project_id
		AND Project.active_ind=1
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
		AND Customer.active_ind=1
WHERE Task.active_ind=1
	AND LOWER(Task.name) LIKE 'ts%'
	AND ( /*either the task is complete, or more than 1 week old*/
		Link_Task_Task_Status.task_status_id=7
		OR CURRENT_TIMESTAMP > Task.entry_date+INTERVAL '1 week')
GROUP BY Customer.description
ORDER BY avg_hours
</cfquery>
</cfsilent>