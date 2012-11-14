
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
	EXTRACT(YEAR FROM Time_Entry.work_date) AS year, Demographics.last_name || ', ' || Demographics.first_name, 
	(Customer.description || '-' || Project.description || ' (' || Project.project_code || ')') AS clientname
FROM Time_Entry, Demographics, Project, Customer
WHERE Customer.customer_id=Project.customer_id
	AND Time_Entry.project_id=Project.project_id
	AND Time_Entry.user_account_id=Demographics.user_account_id
	AND Demographics.user_account_id=#attributes.user_account_id# 
	AND Time_Entry.active_ind=1
	AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month#
	AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
GROUP BY Customer.description, Project.project_code, 
	Demographics.first_name, Demographics.last_name, Project.description, 
	EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date)
ORDER BY clientname
</cfquery>

<cfquery name="Agg_hours_by_week" datasource="#application.datasources.main#">
SELECT Demographics.last_name || ', ' || Demographics.first_name, SUM(Time_Entry.Hours) AS Sumofhours, 
	EXTRACT(MONTH FROM Time_Entry.work_date) AS month, EXTRACT(YEAR FROM Time_Entry.work_date) AS year, 
	EXTRACT(WEEK FROM Time_Entry.work_date) AS week
FROM Demographics, Time_Entry, Project
WHERE Demographics.user_account_id=Time_Entry.user_account_id
	AND Time_Entry.project_id=Project.project_id
	AND Demographics.user_account_id=#attributes.user_account_id#
	AND Time_Entry.active_ind=1
	AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.month# 
	AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.year#
GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date), EXTRACT(WEEK FROM Time_Entry.work_date), Demographics.first_name, Demographics.last_name
</cfquery>
</cfsilent>