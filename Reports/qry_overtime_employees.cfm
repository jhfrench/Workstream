
<!--Reports/qry_overtime_employees.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the list of people that are elligible for overtime.  For the overtime report imput screen

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_overtime_employees" datasource="#application.datasources.main#"> 
SELECT Demographics.first_name, Demographics.last_name, Demographics.user_account_id
FROM Demographics
	INNER JOIN Demographics ON Demographics.user_account_id=Demographics.user_account_id
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
WHERE Employee.turnover_date IS NULL
	AND Demographics.overtime_elligible_ind=1
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>