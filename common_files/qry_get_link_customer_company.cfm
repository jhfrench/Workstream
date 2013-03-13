<!--common_files/qry_get_link_customer_company.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that a code is visible to

	||
	Edits:
	$Log$
	 || 
	-->attributes.customer_id: this is the variable that is passed into the query so that there can be a join on the company_id table
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_link_customer_company" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.root_code AS root_code, (<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code || '-' || Customer.description<cfelse>Customer.description || ' (' ||  Customer.root_code || ')'</cfif>) AS customer_name
FROM Customer
	INNER JOIN (
		SELECT Link_Customer_Company.customer_id
		FROM Link_Customer_Company
		WHERE Link_Customer_Company.active_ind=1
			AND Link_Customer_Company.company_id IN (<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.customer_id#">)
		GROUP BY Link_Customer_Company.customer_id
	) AS Link_Customer_Company ON Customer.customer_id=Link_Customer_Company.customer_id
WHERE Customer.active_ind=1
ORDER BY customer_name
</cfquery>
<cfset variables.visible_to_company_id=valuelist(get_link_customer_company.company_id)>