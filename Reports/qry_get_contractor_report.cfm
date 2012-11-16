
<!--Reports/qry_get_contractor_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
 <cfquery name="get_Employee_ID" datasource="#application.datasources.main#">
SELECT Employee.user_account_id, Demographics.first_name, Demographics.last_name,
	REF_Company.description AS company,
	CASE
		WHEN Link_User_Account_Status.account_status_id=1 THEN 'Active'
		ELSE 'Inactive'
	END AS status
FROM Employee
	INNER JOIN Demographics ON Demographics.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id = REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
WHERE Employee.active_ind=1
	AND Employee.employee_classification_id=2
	AND Employee.turnover_date IS NULL
</cfquery>