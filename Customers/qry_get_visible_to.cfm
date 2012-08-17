<!--Customers/qry_get_visible_to.cfm
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
<cfquery name="get_visible_to" datasource="#application.datasources.main#">
SELECT company_id
FROM Link_Customer_Company
WHERE customer_id=#attributes.customer_id#
</cfquery>
<cfset variables.visible_to_company_id=valuelist(get_visible_to.company_id)>