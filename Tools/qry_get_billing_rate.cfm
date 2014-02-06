
<!--Tools/qry_get_billing_rate.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the queries that are used to drive the customer rates grid.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<!--- $issue$: isn't Link_Project_Company redundant to Link_Customer_Company? Get rid of one or the other (Link_Project_Company is more specific). --->
<cfquery name="get_billing_rate" datasource="#application.datasources.main#">
SELECT Project.project_id, Project.description, Project.project_start,
	Project.project_end, Project_Manager.first_name AS pm_first_name, Project_Manager.last_name AS pm_last_name,
	Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
	COALESCE(Billing_Rate.billing_rate_id,0) AS billing_rate_id, Billing_Rate.rate_start_date, Billing_Rate.rate_end_date,
	Billing_Rate.rate, COALESCE(Rateless_Time_Entry.rateless_count,0) AS rateless_count, Rateless_Time_Entry.last_rateless_date,
	COALESCE(Billed_Entries.billed_entry_count,0) AS billed_entry_count, LEAST(Project.project_end-1, Billed_Entries.first_billed_time_entry_date, Rateless_Time_Entry.first_rateless_date) AS max_rate_start_date, GREATEST(Project.project_start+1, Billed_Entries.last_billed_time_entry_date, Rateless_Time_Entry.last_rateless_date) AS min_rate_end_date
FROM Project
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id
		AND Link_Project_Company.active_ind=1
		AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN Link_Company_User_Account ON Link_Project_Company.company_id=Link_Company_User_Account.company_id
		AND Link_Company_User_Account.active_ind=1
	INNER JOIN Demographics AS Project_Manager ON Project.project_manager_id=Project_Manager.user_account_id
		AND Project_Manager.active_ind=1
	INNER JOIN Demographics ON Link_Company_User_Account.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND (Employee.hire_date, COALESCE(Employee.turnover_date, CURRENT_DATE)) OVERLAPS (Project.project_start, Project.project_end)
		AND Employee.active_ind=1
	LEFT OUTER JOIN Billing_Rate ON Demographics.user_account_id=Billing_Rate.user_account_id
		AND Project.project_id=Billing_Rate.project_id
		AND Billing_Rate.active_ind=1
	LEFT OUTER JOIN (
	/*gets data for time entries that can't be billed because we haven't assigned a rate*/
		SELECT Time_Entry.project_id, Time_Entry.user_account_id, COUNT(Time_Entry.Time_entry_id) AS rateless_count,
			MIN(Time_Entry.work_date) AS first_rateless_date, MAX(Time_Entry.work_date) AS last_rateless_date
		FROM Time_Entry
			LEFT OUTER JOIN Billing_Rate ON Time_Entry.user_account_id=Billing_Rate.user_account_id
				AND Time_Entry.project_id=Billing_Rate.project_id
				AND Time_Entry.work_date BETWEEN Billing_Rate.rate_start_date and Billing_Rate.rate_end_date
				AND Billing_Rate.active_ind=1
		WHERE Time_Entry.active_ind=1
			AND COALESCE(Billing_Rate.billing_rate_id,0)=0
		GROUP BY Time_Entry.project_id, Time_Entry.user_account_id
	) AS Rateless_Time_Entry ON Project.project_id=Rateless_Time_Entry.project_id
		AND Demographics.user_account_id=Rateless_Time_Entry.user_account_id
	LEFT OUTER JOIN (
	/*gets oldest time entry that has been billed*/
		SELECT Time_Entry.project_id, Time_Entry.user_account_id, COUNT(Time_Entry.Time_entry_id) AS billed_entry_count,
			MIN(Time_Entry.work_date) AS first_billed_time_entry_date, MAX(Time_Entry.work_date) AS last_billed_time_entry_date
		FROM Time_Entry
			INNER JOIN Link_Invoice_Time_Entry ON Time_Entry.Time_entry_id=Link_Invoice_Time_Entry.Time_entry_id
				AND Link_Invoice_Time_Entry.active_ind=1
		WHERE Time_Entry.active_ind=1
		GROUP BY Time_Entry.project_id, Time_Entry.user_account_id
	) AS Billed_Entries ON Billing_Rate.project_id=Billed_Entries.project_id
		AND Billing_Rate.user_account_id=Billed_Entries.user_account_id
WHERE Project.active_ind=1
	AND Project.billable_type_id=1<cfif isdefined("attributes.project_id")>
	AND Project.project_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.project_id#"></cfif>
	/*only show active employees, or previous employees who still have un-billed time*/
	AND (COALESCE(Employee.turnover_date, NOW()) > CURRENT_DATE
		OR COALESCE(Rateless_Time_Entry.rateless_count,0)!=0)
ORDER BY Project.description, Demographics.last_name, Demographics.first_name,
	Billing_Rate.rate_start_date, Billing_Rate.rate_end_date
</cfquery>