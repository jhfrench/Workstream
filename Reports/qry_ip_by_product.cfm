
<!--Reports/qry_ip_by_product.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves the weekly data for implementations.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:13:52  stetzer
	<>

	Revision 1.1  2001-12-07 17:45:09-05  french
	Added DESC to ip_count order.

	Revision 1.0  2001-12-07 13:58:44-05  french
	Creating Implementation Analysis Report

	||
	<-- ip_count:
	<-- product_name:
	END FUSEDOC --->
<cfquery name="ip_by_product" datasource="#application.datasources.main#">
SELECT REF_Product.product_name, COUNT(Task.task_id) AS ip_count
FROM REF_Product, Project, Task
WHERE REF_Product.product_id=Project.product_id
	AND Project.project_id=Task.project_id
	AND tasks_pre_defined_id=55
	AND complete_date IS NOT NULL
GROUP BY REF_Product.product_name
ORDER BY ip_count DESC
</cfquery>
</cfsilent>

