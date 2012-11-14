
<!--Reports/qry_get_annivarsaries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query for the anniversary report.

	 || 
	$Log$
	Revision 1.2  2006/05/02 07:03:21  french
	Added condition to limit results to only one record per employee.

	 || 
	END FUSEDOC --->

<cfquery name="get_annivarsaries" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Employee.hire_date,
	(CURRENT_DATE-Employee.hire_date)/365.0 years_employed, Employee.birth_date
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Link_Company_User_Account ON Employee.user_account_id=Link_Company_User_Account.user_account_id
			AND Link_Company_User_Account.active_ind=1
	AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)
WHERE Employee.active_ind=1
	AND COALESCE(Employee.turnover_date, CURRENT_TIMESTAMP) > CURRENT_DATE
GROUP BY Demographics.first_name, Demographics.last_name, Employee.hire_date, Employee.birth_date
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>
