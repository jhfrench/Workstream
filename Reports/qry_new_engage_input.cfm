
<!--Reports/qry_new_engage_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the customers that a user is allowed to see based on the companies they claim membership with (session.workstream_company_select_list).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:19  stetzer
<>

Revision 1.1  2001-10-11 11:03:54-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfquery name="new_engage_input" datasource="#application.datasources.main#">
SELECT Customer.root_code AS root_code, (<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code + ' - ' + Customer.description<cfelse>Customer.description + ' (' + Customer.root_code + ')'</cfif>) AS customer_name
FROM Customer, Link_Customer_Company
WHERE Customer.customer_id=Link_Customer_Company.customer_id
	AND Link_Customer_Company.company_id IN (#session.workstream_company_select_list#)
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code<cfelse>Customer.description</cfif>
</cfquery>
</cfsilent>

