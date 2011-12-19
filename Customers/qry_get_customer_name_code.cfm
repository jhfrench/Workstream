
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
SELECT Customers.description, Customers.root_code, Customers.customers_id, (Customers.description + '-' + Project.description) AS project_name, Project.Project_Code AS Project_Code
FROM Customers, Project
WHERE Project.customers_id=Customers.customers_id
	AND Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

