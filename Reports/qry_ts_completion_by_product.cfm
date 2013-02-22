
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
<cfquery name="ts_completion_by_product" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT REF_Product.product_name, AVG(Product_Completion.completion_turnaround_hours) AS avg_hours
FROM REF_Product
	INNER JOIN (
		SELECT Project.product_id, (DATEDIFF(hour, Task.entry_date, COALESCE(Task.complete_date, CASE WHEN Task.task_status_id!=7 THEN CURRENT_TIMESTAMP ELSE NULL END))) AS completion_turnaround_hours
		FROM Project
			INNER JOIN Task ON Project.project_id=Task.project_id
		WHERE LOWER(Task.name) LIKE 'ts%'
	) AS Product_Completion ON Product_Completion.product_id=REF_Product.product_id
WHERE #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY REF_Product.product_name
ORDER BY avg_hours
</cfquery>
</cfsilent>

