
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
	-->#code#:this is the variable that is passed into the query so that there can be a join on the visible_to table
	END FUSEDOC --->
<cfquery name="get_visable_to" datasource="#application.datasources.main#">
SELECT Customer_Visible_To.Code, REF_companies.Company, 
    Customer_Visible_To.Visible_to
FROM Customer_Visible_To INNER JOIN
    REF_companies ON 
    Customer_Visible_To.Visible_to = REF_companies.Company_ID
where code = '#code#'
</cfquery>
<cfset selected = valuelist(get_visable_to.visible_to)>
<cfquery name="get_other_companies" datasource="#application.datasources.main#">
Select company
from REF_Companies
where company NOT IN (#Quotedvaluelist(get_visable_to.visible_to)#)
</cfquery>