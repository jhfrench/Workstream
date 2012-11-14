
<!--Reports/qry_get_project_ie.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the edit project screen, I select the particular project that the user wants to edit.
	||
	Name: Jeromy French
	||
	Edits:
I get the names of IE's on current projects.
	 || 
	END FUSEDOC --->

<cfquery name="get_project_ie" datasource="#application.datasources.main#">
SELECT COALESCE(Demographics.user_account_id,0) AS user_account_id, COALESCE(Demographics.last_name, 'Unassigned') AS last_name
FROM Project
	LEFT OUTER JOIN Demographics ON Demographics.user_account_id=Project.project_manager_id
WHERE status!=0
GROUP BY Demographics.user_account_id, Demographics.last_name
ORDER BY last_name
</cfquery>
<cfquery name="get_project_customers" datasource="#application.datasources.main#">
SELECT Customer.description, Customer.customer_id
FROM Project
	INNER JOIN Customer ON Customer.customer_id=Project.customer_id
WHERE Project.status!=0
GROUP BY Customer.description, Customer.customer_id
ORDER BY Customer.description
</cfquery>
</cfsilent>
