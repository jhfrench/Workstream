
<!--Reports/qry_get_engagement_ie.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am used with the edit engagement screen, I select the particular engagement that the user wants to edit.
	||
	Name: Jeromy French
	||
	Edits:
I get the names of IE's on current engagements.
	 || 
	END FUSEDOC --->

<cfquery name="get_engagement_ie" datasource="#application.datasources.main#">
SELECT COALESCE(Emp_Contact.user_account_id,0) AS user_account_id, COALESCE(Emp_contact.lname, 'Unassigned') AS lname
FROM Project
	LEFT OUTER JOIN Emp_Contact ON Emp_Contact.user_account_id=Project.project_manager_id
WHERE status!=0
GROUP BY Emp_Contact.user_account_id, Emp_contact.lname
ORDER BY lname
</cfquery>
<cfquery name="get_engagement_customers" datasource="#application.datasources.main#">
SELECT Customer.description, Customer.customer_id
FROM Project
	INNER JOIN Customer ON Customer.customer_id=Project.customer_id
WHERE Project.status!=0
GROUP BY Customer.description, Customer.customer_id
ORDER BY Customer.description
</cfquery>
</cfsilent>
