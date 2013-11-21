
<!--common_files/qry_get_employee_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the database for the information for the leadership hours report.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfparam name="attributes.user_account_id" default="#variables.user_identification#">
<cfquery name="get_employee_details" datasource="#application.datasources.main#">
SELECT Demographics.last_name, Demographics.first_name, Demographics.uupic,
	Demographics.credentials, Employee.birth_date, Employee.hire_date,
	COALESCE(Employee.photo_path,'nopic.jpg') AS photo_path, Employee.turnover_date, Employee.week_hours,
	Emp_Biography.biography
FROM Demographics
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
	LEFT OUTER JOIN Emp_Biography ON Demographics.user_account_id=Emp_Biography.user_account_id
		AND Emp_Biography.active_ind=1
WHERE Demographics.active_ind=1
	AND Demographics.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
<cfset caller.get_employee_details=get_employee_details>
</cfsilent>