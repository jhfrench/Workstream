
<!--Reports/qry_leader_hours_by_month.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the database for the information for the leadership hours report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="Agg_hours_by_month" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS sumofhours, MONTH(Time_Entry.Date) AS month, 
	YEAR(Time_Entry.Date) AS year, Emp_Contact.lname + ', ' + Emp_Contact.name AS name, 
	(Customers.description + '-' + Project.description + '(' + Project.project_code + ')') AS clientname
FROM Time_Entry, Emp_Contact, Project, Customers
WHERE Customers.customers_id=Project.customers_id
	AND Time_Entry.Project_id=Project.project_id
	AND Time_Entry.Emp_ID=Emp_Contact.Emp_ID
	AND emp_contact.emp_id=#attributes.emp_id# 
	AND MONTH(time_entry.[date])=#attributes.month#
	AND YEAR(time_entry.[date])=#attributes.year#
GROUP BY Customers.description, Project.project_code, 
	Emp_Contact.name, Emp_Contact.lname, Project.description, 
	MONTH(Time_Entry.Date), YEAR(Time_Entry.Date)
ORDER BY clientname
</cfquery>

<cfquery name="Agg_hours_by_week" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname + ', ' + Emp_Contact.name AS name, SUM(Time_Entry.Hours) AS Sumofhours, 
	MONTH(Time_Entry.date) AS month, YEAR(Time_Entry.date) AS year, 
	DATEPART(WEEK, Time_Entry.Date) AS week
FROM Emp_Contact, Time_Entry, Project
WHERE Emp_Contact.emp_id=Time_Entry.emp_id
	AND Time_Entry.project_id=Project.project_id
	AND Emp_Contact.emp_id=#attributes.emp_id#
	AND MONTH(Time_Entry.date)=#attributes.month# 
	AND YEAR(Time_Entry.date)=#attributes.year#
GROUP BY MONTH(Time_Entry.date), YEAR(Time_Entry.date), DATEPART(WEEK, Time_Entry.Date), Emp_Contact.name, Emp_Contact.lname
</cfquery>
</cfsilent>