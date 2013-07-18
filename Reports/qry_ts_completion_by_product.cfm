
<!--Reports/qry_ts_completion_by_product.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="ts_completion_by_product" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT REF_Product.product_name, AVG(Product_Completion.completion_turnaround_hours) AS avg_hours
FROM REF_Product
	INNER JOIN (
		SELECT Project.product_id, (DATEDIFF(hour, Task.entry_date, COALESCE(Task.complete_date, CASE WHEN Link_Task_Task_Status.task_status_id!=7 THEN CURRENT_TIMESTAMP ELSE NULL END))) AS completion_turnaround_hours
		FROM Project
			INNER JOIN Task ON Project.project_id=Task.project_id
			INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
				AND Link_Task_Task_Status.active_ind=1
		WHERE Task.active_ind=1
			AND LOWER(Task.name) LIKE 'ts%'
	) AS Product_Completion ON Product_Completion.product_id=REF_Product.product_id
WHERE #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY REF_Product.product_name
ORDER BY avg_hours
</cfquery>
</cfsilent>

