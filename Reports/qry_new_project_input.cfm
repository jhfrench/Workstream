
<!--Reports/qry_new_project_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the customers that a user is allowed to see based on the companies they claim membership with (session.workstream_selected_company_id).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<!--- $issue$: this can be replaced with common_files/qry_get_link_customer_company.cfm or qry_get_visible_customers.cfm --->
<cfquery name="new_project_input" datasource="#application.datasources.main#">
SELECT Customer.root_code, (<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code || '-' || Customer.description<cfelse>Customer.description || ' (' ||  Customer.root_code || ')'</cfif>) AS customer_name
FROM Customer
	INNER JOIN Link_Customer_Company ON Customer.customer_id=Link_Customer_Company.customer_id
		AND Link_Customer_Company.active_ind=1
WHERE Link_Customer_Company.company_id IN (#session.workstream_selected_company_id#)
ORDER BY customer_name
</cfquery>
</cfsilent>