
<!--common_files/qry_get_revenue_goal.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get the revenue information.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfquery name="get_revenue_goal" datasource="#application.datasources.main#">
SELECT fiscal_year, SUM(Revenue_Goal.revenue_goal) AS revenue_goal, ROUND(SUM(COALESCE(Hourly_Revenue.revenue,0))) AS hourly_revenue,
	ROUND(SUM(COALESCE(Flat_Revenue.revenue,0))) AS flat_revenue, ROUND(SUM(COALESCE(Incident_Revenue.revenue,0))) AS incident_revenue
FROM (
		SELECT fiscal_year, SUM(revenue_goal) AS revenue_goal
		FROM Revenue_Goal
		WHERE company_id=#session.workstream_company_id#
			AND fiscal_year <= EXTRACT(YEAR FROM CURRENT_DATE)
		GROUP BY fiscal_year
	) AS Revenue_Goal
	LEFT OUTER JOIN (
		SELECT revenue_year, SUM(revenue) AS revenue
		FROM (
			SELECT SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS revenue,
				EXTRACT(MONTH FROM Time_Entry.work_date) AS revenue_month, EXTRACT(YEAR FROM Time_Entry.work_date) AS revenue_year
			FROM Time_Entry
				INNER JOIN Link_Company_User_Account ON Time_Entry.user_account_id=Link_Company_User_Account.user_account_id
				INNER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
					AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
				INNER JOIN Project ON Project.project_id=Time_Entry.project_id
					AND Project.project_id=Billing_Rate.project_id
			WHERE Time_Entry.active_ind=1
				AND Project.billable_type_id=1
				AND Link_Company_User_Account.company_id=#session.workstream_company_id#
			GROUP BY EXTRACT(MONTH FROM Time_Entry.work_date), EXTRACT(YEAR FROM Time_Entry.work_date), Project.billable_type_id
			) AS Hour_Revenue
		GROUP BY revenue_year
	) AS Hourly_Revenue ON Revenue_Goal.fiscal_year=Hourly_Revenue.revenue_year
	LEFT OUTER JOIN 	(
		SELECT date_year AS revenue_year, SUM(earned_days_count/amortization_period*budget) AS revenue
		FROM (
			SELECT REF_Date.date_year, Flat_Rate.flat_rate_id, (COUNT(REF_Date.date_id)-1)/30.4 AS earned_days_count,
				DATE_PART('day', Flat_Rate.rate_end_date-Flat_Rate.rate_start_date)/30.4 AS amortization_period, Flat_Rate.budget
			FROM Project
				INNER JOIN Flat_Rate ON Project.project_id=Flat_Rate.project_id
				INNER JOIN REF_Date ON REF_Date.odbc_date <= CURRENT_TIMESTAMP
					AND REF_Date.odbc_date BETWEEN Flat_Rate.rate_start_date AND Flat_Rate.rate_end_date
			WHERE Project.active_ind=1
				AND Project.billable_type_id=3
				AND Flat_Rate.active_ind=1
			GROUP BY REF_Date.date_year, Flat_Rate.flat_rate_id, Flat_Rate.rate_end_date, Flat_Rate.rate_start_date,
				Flat_Rate.budget
			) AS Flat_Rate_Revenue
		GROUP BY date_year
	) AS Flat_Revenue ON Revenue_Goal.fiscal_year=Flat_Revenue.revenue_year
	LEFT OUTER JOIN (
		SELECT EXTRACT(YEAR FROM Task.entry_date) AS revenue_year, COUNT(Task.task_id)*MIN(COALESCE(Incident_Rate.charge,0)) AS revenue
		FROM Task
			INNER JOIN Project ON Task.project_id=Project.project_id
			INNER JOIN Incident_Rate ON Project.project_id=Incident_Rate.project_id
				AND Task.entry_date BETWEEN Incident_Rate.rate_start_date AND Incident_Rate.rate_end_date
		WHERE Project.billable_type_id=4
			AND Incident_Rate.company_id=#session.workstream_company_id#
		GROUP BY EXTRACT(YEAR FROM Task.entry_date)
	) AS Incident_Revenue ON Revenue_Goal.fiscal_year=Incident_Revenue.revenue_year
GROUP BY Revenue_Goal.fiscal_year
ORDER BY Revenue_Goal.fiscal_year
</cfquery>
</cfsilent>

