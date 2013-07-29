
<!--Timekeeping/qry_get_operations_blurb.cfm
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
<cfquery name="get_operations_blurb" datasource="#application.datasources.main#">
SELECT Customer.description AS customer,
	SUM(CASE WHEN COALESCE(Link_Project_Project_Health.project_health_id,2)=1 THEN COALESCE(Project.budget,1) ELSE 0 END) AS blue_count,
	SUM(CASE WHEN Link_Project_Project_Health.project_health_id=2 THEN COALESCE(Project.budget,1) ELSE 0 END) AS green_count,
	SUM(CASE WHEN Link_Project_Project_Health.project_health_id=3 THEN COALESCE(Project.budget,1) ELSE 0 END) AS yellow_count,
	SUM(CASE WHEN Link_Project_Project_Health.project_health_id=4 THEN COALESCE(Project.budget,1) ELSE 0 END) AS red_count,
	SUM(COALESCE(Project.budget,1)) AS total_count
FROM Project
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
	INNER JOIN Link_Project_Project_Health ON Project.project_id=Link_Project_Project_Health.project_id
		AND Link_Project_Project_Health.active_ind=1
WHERE Project.active_ind=1
	AND Project.company_id=<cfqueryparam value="#session.workstream_company_id#" cfsqltype="cf_sql_integer" />
GROUP BY Customer.description
ORDER BY Customer.description
</cfquery>
</cfsilent>