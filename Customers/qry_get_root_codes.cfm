
<!--Customers/qry_get_root_codes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the root codes for the create new project screen.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_root_codes" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.root_code, LTRIM(Customer.description),
	(<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>root_code || ' - ' || LTRIM(Customer.description)<cfelse>LTRIM(Customer.description)|| ' (' || Customer.root_code||')' </cfif>) AS display
FROM Customer
	INNER JOIN Link_Customer_Company ON Customer.customer_id=Link_Customer_Company.customer_id
		AND Link_Customer_Company.company_id IN (#session.workstream_selected_company_id#,0)
		AND Link_Customer_Company.active_ind=1
WHERE Customer.active_ind=1
GROUP BY Customer.customer_id, Customer.root_code, LTRIM(Customer.description),
	display
ORDER BY display
</cfquery>
</cfsilent>
