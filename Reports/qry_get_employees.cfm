
<!--Reports/Qry_get_employees.cfm
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


<cfquery name="manager" datasource="#application.datasources.main#">
SELECT COALESCE(REF_Employee_Classification.employee_classification, 'None') AS employee_classification, Emp_Contact.Name, Emp_Contact.LName, 
    Demographics.pin, Demographics.emp_id, 
    REF_Company.description AS company, 0 AS disable
FROM Emp_Contact
	INNER JOIN Demographics ON Emp_Contact.emp_id=Demographics.emp_id
	INNER JOIN Link_Company_Emp_Contact ON Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id
	INNER JOIN REF_Company ON Link_Company_Emp_Contact.company_id = REF_Company.company_id
	INNER JOIN Supervisor ON Emp_Contact.emp_id=Supervisor.user_account_id
	LEFT OUTER JOIN  REF_Employee_Classification ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
WHERE supervisor_user_account_id = #session.user_account_id#
	AND (
		(Demographics.effective_from <= #createodbcdate(variables.through_date)# AND effective_to >= #createodbcdate(variables.from_date)#) 
		OR (effective_to IS NULL AND effective_from  <= #createodbcdate(variables.through_date)#)
	)
	ORDER BY LName
</cfquery>
</cfsilent>
