
<!--Timekeeping/qry_operations_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the data for the operations blurb.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="operations_blurb" datasource="#application.datasources.main#">
SELECT Customer.description AS customer,
	SUM(CASE WHEN COALESCE(status,0)=0 THEN 1 ELSE 0 END) AS blue_count,
	SUM(CASE WHEN status=1 THEN 1 ELSE 0 END) AS green_count,
	SUM(CASE WHEN status=2 THEN 1 ELSE 0 END) AS yellow_count,
	SUM(CASE WHEN status=3 THEN 1 ELSE 0 END) AS red_count,
	COUNT(status) AS total_count
FROM Project
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
WHERE Project.active_ind=1
	AND Project.company_id=#session.workstream_company_id#
GROUP BY Customer.description
ORDER BY Customer.description
</cfquery>
</cfsilent>