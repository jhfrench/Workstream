
<!--Customers/qry_get_visable_to.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the companies that a code is visible to

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:16  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:15-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	-->#code#:this is the variable that is passed into the query so that there can be a join on the company_id table
	END FUSEDOC --->
<cfquery name="get_visable_to" datasource="#application.datasources.main#">
SELECT Link_Customer_Company.Code, REF_companies.Company, 
    Link_Customer_Company.company_id
FROM Link_Customer_Company
	INNER JOIN REF_companies ON Link_Customer_Company.Visible_to = REF_companies.Company_ID
WHERE code = '#code#'
</cfquery>
<cfquery name="get_other_companies" datasource="#application.datasources.main#">
SELECT Company
FROM REF_Companies
WHERE company NOT IN (#valuelist(get_visable_to.company_id)#)
</cfquery>