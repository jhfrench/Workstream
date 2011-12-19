
<!--Reports/Qry_get_employees.cfm
	Author: Jeromy F  -->
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
SELECT ISNULL(REF_Employee_Classification.employee_classification, 'None') 
    AS employee_classification, Emp_Contact.Name, Emp_Contact.LName, 
    Demographics.pin, Demographics.emp_id, 
    REF_Company.description AS company, Security.Disable
FROM Emp_Contact
	INNER JOIN Demographics ON Emp_Contact.emp_id = Demographics.emp_id
	INNER JOIN Security ON Emp_Contact.emp_id = Security.emp_id
	INNER JOIN Link_Emp_Contact_Employer ON Emp_Contact.emp_id = Link_Emp_Contact_Employer.emp_id
	INNER JOIN REF_Company ON Link_Emp_Contact_Employer.company_id = REF_Company.company_id
	INNER JOIN Supervisor ON Emp_Contact.emp_id = Supervisor.emp_id
	LEFT OUTER JOIN  REF_Employee_Classification ON Demographics.employee_classification_id = REF_Employee_Classification.employee_classification_id
WHERE (Security.Disable <> 1) AND sup_id = #session.user_account_id# AND (
		(Demographics.effective_from <= #CreateODBCDate(variables.through_date)# AND effective_to >= #CreateODBCDate(variables.from_date)#)      
		OR (effective_to IS NULL AND effective_from  <= #CreateODBCDate(variables.through_date)#)
	)
	ORDER BY LName
</cfquery>
</cfsilent>
