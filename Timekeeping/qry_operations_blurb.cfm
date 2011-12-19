
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
SELECT Customer.description,
	SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) AS green,
	SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) AS yellow,
	SUM(CASE WHEN status = 3 THEN 1 ELSE 0 END) AS red,
	COUNT(status) AS total
FROM Project, Customer
WHERE Project.customer_id=Customer.customer_id
	AND Project.active_ind=1
	AND Project.company_id=#session.workstream_company_id#
	AND Project.status IS NOT NULL
	AND Project.status > 0
GROUP BY Customer.description
</cfquery>
</cfsilent>

