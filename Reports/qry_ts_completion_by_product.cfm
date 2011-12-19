
<!--Reports/qry_ts_completion_by_product.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves information about currently open tech support tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:14:55  stetzer
	<>

	Revision 1.1  2002-02-25 17:22:41-05  french
	Stipulated the order for displaying results.

	Revision 1.0  2002-01-07 10:37:43-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
<cfquery name="ts_completion_by_product" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT REF_Product.product_name, AVG(Product_Completion.completion_turnaround_hours) AS avg_hours
FROM REF_Product,
	(SELECT Project.product_id, 
		(DATEDIFF(hour, Task.entry_date, ISNULL(Task.complete_date, 
           CASE WHEN status_id != 7 THEN GETDATE() 
           ELSE NULL END))) 
           AS completion_turnaround_hours
	FROM Project, Task
	WHERE Project.project_id=Task.project_id
		AND Task.name LIKE 'TS%')
AS Product_Completion
WHERE Product_Completion.product_id=REF_Product.product_id
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY REF_Product.product_name
ORDER BY avg_hours
</cfquery>
</cfsilent>

