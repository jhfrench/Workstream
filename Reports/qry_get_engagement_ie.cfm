
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
SELECT Emp_contact.Lname,Emp_Contact.Emp_ID 	
FROM Project, Emp_Contact
Where Emp_Contact.Emp_ID = Project.IE_Emp_ID and Status <> 0
Group by Lname, Emp_ID
ORDER BY LName
</cfquery>
<cfquery name="get_engagement_customers" datasource="#application.datasources.main#">
SELECT Customers.Description, Customers.Customers_ID	
FROM Project, Customers
Where Customers.Customers_ID = Project.Customers_ID and Project.Status <> 0
Group by Customers.Description, Customers.Customers_ID
ORDER BY Customers.Description
</cfquery>
</cfsilent>
