
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
<cfparam name="variables.stretch_width" default="300">
<cfquery name="operations_blurb" datasource="#application.datasources.main#">
SELECT customer, #variables.stretch_width#*green_count/total_count AS green_stretch, #variables.stretch_width#*yellow_count/total_count AS yellow_stretch, #variables.stretch_width#*red_count/total_count AS red_stretch
FROM (
	SELECT Customer.description AS customer,
		SUM(CASE WHEN ISNULL(status,1)=1 THEN 1 ELSE 0 END)*1.00 AS green_count,
		SUM(CASE WHEN status=2 THEN 1 ELSE 0 END)*1.00 AS yellow_count,
		SUM(CASE WHEN status=3 THEN 1 ELSE 0 END)*1.00 AS red_count,
		COUNT(status) AS total_count
	FROM Project, Customer
	WHERE Project.customer_id=Customer.customer_id
		AND Project.active_ind=1
	AND Project.company_id=#session.workstream_company_id#
		AND ISNULL(Project.status,0) > 0
	GROUP BY Customer.description
) AS Data
ORDER BY customer
</cfquery>
</cfsilent>