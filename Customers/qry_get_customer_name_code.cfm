
<!--Customers/qry_get_customer_name_code.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the name and code for the customer so that the user can navigate to the customer's engagement list.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_customer_name_code" datasource="#application.datasources.main#">
SELECT Customer.description, Customer.root_code, Customer.customer_id, (Customer.description || '-' || Project.description) AS project_name, Project.project_code AS project_code
FROM Customer, Project
WHERE Project.customer_id=Customer.customer_id
	AND Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

