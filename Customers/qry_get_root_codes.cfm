
<!--Customers/qry_get_root_codes.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the root codes for the create new engagement screen.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:13  daugherty
Initial revision

Revision 1.2  2002-02-13 16:23:37-05  long
added group by to the query to eliminate dulicate records.

Revision 1.1  2001-10-11 10:56:17-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_root_codes" datasource="#application.datasources.main#">
SELECT Customers.root_code, LTRIM(Customers.description), Customers.customers_id, 
(<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>root_code+' - '+LTRIM(Customers.description)<cfelse>LTRIM(Customers.description)+' ('+Customers.root_code+')'</cfif>) AS display
FROM Customers, Customer_Visible_To
WHERE Customers.root_code=Customer_Visible_To.code
	AND Customer_Visible_To.visible_to IN (#session.workstream_company_select_list#,0)
	AND Customers.active_id=2
GROUP BY Customers.root_code, LTRIM(Customers.description), Customers.customers_id, 
(<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>root_code+' - '+LTRIM(Customers.description)<cfelse>LTRIM(Customers.description)+' ('+Customers.root_code+')'</cfif>)
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customers.root_code<cfelse>LTRIM(Customers.description)</cfif>
</cfquery>
</cfsilent>

