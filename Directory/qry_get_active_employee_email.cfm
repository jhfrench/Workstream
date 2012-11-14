
<!-- Directory/qry_get_active_employee_email.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I query database for employees to send emails to.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- email: string that contains email address of the user
 --->

<cfquery name="get_active_employee_email" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Email.email
FROM Employee
	INNER JOIN Demographics ON Employee.user_account_id=Demographics.user_account_id
		AND Demographics.active_ind=1
	INNER JOIN Email ON Employee.user_account_id=Email.user_account_id
		AND Email.active_ind=1
		AND Email.email_type_id=1
WHERE Employee.active_ind=1
	AND Employee.turnover_date IS NOT NULL
</cfquery>
</cfsilent>
