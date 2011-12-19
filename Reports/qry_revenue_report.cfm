
<!--Reports/qry_revenue_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="revenue_report" datasource="#application.datasources.main#">
SELECT ISNULL(Hour_Revenue.revenue,0) AS hour_revenue, 
	ISNULL(Flat_Revenue.revenue,0) AS flat_revenue,
	ISNULL(Incident_Revenue.revenue,0) AS incident_revenue,
	(ISNULL(Hour_Revenue.revenue,0) + ISNULL(Flat_Revenue.revenue,0) + ISNULL(Incident_Revenue.revenue,0)) AS month_revenue,
	ABCD_Months.month, ABCD_Months.year
FROM ABCD_Months,
	(SELECT SUM(Time_Entry.hours * ISNULL(Billing_Rate.rate,0)) AS revenue,
		MONTH(Time_Entry.date) AS revenue_month, YEAR(Time_Entry.date) AS revenue_year,
		Project.billable_type_id AS billable_type_id
	FROM Time_Entry, Link_Emp_Contact_Employer, Billing_Rate, Project
	WHERE Time_Entry.emp_id=Link_Emp_Contact_Employer.emp_id
		AND Time_Entry.emp_id=Billing_Rate.emp_id
		AND Time_Entry.project_id=Billing_Rate.project_id
		AND Project.project_id=Time_Entry.project_id
		AND Project.billable_type_id=1
		AND Link_Emp_Contact_Employer.company_id IN (#session.workstream_selected_company_id#)
	GROUP BY MONTH(Time_Entry.date), YEAR(Time_Entry.date), Project.billable_type_id)
AS Hour_Revenue,
	(SELECT SUM((ISNULL(Flat_Rate.budget,0)/ISNULL(Months,1))) AS revenue, 
			ABCD_Months.month AS revenue_month, ABCD_Months.year AS revenue_year,
			Project.billable_type_id AS billable_type_id
		FROM ABCD_Months, Flat_Rate, Project
		WHERE Flat_Rate.project_id=Project.project_id
			AND ABCD_Months.start BETWEEN Flat_Rate.start_date AND Flat_Rate.end_date
			AND Flat_Rate.start_date <= GETDATE()
			AND ABCD_Months.start <= GETDATE()
			AND Project.billable_type_id=3
			AND Project.company_id IN (#session.workstream_selected_company_id#)
		GROUP BY ABCD_Months.month, ABCD_Months.year, Project.billable_type_id)
AS Flat_Revenue,
	(SELECT SUM(Temp_Incident.revenue) AS revenue,
			Temp_Incident.revenue_month AS revenue_month, Temp_Incident.revenue_year AS revenue_year
	FROM
		(SELECT ISNULL((COUNT(Task.task_id)*Incident_Rate.charge),0) AS revenue,
				ABCD_Months.month AS revenue_month, ABCD_Months.year AS revenue_year,
				Project.billable_type_id AS billable_type_id
			FROM Task, Project, Incident_Rate, ABCD_Months
			WHERE Project.project_id*=Task.project_id
				AND Project.project_id=Incident_Rate.project_id
				AND YEAR(Task.entry_date)=*ABCD_Months.year
				AND MONTH(Task.entry_date)=*ABCD_Months.month
				AND Project.billable_type_id=4
				AND Project.company_id IN (#session.workstream_selected_company_id#)
			GROUP BY ABCD_Months.month, ABCD_Months.year, Project.billable_type_id, Incident_Rate.charge)
	AS Temp_Incident
GROUP BY Temp_Incident.revenue_month, Temp_Incident.revenue_year)
AS Incident_Revenue
WHERE ABCD_Months.month*=Hour_Revenue.revenue_month
	AND ABCD_Months.year*=Hour_Revenue.revenue_year
	AND ABCD_Months.month*=Flat_Revenue.revenue_month
	AND ABCD_Months.year*=Flat_Revenue.revenue_year
	AND ABCD_Months.month*=Incident_Revenue.revenue_month
	AND ABCD_Months.year*=Incident_Revenue.revenue_year
	AND ABCD_Months.start <= GETDATE()
ORDER BY ABCD_Months.year desc, ABCD_Months.month desc
</cfquery>
</cfsilent>
