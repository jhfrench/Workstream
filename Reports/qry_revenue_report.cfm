
<!--Reports/qry_revenue_report.cfm
	Author: Jeromy F -->
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
	<!--- $issue$: this should be rewritten --->
<cfquery name="revenue_report" datasource="#application.datasources.main#">
SELECT COALESCE(Hour_Revenue.revenue,0) AS hour_revenue, 
	COALESCE(Flat_Revenue.revenue,0) AS flat_revenue,
	COALESCE(Incident_Revenue.revenue,0) AS incident_revenue,
	(COALESCE(Hour_Revenue.revenue,0) + COALESCE(Flat_Revenue.revenue,0) + COALESCE(Incident_Revenue.revenue,0)) AS month_revenue,
	ABCD_Months.month, ABCD_Months.year
FROM ABCD_Months
	LEFT OUTER JOIN (
		SELECT SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS revenue,
			EXTRACT(MONTH FROM Time_Entry.work_date) AS revenue_month, EXTRACT(YEAR FROM Time_Entry.work_date) AS revenue_year,
			Project.billable_type_id
		FROM Time_Entry
			INNER JOIN Link_Company_User_Account ON Time_Entry.user_account_id=Link_Company_User_Account.user_account_id
				AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
				AND Link_Company_User_Account.active_ind=1
			INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
				AND Time_Entry.project_id=Billing_Rate.project_id
				AND Billing_Rate.active_ind=1
			INNER JOIN Project ON Time_Entry.project_id=Project.project_id
				AND Project.billable_type_id=1
				AND Project.active_ind=1
		WHERE Time_Entry.active_ind=1
		GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date), Project.billable_type_id
	) AS Hour_Revenue ON ABCD_Months.month=Hour_Revenue.revenue_month
		AND ABCD_Months.year=Hour_Revenue.revenue_year
	LEFT OUTER JOIN (
		SELECT SUM(COALESCE(Flat_Rate.budget,0)/CEILING(EXTRACT(DAY FROM Flat_Rate.rate_end_date - Flat_Rate.rate_start_date)/30.42)) AS revenue,
			ABCD_Months.month AS revenue_month, ABCD_Months.year AS revenue_year,
			Project.billable_type_id AS billable_type_id
		FROM Flat_Rate
			INNER JOIN Project ON Flat_Rate.project_id=Project.project_id
			INNER JOIN ABCD_Months ON ABCD_Months.start BETWEEN Flat_Rate.rate_start_date AND Flat_Rate.rate_end_date
		WHERE Flat_Rate.active_ind=1
			AND Flat_Rate.rate_start_date <= CURRENT_TIMESTAMP
			AND ABCD_Months.start <= CURRENT_TIMESTAMP
			AND Project.billable_type_id=3
			AND Project.company_id IN (#session.workstream_selected_company_id#)
		GROUP BY ABCD_Months.month, ABCD_Months.year, Project.billable_type_id
	) AS Flat_Revenue ON ABCD_Months.month=Flat_Revenue.revenue_month
		AND ABCD_Months.year=Flat_Revenue.revenue_year
	LEFT OUTER JOIN (
		SELECT SUM(Temp_Incident.revenue) AS revenue,
				Temp_Incident.revenue_month AS revenue_month, Temp_Incident.revenue_year AS revenue_year
		FROM
			(SELECT COALESCE((COUNT(Task.task_id)*Incident_Rate.charge),0) AS revenue,
					ABCD_Months.month AS revenue_month, ABCD_Months.year AS revenue_year,
					Project.billable_type_id AS billable_type_id
				FROM Project
					INNER JOIN Incident_Rate ON Project.project_id=Incident_Rate.project_id
					LEFT OUTER JOIN Task ON Project.project_id=Task.project_id
						AND Task.active_ind=1
					INNER JOIN ABCD_Months ON EXTRACT(YEAR FROM Task.entry_date)=ABCD_Months.year
						AND EXTRACT(MONTH FROM Task.entry_date)=ABCD_Months.month
				WHERE Project.billable_type_id=4
					AND Project.company_id IN (#session.workstream_selected_company_id#)
				GROUP BY ABCD_Months.month, ABCD_Months.year, Project.billable_type_id, Incident_Rate.charge)
		AS Temp_Incident
	GROUP BY Temp_Incident.revenue_month, Temp_Incident.revenue_year
	) AS Incident_Revenue ON ABCD_Months.month=Incident_Revenue.revenue_month
		AND ABCD_Months.year=Incident_Revenue.revenue_year
WHERE ABCD_Months.start <= CURRENT_TIMESTAMP
ORDER BY ABCD_Months.year DESC, ABCD_Months.month DESC
</cfquery>
</cfsilent>
