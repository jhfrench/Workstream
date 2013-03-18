
<!--Directory/qry_get_employee_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	--> application.team_changed: date of the last time Employee or Demographics tables were changed
	--> session.workstream_selected_company_id: id of the companies that the employee wishes to see
	<-- company: id that identifies the user's company
	<-- email: string containing the email address of an employee
	<-- user_account_id: id that identifies user to workstream
	<-- extension: string containing the extension of an employee
	<-- last_name: string containing the last name of an employee
	<-- name: string containing the first name of an employee
	<-- phone_number: string containing the work phone number of an employee
 --->
<cfquery name="get_employee_list" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT (Demographics.last_name || ', ' || Demographics.first_name) AS name,
	Demographics.user_account_id, REF_Company.description AS company,
	COALESCE(Email.email,'NA') AS email, COALESCE(Phone.phone_number,'NA') AS phone_number,
	COALESCE(Phone.extension,'NA') AS extension, Link_User_Account_Employment_Position.employment_position_id
FROM Demographics
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.active_ind=1
		AND Link_Company_User_Account.company_id IN (<cfif listlen(session.workstream_selected_company_id)><cfqueryparam value="#session.workstream_selected_company_id#" cfsqltype="cf_sql_integer" list="true" /><cfelse>0</cfif>)
	INNER JOIN REF_Company ON Link_Company_User_Account.company_id=REF_Company.company_id
	LEFT OUTER JOIN Link_User_Account_Employment_Position ON Demographics.user_account_id=Link_User_Account_Employment_Position.user_account_id
		AND Link_User_Account_Employment_Position.active_ind=1
		AND Link_User_Account_Employment_Position.effective_end_date IS NULL
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
		AND Employee.turnover_date IS NULL
	LEFT OUTER JOIN Email ON Demographics.user_account_id=Email.user_account_id
		AND Email.active_ind=1
		AND Email.email_type_id=1
	LEFT OUTER JOIN Phone ON Demographics.user_account_id=Phone.user_account_id
		AND Phone.active_ind=1
		AND Phone.phone_type_id=1
WHERE Demographics.active_ind=1
	AND <cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#application.team_changed#" cfsqltype="cf_sql_timestamp" />
ORDER BY Link_Company_User_Account.company_id, Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>
