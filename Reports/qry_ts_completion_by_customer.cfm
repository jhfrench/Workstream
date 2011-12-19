
<!--Reports/qry_ts_completion_by_customer.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retrieves the average TS completion time for each customer.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:14:53  stetzer
	<>

	Revision 1.1  2002-02-25 17:22:41-05  french
	Stipulated the order for displaying results.

	Revision 1.0  2002-01-07 10:37:42-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
<cfquery name="ts_completion_by_customer" datasource="#application.datasources.main#" cachedafter="02/02/1978">
SELECT LEFT(Customers.description,8) AS description, AVG(Customer_Completion.completion_turnaround_hours) AS avg_hours
FROM Customers, Project,
	(SELECT Project.customers_id, 
		(DATEDIFF(hour, Task.entry_date, ISNULL(Task.complete_date, 
           CASE WHEN status_id != 7 THEN GETDATE() 
           ELSE NULL END))) 
           AS completion_turnaround_hours
	FROM Project, Task
	WHERE Project.project_id=Task.project_id
		AND Task.name LIKE 'TS%')
AS Customer_Completion
WHERE Customer_Completion.customers_id=Customers.customers_id
	AND Customer_Completion.completion_turnaround_hours !=0
	AND #session.workstream_cache_query#=#session.workstream_cache_query#
GROUP BY LEFT(Customers.description,8)
ORDER BY avg_hours
</cfquery>
</cfsilent>