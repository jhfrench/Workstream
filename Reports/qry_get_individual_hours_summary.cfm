
<!--Reports/qry_get_individual_hours_summary.cfm
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

<cfquery name="get_individual_hours_summary" datasource="#application.datasources.main#">
SELECT Demographics.last_name || ', ' || Demographics.first_name AS employee, Time_Entry.hours, (Customer.description || '-' || Project.description || ' (' || Project.project_code || ')') AS project_name,
	EXTRACT(WEEK FROM Time_Entry.work_date) AS work_week
FROM Time_Entry
	INNER JOIN Demographics ON Time_Entry.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Project ON Time_Entry.project_id=Project.project_id
	INNER JOIN Customer ON Project.customer_id=Customer.customer_id
WHERE Time_Entry.active_ind=1
	AND Time_Entry.user_account_id=#attributes.user_account_id# 
	AND EXTRACT(MONTH FROM Time_Entry.work_date)=#attributes.report_month#
	AND EXTRACT(YEAR FROM Time_Entry.work_date)=#attributes.report_year#
</cfquery>

<cfquery name="get_individual_hours_summary_by_client" dbtype="query">
SELECT project_name, SUM(hours) AS hours_worked
FROM get_individual_hours_summary
GROUP BY project_name
ORDER BY SUM(hours) DESC
</cfquery>

<cfquery name="get_individual_hours_summary_by_week" dbtype="query">
SELECT work_week, SUM(hours) AS hours_worked
FROM get_individual_hours_summary
GROUP BY work_week
ORDER BY work_week
</cfquery>
</cfsilent>