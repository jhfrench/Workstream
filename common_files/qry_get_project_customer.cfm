
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
SELECT Customer.customer_id, Customer.description
FROM Customer
WHERE customer_id IN (
		SELECT customer_id
		FROM Project
		WHERE Project.active_ind=1
	)
ORDER BY Customer.description
</cfquery>
</cfsilent>
