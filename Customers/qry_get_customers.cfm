
<!--Customers/qry_get_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that drives the customers list, I populate the list and provide information on if there are engagements below the customer code.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:06  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:20-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_customers" datasource="#application.datasources.main#">
SELECT Customers.root_code as clientcode, Customers.description as clientname,
	REF_Active_Indicator.active_ind_type as active, Customers.customers_id,
	(CASE WHEN Drill_Table.root_code IS NOT NULL THEN 1 ELSE 0 END) AS drill
FROM Customers, Customer_Visible_To, REF_Active_Indicator,
	(SELECT root_code as root_code
	FROM Project, Project_Visible_To, REF_Active_Indicator
	WHERE  Project.project_id = Project_Visible_To.project_id
		AND Project.active_id=REF_Active_Indicator.active_ind
		AND LEN(project_code) > 4 
		AND RIGHT(project_code, 3) != '000' 
		AND Project_Visible_To.company_id IN (#session.workstream_company_select_list#)
	GROUP BY Project.root_code)
AS Drill_Table
WHERE Drill_Table.root_code=*Customers.root_code
	AND Customers.root_code=Customer_Visible_To.code
	AND Customers.active_id=REF_Active_Indicator.active_ind
	AND Customer_Visible_To.visible_to IN (#session.workstream_company_select_list#)
	AND Customers.Active_ID<cfif compare(attributes.inactive, 0)> IN (1,2)<cfelse>=2</cfif>
GROUP BY Customers.root_code, Customers.description, REF_Active_Indicator.active_ind_type, Customers.customers_id, Drill_Table.root_code
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customers.root_code<cfelse>Customers.description</cfif>
</cfquery>
</cfsilent>

