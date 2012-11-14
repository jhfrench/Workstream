
<!--Directory/qry_get_employee_details.cfm
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
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
	<-- last_name: string containing the last name of an employee
	<-- fname: string containing the first name of an employee
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_employee_details" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Demographics.uupic,
	Employee.birth_date, Employee.hire_date, COALESCE(Employee.photo_path,'nopic.jpg') AS photo_path,
	Employee.turnover_date, COALESCE(Demographics.credentials,'') AS credentials, Emp_Biography.biography
FROM Demographics
	INNER JOIN Employee ON Demographics.user_account_id=Employee.user_account_id
		AND Employee.active_ind=1
		AND Employee.turnover_date IS NULL
	LEFT OUTER JOIN Emp_Biography ON Demographics.user_account_id=Emp_Biography.user_account_id
		AND Emp_Biography.active_ind=1
WHERE Demographics.active_ind=1<cfif isdefined("attributes.user_account_id") and len(attributes.user_account_id)>
	AND Demographics.user_account_id=#attributes.user_account_id#</cfif>
</cfquery>