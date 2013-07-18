
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
<cfquery name="ts_completion_by_customer" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT Customer.description, AVG(Customer_Completion.completion_turnaround_hours) AS avg_hours
FROM Customer
	INNER JOIN Project ON Customer.customer_id=Project.customer_id
	INNER JOIN (
		SELECT Project.customer_id, (DATEDIFF(hour, Task.entry_date, COALESCE(Task.complete_date, CASE WHEN Link_Task_Task_Status.task_status_id!=7 THEN CURRENT_TIMESTAMP ELSE NULL END))) AS completion_turnaround_hours
		FROM Project
			INNER JOIN Task ON Project.project_id=Task.project_id
			INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
				AND Link_Task_Task_Status.active_ind=1
		WHERE Task.active_ind=1
			AND LOWER(Task.name) LIKE 'ts%'
	) AS Customer_Completion ON Customer.customer_id=Customer_Completion.customer_id
WHERE Customer_Completion.completion_turnaround_hours!=0
	AND #attributes.report_last_updated#=#attributes.report_last_updated#
GROUP BY Customer.description
ORDER BY avg_hours
</cfquery>
</cfsilent>