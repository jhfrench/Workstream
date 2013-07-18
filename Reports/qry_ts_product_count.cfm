
<!--Reports/qry_ts_product_count.cfm
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
<cfquery name="ts_product_count" cachedwithin="#createtimespan(attributes.report_cached_within)#" datasource="#application.datasources.main#">
SELECT REF_Product.product_name, COUNT(Task.task_id) AS task_count
FROM Task, Project, REF_Product
WHERE Task.project_id=Project.project_id
	AND Project.product_id=REF_Product.product_id
	AND LOWER(Task.name) LIKE 'ts%'
GROUP BY REF_Product.product_name
ORDER BY task_count DESC
</cfquery>
</cfsilent>

