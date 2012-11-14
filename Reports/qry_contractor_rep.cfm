
<!--Reports/qry_contractor_rep.cfm
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
SELECT Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
	REF_Company.description AS company,
	CASE
		WHEN Link_User_Account_Status.account_status_id=1 THEN 'Active'
		ELSE 'Inactive'
	END AS status
FROM View_Demographics_Workstream AS Demographics
	INNER JOIN Demographics ON Demographics.user_account_id=Demographics.user_account_id
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id = REF_Company.company_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
WHERE Demographics.employee_classification_id = 4
	AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
	AND Demographics.effective_to IS NULL
</cfquery>