
<!--Customers/qry_get_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that drives the customers list, I populate the list and provide information on if there are engagements below the customer code.

	||
	Edits:
	$Log$	 
	||
	END FUSEDOC --->
<!--- $issue$ I have a feeling this query can be simplified --->
<cfquery name="get_customers" datasource="#application.datasources.main#">
SELECT Customer.root_code AS clientcode, Customer.description AS clientname,
	REF_Active_Indicator.active_ind_type AS active, Customer.customer_id,
	(CASE WHEN Drill_Table.root_code IS NOT NULL THEN 1 ELSE 0 END) AS drill
FROM Customer, Link_Customer_Company, REF_Active_Indicator,
	(SELECT Project.customer_id
	FROM Project, Link_Project_Company, REF_Active_Indicator
	WHERE  Project.project_id = Link_Project_Company.project_id
		AND Project.active_ind=REF_Active_Indicator.active_ind
		AND LEN(project_code) > 4 
		AND RIGHT(project_code, 3) != '000' 
		AND Link_Project_Company.company_id IN (#session.workstream_company_select_list#)
	GROUP BY Project.customer_id)
AS Drill_Table
WHERE Drill_Table.customer_id=*Customer.customer_id
	AND Customer.customer_id=Link_Customer_Company.customer_id
	AND Customer.active_ind=REF_Active_Indicator.active_ind
	AND Link_Customer_Company.company_id IN (#session.workstream_company_select_list#)
	AND Customer.active_ind<cfif compare(attributes.inactive, 0)> IN (0,1)<cfelse>=1</cfif>
GROUP BY Customer.root_code, Customer.description, REF_Active_Indicator.active_ind_type,
	Customer.customer_id, Drill_Table.root_code
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code<cfelse>Customer.description</cfif>
</cfquery>
</cfsilent>

