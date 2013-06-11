
<!--Customers/qry_get_customer_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that drives the customers list, I populate the list and provide information on if there are projects below the customer code.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfquery name="get_customer_details" datasource="#application.datasources.main#">
SELECT Customer.customer_id, Customer.root_code, Customer.company_id,
	Customer.description AS clientname, Customer.active_ind, Customer.company_address1,
	Customer.company_address2, Customer.company_city, Customer.company_state,
	Customer.company_zip, Customer.contact_user_account_id, Demographics.first_name,
	Demographics.last_name, REF_Company.description AS company, REF_Active_Indicator.active_ind_type,
	Drill_Table.drill_ind
FROM Customer
	INNER JOIN REF_Company ON Customer.company_id=REF_Company.company_id
	INNER JOIN REF_Active_Indicator ON Customer.active_ind=REF_Active_Indicator.active_ind
	LEFT OUTER JOIN Demographics ON Customer.contact_user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN (
		SELECT Project.customer_id, COALESCE(SUM(Project.active_ind),0) AS drill_ind
		FROM Project
			INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
				AND Link_Project_Company.company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true">)
				AND Link_Project_Company.active_ind=1
		WHERE Project.active_ind=1
			AND LENGTH(Project.project_code) > 4
			AND RIGHT(Project.project_code, 3)!='000'
		GROUP BY Project.customer_id
	) AS Drill_Table ON Customer.customer_id=Drill_Table.customer_id
WHERE <cfif isdefined("attributes.customer_id")>Customer.customer_id=<cfqueryparam value="#attributes.customer_id#" cfsqltype="cf_sql_integer" /><cfelse>Customer.active_ind=<cfqueryparam value="#attributes.active_ind#" cfsqltype="cf_sql_integer" /></cfif>
	AND Customer.customer_id IN (
		SELECT customer_id
		FROM Link_Customer_Company
		WHERE Link_Customer_Company.company_id IN (<cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true">)
			AND Link_Customer_Company.active_ind=1
	)
ORDER BY <cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>Customer.root_code<cfelse>Customer.description</cfif>
</cfquery>
</cfsilent>