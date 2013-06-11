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
<cfparam name="attributes.customer_id" default="0">
<cfquery name="get_link_customer_company" datasource="#application.datasources.main#">
SELECT Link_Customer_Company.customer_id, Link_Customer_Company.company_id
FROM Link_Customer_Company
WHERE Link_Customer_Company.active_ind=1
	AND Link_Customer_Company.company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true" />)<cfif attributes.customer_id>
	AND Link_Customer_Company.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer"></cfif>
</cfquery>
<cfset caller.get_link_customer_company=get_link_customer_company>