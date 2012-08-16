
<!--Customers/qry_get_root_codes.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the root codes for the create new engagement screen.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_root_codes" datasource="#application.datasources.main#">
SELECT Customer.root_code, LTRIM(Customer.description), Customer.customer_id, 
(<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>root_code || ' - ' || LTRIM(Customer.description)<cfelse>LTRIM(Customer.description)|| ' (' || Customer.root_code||')' </cfif>) AS display
FROM Customer, Link_Customer_Company
WHERE Customer.customer_id=Link_Customer_Company.customer_id
	AND Link_Customer_Company.company_id IN (#session.workstream_selected_company_id#,0)
	AND Customer.active_ind=1
GROUP BY Customer.root_code, LTRIM(Customer.description), Customer.customer_id, 
(<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>root_code || ' - ' || LTRIM(Customer.description)<cfelse>LTRIM(Customer.description)|| ' (' || Customer.root_code||')' </cfif>)
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code<cfelse>LTRIM(Customer.description)</cfif>
</cfquery>
</cfsilent>

