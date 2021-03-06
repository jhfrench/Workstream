
<!--Directory/qry_get_emp_salary_info.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I see if the current user is allowed to see (or enter) salary information. Only Nucleus employees are restricted from this function. If so, I retrieve employees salary info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_emp_salary_info" datasource="#application.datasources.main#">
SELECT salary_id, salary, created_date,
	date_implemented, salary_change_type_id,
	increase_amount, increase_percent
FROM Salary
WHERE user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" /><cfif session.workstream_company_id NEQ 1>
	AND 1=0</cfif>
ORDER BY salary_id
</cfquery>
</cfsilent>
