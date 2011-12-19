
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
SELECT fiscal_year, SUM(Revenue_Goal.revenue_goal) AS revenue_goal, SUM(ISNULL(Hourly_Revenue.revenue,0)) AS hourly_revenue,
	SUM(ISNULL(Flat_Revenue.revenue,0)) AS flat_revenue, SUM(ISNULL(Incident_Revenue.revenue,0)) AS incident_revenue
FROM (
		SELECT fiscal_year, SUM(revenue_goal) AS revenue_goal
		FROM Revenue_Goal
		WHERE company_id=#session.workstream_company_id#
			AND fiscal_year <= YEAR(GETDATE())
		GROUP BY fiscal_year
	) AS Revenue_Goal
	LEFT OUTER JOIN (
		SELECT revenue_year, SUM(revenue) AS revenue
		FROM (
			SELECT SUM(Time_Entry.hours * ISNULL(Billing_Rate.rate,0)) AS revenue,
				MONTH(Time_Entry.date) AS revenue_month, YEAR(Time_Entry.date) AS revenue_year
			FROM Time_Entry
				INNER JOIN Link_Company_Emp_Contact ON Time_Entry.emp_id=Link_Company_Emp_Contact.emp_id
				INNER JOIN Billing_Rate ON Time_Entry.emp_id=Billing_Rate.emp_id
					AND Time_Entry.date BETWEEN Billing_Rate.rate_start_date AND Billing_Rate.rate_end_date
				INNER JOIN Project ON Project.project_id=Time_Entry.project_id
					AND Project.project_id=Billing_Rate.project_id
			WHERE Project.billable_type_id=1
				AND Link_Company_Emp_Contact.company_id=#session.workstream_company_id#
			GROUP BY MONTH(Time_Entry.date), YEAR(Time_Entry.date), Project.billable_type_id
			) AS Hour_Revenue
		GROUP BY revenue_year
	) AS Hourly_Revenue ON Revenue_Goal.fiscal_year=Hourly_Revenue.revenue_year
	LEFT OUTER JOIN (
		/*this flat-rate subquery is wrong--it needs to allocate revenue by month so it can be prorated correctly into the timeframe it was earned*/
		SELECT 2011 AS revenue_year, SUM(revenue) AS revenue
		FROM (
			SELECT Flat_Rate.budget, Flat_Rate.rate_start_date, Flat_Rate.rate_end_date,
				DATEDIFF(M, Flat_Rate.rate_start_date, Flat_Rate.rate_end_date)+1 AS amotization_period,
				DATEDIFF(M, 
					CASE
						WHEN Flat_Rate.rate_start_date < CAST('1/1/'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS DATETIME) THEN CAST('1/1/'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS DATETIME)
						ELSE Flat_Rate.rate_start_date
					END, 
					CASE 
						WHEN Flat_Rate.rate_end_date > GETDATE() THEN GETDATE()
						ELSE Flat_Rate.rate_end_date 
					END
				)+1 AS applicable_months,
				Flat_Rate.budget/(DATEDIFF(M, Flat_Rate.rate_start_date, Flat_Rate.rate_end_date)+1)
				*
				(DATEDIFF(M, 
					CASE
						WHEN Flat_Rate.rate_start_date < CAST('1/1/'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS DATETIME) THEN CAST('1/1/'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) AS DATETIME)
						ELSE Flat_Rate.rate_start_date
					END, 
					CASE 
						WHEN Flat_Rate.rate_end_date > GETDATE() THEN GETDATE()
						ELSE Flat_Rate.rate_end_date 
					END
				)+1) AS revenue
			FROM Project
				INNER JOIN Flat_Rate ON Project.project_id=Flat_Rate.project_id
			WHERE Project.billable_type_id=3
		) AS Flat_Rate_Revenue
	) AS Flat_Revenue ON Revenue_Goal.fiscal_year=Flat_Revenue.revenue_year
	LEFT OUTER JOIN (
		SELECT YEAR(Task.entry_date) AS revenue_year, COUNT(Task.task_id)*MIN(ISNULL(Incident_Rate.charge,0)) AS revenue
		FROM Task
			INNER JOIN Project ON Task.project_id=Project.project_id
			INNER JOIN Incident_Rate ON Project.project_id=Incident_Rate.project_id
				AND Task.entry_date BETWEEN Incident_Rate.rate_start_date AND Incident_Rate.rate_end_date
		WHERE Project.billable_type_id=4
			AND Incident_Rate.company_id=#session.workstream_company_id#
		GROUP BY YEAR(Task.entry_date)
	) AS Incident_Revenue ON Revenue_Goal.fiscal_year=Incident_Revenue.revenue_year
GROUP BY Revenue_Goal.fiscal_year
</cfquery>
</cfsilent>

