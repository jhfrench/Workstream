
<!--Reports/qry_get_engagement_dashboard.cfm
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
SELECT Emp_contact.Lname,Emp_Contact.emp_id 	
FROM Project, Emp_Contact
Where Emp_Contact.emp_id = Project.IE_Emp_ID and Status <> 0
Group by Lname, Emp_ID
ORDER BY LName
</cfquery>
<cfquery name="get_engagement_customers" datasource="#application.datasources.main#">
SELECT Customer.Description, Customer.customer_id	
FROM Project, Customer
Where Customer.customer_id = Project.customer_id and Project.Status <> 0
Group by Customer.Description, Customer.customer_id
ORDER BY Customer.Description
</cfquery>
</cfsilent>
