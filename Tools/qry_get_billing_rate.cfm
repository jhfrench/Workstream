
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
<cfquery name="get_billing_rate" datasource="#application.datasources.main#">
SELECT Project.project_id, Project.description, Project.project_start,
	Project.project_end, Project_Manager.first_name AS pm_first_name, Project_Manager.last_name AS pm_last_name,
	Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
	COALESCE(Billing_Rate.billing_rate_id,0) AS billing_rate_id, Billing_Rate.rate, Billing_Rate.rate_start_date,
	GREATEST(Time_Entry.last_work_date, Billing_Rate.rate_end_date) AS rate_end_date, Time_Entry.entry_count
FROM Project
	INNER JOIN Link_Project_Company ON Project.project_id=Link_Project_Company.project_id<!--- $issue$: isn't Link_Project_Company redundant to Link_Customer_Company? --->
		AND Link_Project_Company.active_ind=1
		AND Link_Project_Company.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN Link_Company_User_Account ON Link_Project_Company.company_id=Link_Company_User_Account.company_id
		AND Link_Company_User_Account.active_ind=1
	INNER JOIN Demographics AS Project_Manager ON Project.project_manager_id=Project_Manager.user_account_id
		AND Project_Manager.active_ind=1
	INNER JOIN Demographics ON Link_Company_User_Account.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	LEFT OUTER JOIN Billing_Rate ON Demographics.user_account_id=Billing_Rate.user_account_id
		AND Project.project_id=Billing_Rate.project_id
		AND Billing_Rate.active_ind=1
	LEFT OUTER JOIN (
		SELECT Time_Entry.project_id, Time_Entry.user_account_id, MAX(Time_Entry.work_date) AS last_work_date,
			COUNT(Time_Entry.time_entry_id) AS entry_count
		FROM Time_Entry
		WHERE Time_Entry.active_ind=1
		GROUP BY Time_Entry.project_id, Time_Entry.user_account_id
	) AS Time_Entry ON Project.project_id=Time_Entry.project_id
		AND Demographics.user_account_id=Time_Entry.user_account_id
WHERE Project.active_ind=1
	AND Project.billable_type_id=1
ORDER BY Project.description, Demographics.last_name, Demographics.first_name,
	Billing_Rate.rate_start_date, Billing_Rate.rate_end_date
</cfquery>