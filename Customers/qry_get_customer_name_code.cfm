
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
	Revision 1.1  2006/03/31 15:38:17  csy
	task 42741 Modified code to include engagement code to title

	Revision 1.0  2005-02-15 15:46:07-05  daugherty
	Initial revision

	Revision 1.1  2002-04-22 17:55:29-04  french
	Logic tweaking for project_code reassignment.

	Revision 1.0  2002-01-24 16:27:56-05  french
	Initial file creation.

	||
	END FUSEDOC --->
<cfquery name="get_customer_name_code" datasource="#application.datasources.main#">
SELECT Customers.description, Customers.root_code, Customers.customers_id, (Customers.description + '-' + Project.description) AS project_name, Project.Project_Code AS Project_Code
FROM Customers, Project
WHERE Project.customers_id=Customers.customers_id
	AND Project.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

