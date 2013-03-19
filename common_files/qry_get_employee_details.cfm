
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
SELECT Demographics.last_name || ', ' || Demographics.first_name AS employee, Employee.week_hours
FROM Demographics
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
WHERE Demographics.active_ind=1
	AND Demographics.user_account_id=<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />
</cfquery>
</cfsilent>