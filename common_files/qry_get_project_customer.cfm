
<!--Reports/qry_get_project_customer.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the names of IE's on current projects.
	||
	Name: Jeromy French
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_project_customer" datasource="#application.datasources.main#">
SELECT Customer.description, Customer.customer_id
FROM Project
	INNER JOIN Customer ON Customer.customer_id=Project.customer_id
WHERE Project.active_ind=1
GROUP BY Customer.description, Customer.customer_id
ORDER BY Customer.description
</cfquery>
</cfsilent>
