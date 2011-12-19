
<!--Customers/qry_get_visable_to.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that a code is visible to

	||
	Edits:
	$Log$
	||
	-->#code#:this is the variable that is passed into the query so that there can be a join on the company_id table
	END FUSEDOC --->
<cfquery name="get_visable_to" datasource="#application.datasources.main#">
SELECT Link_Customer_Company.Code, REF_Company.Company, Link_Customer_Company.company_id
FROM Link_Customer_Company
	INNER JOIN REF_Company ON Link_Customer_Company.Visible_to = REF_Company.Company_ID
WHERE code = '#code#'
</cfquery>
<cfquery name="get_other_companies" datasource="#application.datasources.main#">
SELECT company
FROM REF_Company
WHERE company NOT IN (#valuelist(get_visable_to.company_id)#)
</cfquery>