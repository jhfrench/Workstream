<!--common_files/qry_get_visible_customers.cfm
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
<cfparam name="attributes.customer_id" default="0">
<cfquery name="get_visible_customers" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.root_code, Customer.description AS customer_name
FROM Customer
	INNER JOIN (
		SELECT Link_Customer_Company.customer_id
		FROM Link_Customer_Company
		WHERE Link_Customer_Company.active_ind=1
			AND Link_Customer_Company.company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true" />)
		GROUP BY Link_Customer_Company.customer_id
	) AS Link_Customer_Company ON Customer.customer_id=Link_Customer_Company.customer_id
WHERE Customer.active_ind=1<cfif attributes.customer_id>
	AND Customer.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer"></cfif>
ORDER BY Customer.sort_order
</cfquery>
<cfset caller.get_visible_customers=get_visible_customers>