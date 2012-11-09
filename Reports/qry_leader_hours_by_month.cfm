
<!--Reports/qry_leader_hours_by_month.cfm
	Author: Jeromy F -->
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
SELECT SUM(Time_Entry.Hours) AS sumofhours, EXTRACT(MONTH FROM Time_Entry.work_date) AS month, 
	EXTRACT(YEAR FROM Time_Entry.work_date) AS year, Emp_Contact.lname || ', ' || Emp_Contact.name, 
	(Customer.description || '-' || Project.description || ' (' || Project.project_code || ')') AS clientname
FROM Time_Entry, Emp_Contact, Project, Customer
WHERE Customer.customer_id=Project.customer_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.user_account_id=Emp_Contact.user_account_id
	AND Emp_Contact.user_account_id=#attributes.user_account_id# 
	AND Time_Entry.active_ind=1
	AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month#
	AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
GROUP BY Customer.description, Project.project_code, 
	Emp_Contact.name, Emp_Contact.lname, Project.description, 
	EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date)
ORDER BY clientname
</cfquery>

<cfquery name="Agg_hours_by_week" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname || ', ' || Emp_Contact.name, SUM(Time_Entry.Hours) AS Sumofhours, 
	EXTRACT(MONTH FROM Time_Entry.work_date) AS month, EXTRACT(YEAR FROM Time_Entry.work_date) AS year, 
	EXTRACT(WEEK FROM Time_Entry.work_date) AS week
FROM Emp_Contact, Time_Entry, Project
WHERE Emp_Contact.user_account_id=Time_Entry.user_account_id
	AND Time_Entry.project_id=Project.project_id
	AND Emp_Contact.user_account_id=#attributes.user_account_id#
	AND Time_Entry.active_ind=1
	AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month# 
	AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date), EXTRACT(WEEK FROM Time_Entry.work_date), Emp_Contact.name, Emp_Contact.lname
</cfquery>
</cfsilent>